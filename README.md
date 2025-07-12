# 🚀 Task Manager - Sistema de Gestión de Tareas con IA

**Fuente**: Arial 12  
**Interlineado**: 1.5

## 📋 Descripción del Proyecto

**Task Manager** es una aplicación web empresarial desarrollada en **Flask** que permite la gestión completa de tareas a partir de historias de usuario, integrada con **Azure OpenAI** para automatización inteligente y análisis de riesgos. La aplicación está completamente containerizada con **Docker** y cuenta con un pipeline de **CI/CD** automatizado usando **GitHub Actions**.

### 🎯 Características Principales

- **Gestión Completa de Tareas**: CRUD completo con 23 endpoints activos
- **Inteligencia Artificial**: Integración con Azure OpenAI para generación automática de descripciones, categorización, estimación de esfuerzo y análisis de riesgos
- **Historias de Usuario**: Metodología ágil con puntos de historia y estimación de horas
- **Base de Datos Híbrida**: Soporte para Azure MySQL con fallback a JSON
- **Interfaz Responsiva**: Bootstrap 5 con gráficos estadísticos usando Chart.js
- **Sistema de Testing**: 35 tests automatizados con pytest (94.3% de éxito)
- **Containerización**: Docker multi-stage optimizado para producción
- **CI/CD**: Pipeline automatizado con GitHub Actions

---

## 🏗️ Arquitectura de la Aplicación

### **Estructura de Directorios**

```
task_manager/
├── app/
│   ├── controllers/        # Lógica de negocio
│   ├── database/          # Conexión y migraciones BD
│   ├── models/            # Modelos de datos
│   ├── routes/            # Rutas/endpoints
│   ├── schemas/           # Esquemas de validación
│   ├── services/          # Servicios (IA, etc.)
│   ├── templates/         # Plantillas HTML
│   └── utils/             # Utilidades
├── config.py              # Configuración
├── run.py                 # Punto de entrada
└── requirements.txt       # Dependencias
```

### **Componentes Principales**

#### **1. Modelos de Datos**
- **Task**: Modelo principal de tareas
- **UserStory**: Historias de usuario (metodología ágil)
- **TaskDB/UserStoryDB**: Modelos para base de datos

#### **2. Controladores**
- **TaskController**: CRUD de tareas + funciones de IA
- **UserStoryController**: Gestión de historias de usuario
- **AIController**: Servicios de inteligencia artificial

#### **3. Rutas/Endpoints**
- **task_routes**: API REST para tareas
- **user_story_routes**: API para historias de usuario
- **ai_routes**: Endpoints específicos de IA

---

## 🔧 Tecnologías Utilizadas

### **Backend**
- **Flask 2.0.1**: Framework web principal
- **SQLAlchemy 1.4.23**: ORM para base de datos
- **Azure OpenAI**: Servicios de inteligencia artificial
- **Azure MySQL**: Base de datos principal
- **Pydantic 2.5.0**: Validación de datos

### **Frontend**
- **Bootstrap 5**: Framework CSS responsivo
- **Chart.js**: Gráficos estadísticos
- **JavaScript ES6+**: Interactividad
- **AJAX/Fetch**: Comunicación asíncrona

### **DevOps**
- **Docker**: Containerización
- **Docker Compose**: Orquestación local
- **GitHub Actions**: CI/CD Pipeline
- **pytest**: Testing automatizado

---

## 🐳 Instrucciones de Despliegue

### **Opción 1: Usar Imagen desde Docker Hub**

```bash
# Descargar y ejecutar la imagen
docker pull edwinumana/task-manager:latest
docker run -p 5000:5000 edwinumana/task-manager:latest
```

### **Opción 2: Construir Localmente**

```bash
# Clonar el repositorio
git clone https://github.com/edwinumana/task_manager.git
cd task_manager

# Construir y ejecutar con Docker Compose
docker-compose up --build -d
```

### **Opción 3: Desarrollo Local**

```bash
# Instalar dependencias
cd task_manager
pip install -r requirements.txt

# Ejecutar aplicación
python run.py
```

### **Acceso a la Aplicación**

