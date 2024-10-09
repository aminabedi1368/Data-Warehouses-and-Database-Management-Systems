const express = require('express');
const { exec } = require('child_process');

const app = express();
const port = 3000;

// Endpoint to trigger Spark job
app.get('/run-spark-query', (req, res) => {
    exec(`docker exec spark_worker /bin/bash -c "spark-submit --packages com.datastax.spark:spark-cassandra-connector_2.12:3.3.0 /opt/bitnami/spark/realestate_queries.py"`,
        (error, stdout, stderr) => {
            if (error) {
                console.error(`Error executing Spark job: ${error}`);
                res.status(500).send('Error running query');
                return;
            }

            console.log(`Spark job output: ${stdout}`);
            res.send(`Query results:\n${stdout}`);
        });
});

const { exec } = require('child_process');

app.get('/run-spark-query1', (req, res) => {
    exec(`docker exec spark_worker /bin/bash -c "spark-submit --packages com.datastax.spark:spark-cassandra-connector_2.12:3.3.0 /opt/bitnami/spark/realestate_queries.py"`,
        (error, stdout, stderr) => {
            if (error) {
                console.error(`Error executing Spark job: ${error}`);
                res.status(500).send('Error running query');
                return;
            }

            // جدا کردن بخش‌های مختلف خروجی
            const tables = stdout.split('\n\n').map(table => table.trim()).filter(table => table.length > 0);

            // تابع برای پردازش یک جدول
            const processTable = (table) => {
                // جدا کردن هدرها
                const lines = table.split('\n').map(line => line.trim()).filter(line => line.length > 0);
                const header = lines.find(line => line.includes('|')).split('|').map(col => col.trim()).filter(col => col.length > 0);

                // حذف خطوطی که فقط حاوی نشانه‌گذاری هستند
                const dataLines = lines.filter(line => !line.includes('+') && line.includes('|'));

                if (header.length === 0 || dataLines.length === 0) return [];

                return dataLines.map(row => {
                    const values = row.split('|').map(v => v.trim()).filter(v => v.length > 0);
                    let obj = {};
                    header.forEach((key, index) => {
                        obj[key] = values[index] || null;
                    });
                    return obj;
                });
            };

            // پردازش جداول مختلف
            const jsonResults = tables.map(table => processTable(table)).filter(result => result.length > 0);

            // ارسال نتیجه به صورت JSON
            res.json(jsonResults);
        });
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
