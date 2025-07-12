# ==========================================
# MULTI-STAGE DOCKERFILE FOR CI/CD
# ==========================================

# Etapa 1: Build - Preparar dependencias
FROM python:3.9-slim as builder

# Establecer variables de entorno para build
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Instalar dependencias del sistema necesarias para compilar
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Crear directorio de trabajo
WORKDIR /app

# Copiar solo requirements para aprovechar cache de Docker
COPY task_manager/requirements.txt .

# Instalar dependencias de Python en un directorio virtual
RUN pip install --no-cache-dir --user -r requirements.txt

# ==========================================
# Etapa 2: Production - Imagen final
FROM python:3.9-slim as production

# Establecer variables de entorno para producción
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV FLASK_ENV=production
ENV PYTHONPATH=/app

# Instalar solo las dependencias runtime necesarias
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    curl \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Crear usuario no-root para seguridad
RUN useradd --create-home --shell /bin/bash app

# Establecer directorio de trabajo
WORKDIR /app

# Copiar dependencias Python desde la etapa builder
COPY --from=builder /root/.local /home/app/.local

# Copiar el código de la aplicación
COPY task_manager/ .

# Crear directorio para datos con permisos correctos
RUN mkdir -p data logs \
    && chown -R app:app /app \
    && chmod -R 755 /app

# Cambiar al usuario no-root
USER app

# Asegurar que el PATH incluya los binarios de Python del usuario
ENV PATH=/home/app/.local/bin:$PATH

# Verificar que la aplicación puede importarse correctamente
RUN python -c "from app import create_app; print('✅ Application imports successfully')"

# Exponer el puerto 5000
EXPOSE 5000

# Healthcheck para verificar que la aplicación está funcionando
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:5000/tasks || exit 1

# Comando para ejecutar la aplicación
CMD ["python", "run.py"] 