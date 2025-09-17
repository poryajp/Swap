#!/bin/bash

# ===============================
#  Swap File Creation Script
# ===============================

# دریافت مقدار گیگابایت از کاربر
read -p "مقدار Swap را به گیگابایت وارد کنید: " SIZE_GB

# محاسبه تعداد بلاک‌ها (هر بلاک 1024 بایت)
COUNT=$((SIZE_GB * 1024 * 1024))

echo "در حال ایجاد فایل Swap به اندازه ${SIZE_GB}GB ..."

# مرحله اول: ایجاد فایل swap
sudo dd if=/dev/zero of=/swapfile bs=1024 count=$COUNT status=progress

# مرحله دوم: تنظیم دسترسی‌ها
sudo chmod 600 /swapfile

# مرحله سوم: تنظیم فایل به عنوان ناحیه Swap
sudo mkswap /swapfile

# مرحله چهارم: فعال‌سازی Swap
sudo swapon /swapfile

# اضافه کردن خط به /etc/fstab در صورت عدم وجود
if ! grep -q "^/swapfile" /etc/fstab; then
    echo "/swapfile swap swap defaults 0 0" | sudo tee -a /etc/fstab
fi

# نمایش وضعیت Swap
echo "وضعیت Swap فعال‌شده:"
sudo swapon --show
