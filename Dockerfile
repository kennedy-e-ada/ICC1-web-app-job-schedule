FROM python:3.12-slim



# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y gcc libpq-dev && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy project files
COPY . .

# Expose port (change if your app uses a different port)
EXPOSE 8080

ENV FLASK_APP=application.py

# Run the application
CMD ["flask", "run", "--host=0.0.0.0" , "--port=8080"]
# CMD ["gunicorn", "--bind", "0.0.0.0:8080", "application:app"]
