FROM python:3.11-slim as pyhton311

WORKDIR /app

# Fase de instalación de dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Fase de ejecución de la aplicación
FROM pyhton311

WORKDIR /app

COPY app.py .
COPY mongo.py .
COPY model ./model
COPY dao ./dao
COPY templates ./templates
COPY service ./service
COPY static ./static

EXPOSE 5000

ENV MONGO_IP="contenedor_mongo"
ENV MONGO_PORT=27017

CMD ["python", "app.py"]