Una vez desplegada, la aplicación estará disponible en:
- **URL**: http://localhost:5000
- **Puerto**: 5000

---

## 🔄 Pipeline CI/CD

### **Configuración de GitHub Actions**

El pipeline automatizado se ejecuta en las siguientes situaciones:
- **Push** a las ramas `main`, `master`, `develop`
- **Pull Request** a `main` o `master`
- **Ejecución manual** desde GitHub

### **Etapas del Pipeline**

#### **1. 🧪 Testing**
- Instalación de dependencias del sistema
- Ejecución de tests con pytest
- Generación de reportes de cobertura
- Subida de artefactos de testing

#### **2. 🐳 Build**
- Construcción de imagen Docker
- Pruebas de salud de la aplicación
- Verificación de funcionalidad
- Guardado de imagen como artefacto

#### **3. 🚀 Push to Docker Hub**
- Autenticación con Docker Hub
- Generación de tags automáticos
- Subida de múltiples versiones
- Verificación de subida exitosa

#### **4. ✅ Verification**
- Descarga de imagen desde Docker Hub
- Pruebas de despliegue
- Verificación de funcionalidad
- Reporte de estado final

### **Configuración de Secretos**

Para configurar el pipeline, agregar estos secretos en GitHub:

```
DOCKER_USERNAME: tu-usuario-docker-hub
DOCKER_PASSWORD: tu-token-docker-hub
```

**Pasos para configurar secretos:**

1. Ir a tu repositorio en GitHub
2. Navegar a **Settings** > **Secrets and variables** > **Actions**
3. Hacer clic en **New repository secret**
4. Agregar `DOCKER_USERNAME` con tu usuario de Docker Hub
5. Agregar `DOCKER_PASSWORD` con tu token de Docker Hub

---

## 📊 Sistema de Testing

### **Estadísticas de Testing**
- **Total de tests**: 35
- **Tests exitosos**: 33
- **Tasa de éxito**: 94.3%
- **Cobertura**: Tests independientes al 100%

### **Categorías de Tests**
- **Tests independientes**: 18/18 ✅ (Core functionality)
- **Tests de modelos**: 13/15 ✅ (Data models)
- **Tests básicos**: 4/6 ✅ (Basic functionality)

### **Ejecutar Tests Localmente**

```bash
# Tests completos
cd task_manager
python -m pytest tests/ -v

# Tests específicos
python -m pytest tests/test_core_isolated.py -v

# Tests con cobertura
python -m pytest tests/ --cov=app --cov-report=html
```

---

## 🌐 Funcionalidades Principales

### **Gestión de Tareas**
- **CRUD Completo**: Crear, leer, actualizar, eliminar tareas
- **Estados**: Pendiente, En Progreso, En Revisión, Completada
- **Prioridades**: Baja, Media, Alta, Bloqueante
- **Categorización**: 15 categorías especializadas

### **Inteligencia Artificial**
- **Generación Automática**: Descripciones inteligentes
- **Categorización**: Clasificación automática por tipo
- **Estimación**: Cálculo de horas de esfuerzo
- **Análisis de Riesgos**: Identificación de riesgos potenciales
- **Planes de Mitigación**: Estrategias de reducción de riesgos

### **Historias de Usuario**
- **Metodología Ágil**: Gestión completa de user stories
- **Puntos de Historia**: Estimación ágil
- **Generación de Tareas**: Creación automática desde historias
- **Trazabilidad**: Relación entre historias y tareas

### **Estadísticas y Reportes**
- **Dashboard**: Visualización de métricas clave
- **Gráficos**: Distribución por estado, categoría, prioridad
- **Análisis**: Tendencias y patrones de trabajo
- **Exportación**: Datos en formato JSON

---

## 🔐 Configuración de Variables de Entorno

### **Variables Requeridas**

