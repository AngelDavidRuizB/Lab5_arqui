FROM python:3.12-slim
WORKDIR /app
RUN pip install --no-cache-dir flask==3.0.3 "psycopg[binary]==3.2.3"
COPY app.py .
EXPOSE 5000
CMD ["flask", "--app", "app", "run", "--host", "0.0.0.0", "--port", "5000"]
