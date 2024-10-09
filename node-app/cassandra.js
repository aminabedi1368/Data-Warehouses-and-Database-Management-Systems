const express = require('express');
const fs = require('fs');
const path = require('path');
const cassandra = require('cassandra-driver');

const app = express();
const port = 3000;

// تنظیم EJS به عنوان موتور رندر
app.set('view engine', 'ejs');

// تنظیمات اتصال به Cassandra
const client = new cassandra.Client({
    contactPoints: ['localhost'],  // آدرس نودهای Cassandra
    localDataCenter: 'datacenter1',
    keyspace: 'realestate'
});

// تابع برای خواندن کوئری‌ها از فایل‌های داخل پوشه
async function executeQueryFromFile(filePath) {
    const query = fs.readFileSync(filePath, 'utf-8');
    try {
        // اجرای کوئری
        const result = await client.execute(query);
        return result;
    } catch (err) {
        console.error(`Error executing query: ${query}`, err);
        throw err;
    }
}

// روت اصلی برای نمایش لیست فایل‌ها و نتایج کوئری‌ها
app.get('/', async (req, res) => {
    const folderPath = './queries';
    try {
        // لیست تمام فایل‌های داخل پوشه
        const files = fs.readdirSync(folderPath).filter(file => file.endsWith('.cql'));

        // خواندن محتوای فایل‌ها و اجرای کوئری‌ها
        const results = [];
        for (const file of files) {
            const filePath = path.join(folderPath, file);
            const query = fs.readFileSync(filePath, 'utf-8');
            const queryResult = await executeQueryFromFile(filePath);

            results.push({
                fileName: file,
                query: query,
                columns: queryResult.columns.map(col => col.name),
                rows: queryResult.rows
            });
        }

        // رندر صفحه با استفاده از EJS و ارسال نتایج
        res.render('index', { results });
    } catch (err) {
        res.status(500).send('Error reading files or executing queries.');
    }
});

// راه‌اندازی سرور
app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});
