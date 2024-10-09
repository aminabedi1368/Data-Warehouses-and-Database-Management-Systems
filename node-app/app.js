// Dependencies
const express = require('express');
const bodyParser = require('body-parser');
const fs = require('fs');
const path = require('path');
const axios = require('axios');
const cassandra = require('cassandra-driver');
const mysql = require('mysql2');
const { exec } = require('child_process');

// Initialize Express app
const app = express();
const port = 3000;

app.set('view engine', 'ejs');

// Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Spark SQL REST API base URL
const SPARK_SQL_REST_API_URL = 'http://spark_master:4040/api/v1/sql/';

// Cassandra connection setup
const cassandraClient = new cassandra.Client({
    contactPoints: ['cassandra'],
    localDataCenter: 'datacenter1',
    keyspace: 'realestate'
});

// MySQL connection setup
const mysqlConnection = mysql.createConnection({
    host: 'mysql',
    user: 'root',
    password: 'rootpassword',
    database: 'realestate'
});

mysqlConnection.connect(err => {
    if (err) {
        console.error('Error connecting to MySQL:', err);
        process.exit(1);
    }
    console.log('Connected to MySQL');
});

// Utility function to execute Spark SQL queries
const executeSparkQuery = async (query) => {
    try {
        const response = await axios.post(`${SPARK_SQL_REST_API_URL}execute`, { query });
        return response.data;
    } catch (err) {
        console.error('Error executing Spark query:', err);
        return { error: err.message };
    }
};

// Route to execute Spark SQL queries from file
app.post('/execute-spark-query', async (req, res) => {
    const { queryFile } = req.body;

    if (!queryFile) {
        return res.status(400).json({ error: 'No query file provided' });
    }

    const filePath = path.join(__dirname, 'queries', queryFile);

    if (!fs.existsSync(filePath)) {
        return res.status(404).json({ error: 'Query file not found' });
    }

    const query = fs.readFileSync(filePath, 'utf8');
    const result = await executeSparkQuery(query);
    res.json(result);
});

// Route to execute all Spark SQL queries in a directory
app.get('/execute-all-spark-queries', async (req, res) => {
    const queriesDir = path.join(__dirname, 'queries');
    const files = fs.readdirSync(queriesDir);

    const results = [];
    for (const file of files) {
        const filePath = path.join(queriesDir, file);
        const query = fs.readFileSync(filePath, 'utf8');
        const result = await executeSparkQuery(query);
        results.push({ file, result });
    }

    res.json(results);
});

// Function to execute Cassandra query from file
async function executeCassandraQueryFromFile(filePath) {
    const query = fs.readFileSync(filePath, 'utf-8');
    try {
        const result = await cassandraClient.execute(query);
        return result;
    } catch (err) {
        console.error(`Error executing Cassandra query: ${query}`, err);
        throw err;
    }
}

// Route to execute Cassandra queries
app.get('/execute-cassandra-queries', async (req, res) => {
    const folderPath = './queries';
    try {
        const files = fs.readdirSync(folderPath).filter(file => file.endsWith('.cql'));

        const results = [];
        for (const file of files) {
            const filePath = path.join(folderPath, file);
            const queryResult = await executeCassandraQueryFromFile(filePath);

            results.push({
                fileName: file,
                columns: queryResult.columns.map(col => col.name),
                rows: queryResult.rows
            });
        }

        res.json(results);
    } catch (err) {
        res.status(500).send('Error reading or executing Cassandra queries.');
    }
});

// Route to trigger Spark job execution
app.get('/run-spark-job', (req, res) => {
    exec(`docker exec spark_worker /bin/bash -c "spark-submit --packages com.datastax.spark:spark-cassandra-connector_2.12:3.3.0 /opt/bitnami/spark/realestate_queries.py"`,
        (error, stdout, stderr) => {
            if (error) {
                console.error(`Error executing Spark job: ${error}`);
                return res.status(500).send('Error running Spark job');
            }

            const tables = stdout.split('\n\n').map(table => table.trim()).filter(table => table.length > 0);

            const processTable = (table) => {
                const lines = table.split('\n').map(line => line.trim()).filter(line => line.length > 0);
                const header = lines.find(line => line.includes('|')).split('|').map(col => col.trim()).filter(col => col.length > 0);
                const dataLines = lines.filter(line => !line.includes('+') && line.includes('|'));

                return dataLines.map(row => {
                    const values = row.split('|').map(v => v.trim()).filter(v => v.length > 0);
                    let obj = {};
                    header.forEach((key, index) => {
                        obj[key] = values[index] || null;
                    });
                    return obj;
                });
            };

            const jsonResults = tables.map(table => processTable(table)).filter(result => result.length > 0);
            res.json(jsonResults);
        });
});

// Function to execute MySQL query from file
function executeMySQLQueryFromFile(filePath) {
    const query = fs.readFileSync(filePath, 'utf-8');
    return new Promise((resolve, reject) => {
        mysqlConnection.query(query, (err, results, fields) => {
            if (err) {
                console.error(`Error executing MySQL query: ${query}`, err);
                reject(err);
            } else {
                resolve({
                    results,
                    columns: fields.map(field => field.name)
                });
            }
        });
    });
}

// Route to execute MySQL queries
app.get('/execute-mysql-queries', async (req, res) => {
    const folderPath = './queries';
    try {
        const files = fs.readdirSync(folderPath).filter(file => file.endsWith('.sql'));

        const results = [];
        for (const file of files) {
            const filePath = path.join(folderPath, file);
            const queryResult = await executeMySQLQueryFromFile(filePath);

            results.push({
                fileName: file,
                query: fs.readFileSync(filePath, 'utf-8'),
                columns: queryResult.columns,
                rows: queryResult.results
            });
        }

        res.json(results);
    } catch (err) {
        res.status(500).send('Error reading or executing MySQL queries.');
    }
});


app.get('/', async (req, res) => {
    const folderPath = './queries';
    try {
        // لیست تمام فایل‌های داخل پوشه
        const files = fs.readdirSync(folderPath).filter(file => file.endsWith('.sql'));

        const results = [];
        for (const file of files) {
            const filePath = path.join(folderPath, file);
            
            // لاگ کردن نام فایل
            console.log(`Reading and executing query from file: ${file}`);

            try {
                const queryResult = await executeMySQLQueryFromFile(filePath);

                results.push({
                    fileName: file,
                    query: fs.readFileSync(filePath, 'utf-8'),
                    columns: queryResult.columns,
                    rows: queryResult.results
                });
            } catch (err) {
                // لاگ کردن ارور و نام فایل
                console.error(`Error executing query from file: ${file}`, err);
                results.push({
                    fileName: file,
                    error: `Error executing query: ${err.message}`
                });
            }
        }

        // رندر صفحه با استفاده از EJS و ارسال نتایج
        res.render('index', { results });
    } catch (err) {
        console.error('Error reading files or executing queries.', err);
        res.status(500).send('Error reading files or executing queries.');
    }
});


// Start the server
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