```env
# Configuración básica
SECRET_KEY=tu-clave-secreta-aqui
FLASK_ENV=production

# Azure OpenAI (opcional)
AZURE_OPENAI_API_KEY=tu-api-key
AZURE_OPENAI_ENDPOINT=tu-endpoint
AZURE_OPENAI_API_VERSION=2023-05-15
AZURE_OPENAI_DEPLOYMENT_NAME=tu-deployment

# Azure MySQL (opcional)
AZURE_MYSQL_CONNECTION_STRING=tu-string-conexion
AZURE_MYSQL_SSL_CA=path-to-ca-cert
AZURE_MYSQL_SSL_VERIFY=true

# Configuración IA
TEMPERATURE=0.5
MAX_TOKENS=500
TOP_P=0.2
```

### **Configuración en Docker**

```bash
# Con archivo .env
docker run --env-file .env -p 5000:5000 edwinumana/task-manager:latest

# Con variables individuales
docker run -e SECRET_KEY=mi-clave -e FLASK_ENV=production -p 5000:5000 edwinumana/task-manager:latest
```

---

## 🚀 Comandos Útiles

### **Docker**

```bash
# Construir imagen
docker build -t task-manager .

# Ejecutar contenedor
docker run -p 5000:5000 task-manager

# Ver logs
docker logs container-name

# Acceder al contenedor
docker exec -it container-name /bin/bash

# Limpiar imágenes
docker system prune -a
```

### **Docker Compose**

```bash
# Iniciar servicios
docker-compose up -d

# Ver logs
docker-compose logs -f

# Detener servicios
docker-compose down

# Reconstruir
docker-compose build --no-cache
```

### **Desarrollo**

```bash
# Instalar dependencias
pip install -r requirements.txt

# Ejecutar tests
python -m pytest tests/ -v

# Ejecutar aplicación
python run.py

# Verificar código
flake8 app/
```

---

## 📈 Monitoreo y Logs

### **Health Checks**
La aplicación incluye health checks automáticos:
- **Endpoint**: `/tasks` (verificación de disponibilidad)
- **Intervalo**: 30 segundos
- **Timeout**: 10 segundos
- **Reintentos**: 3

### **Logs de Aplicación**
```bash
# Ver logs en tiempo real
docker logs -f container-name

# Logs específicos
docker-compose logs task-manager
```

---

## 🤝 Contribución

### **Flujo de Trabajo**

1. **Fork** del repositorio
2. **Crear rama** para nueva funcionalidad
3. **Implementar** cambios con tests
4. **Ejecutar** suite de tests completa
5. **Crear Pull Request** con descripción detallada

### **Estándares de Código**

- **PEP 8**: Estilo de código Python
- **Docstrings**: Documentación de funciones
- **Type Hints**: Anotaciones de tipos
- **Tests**: Cobertura mínima del 80%

---

## 📞 Soporte

### **Información del Desarrollador**
- **Autor**: Edwin Umaña Peña
- **Email**: edwin.umanha@gmail.com
- **Repositorio**: https://github.com/edwinumana/task_manager

### **Resolución de Problemas**

#### **Problemas Comunes**

1. **Error de conexión a base de datos**
   - Verificar variables de entorno
   - Comprobar conectividad de red
   - Revisar credenciales de Azure

2. **Fallos en servicios de IA**
   - Verificar API keys de Azure OpenAI
   - Comprobar límites de cuota
   - Revisar configuración de endpoints

3. **Problemas de Docker**
   - Verificar instalación de Docker
   - Comprobar permisos de usuario
   - Revisar puertos disponibles

#### **Logs de Depuración**

```bash
# Habilitar modo debug
export FLASK_ENV=development

# Ver logs detallados
docker-compose logs -f task-manager
```

---

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

---

## 🎯 Roadmap

### **Próximas Funcionalidades**
- **Notificaciones**: Sistema de alertas en tiempo real
- **Colaboración**: Comentarios y asignación múltiple
- **Reportes**: Exportación avanzada a PDF/Excel
- **API REST**: Documentación con Swagger
- **Integración**: Webhooks y APIs externas

### **Mejoras Técnicas**
- **Kubernetes**: Orquestación avanzada
- **Redis**: Cache y sesiones
- **Elasticsearch**: Búsqueda avanzada
- **Prometheus**: Métricas y monitoreo

---

**© 2024 Edwin Umaña Peña - Task Manager System**