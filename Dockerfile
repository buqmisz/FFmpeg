FROM jrottenberg/ffmpeg:6.1-ubuntu

# اختياري: نسخ ملفات إن أردت استخدامها
# COPY ./some-folder /app

# يمكنك تحديد الأمر الذي تريده كـ default
CMD ["ffmpeg", "-version"]
