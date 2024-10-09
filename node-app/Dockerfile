# استفاده از تصویر Node.js به عنوان base image
FROM node:16

# تنظیم دایرکتوری کاری در داخل کانتینر
WORKDIR /usr/src/app

# کپی کردن package.json و package-lock.json برای نصب وابستگی‌ها
COPY package.json ./

# نصب وابستگی‌ها
RUN npm install

# کپی کردن تمامی فایل‌های پروژه به کانتینر
COPY . .

# باز کردن پورت مورد استفاده اپلیکیشن
EXPOSE 3000

# فرمان پیش‌فرض برای اجرای اپلیکیشن
CMD ["node", "app.js"]
