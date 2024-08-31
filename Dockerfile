FROM python:3.12

# Dependencies Intall and Update
RUN apt-get update && apt-get install -y \
    build-essential \
    libsm6 \
    libxext6 \
    libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

# Python Dependencies
RUN pip install notebook

# Copy requirements
COPY requirements.txt /tmp/requirements.txt

# Install Python Dependencies
RUN pip install -r /tmp/requirements.txt

WORKDIR /hdt

EXPOSE 8888

# Comando para ejecutar Jupyter Notebook y mantener el contenedor corriendo
CMD ["sh", "-c", "jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root && tail -f /dev/null"]
