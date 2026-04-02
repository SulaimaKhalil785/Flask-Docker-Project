# 1. Base image (lightweight)
FROM python:3.11-slim

# 2. Set working directory
WORKDIR /app

# 3. Copy dependencies
COPY requirements.txt .

# 4. Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy project files
COPY . .

# 6. Expose port
EXPOSE 5000

# 7. Run app with gunicorn (production)
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "run:app"]