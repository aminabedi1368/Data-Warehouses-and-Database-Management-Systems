const express = require('express');
const fs = require('fs');
const path = require('path');
const mysql = require('mysql2');

const app = express();
const port = 3000;

// تنظیم EJS به عنوان موتور رندر
app.set('view engine', 'ejs');

// تنظیمات اتصال به MySQL
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',  // نام کاربری MySQL خود را وارد کنید
    password: 'rootpassword',  // کلمه عبور MySQL خود را وارد کنید
    database: 'realestate'  // نام پایگاه داده را وارد کنید
});

// اتصال به MySQL
connection.connect(err => {
    if (err) {
        console.error('Error connecting to MySQL:', err);
        process.exit(1);
    }
    console.log('Connected to MySQL');
});

// تابع برای خواندن و اجرای کوئری‌ها از فایل‌های داخل پوشه
function executeQueryFromFile(filePath) {
    const query = fs.readFileSync(filePath, 'utf-8');
    return new Promise((resolve, reject) => {
        connection.query(query, (err, results, fields) => {
            if (err) {
                console.error(`Error executing query: ${query}`, err);
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

// روت اصلی برای نمایش لیست فایل‌ها و نتایج کوئری‌ها
app.get('/', async (req, res) => {
    const folderPath = './queries';
    try {
        // لیست تمام فایل‌های داخل پوشه
        const files = fs.readdirSync(folderPath).filter(file => file.endsWith('.sql'));

        // خواندن محتوای فایل‌ها و اجرای کوئری‌ها
        const results = [];
        for (const file of files) {
            const filePath = path.join(folderPath, file);
            const queryResult = await executeQueryFromFile(filePath);

            results.push({
                fileName: file,
                query: fs.readFileSync(filePath, 'utf-8'),
                columns: queryResult.columns,
                rows: queryResult.results
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
