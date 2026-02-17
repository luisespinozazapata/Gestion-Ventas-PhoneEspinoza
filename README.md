# 📱 Gestión Ventas PhoneEspinoza

> Sistema integral de gestión de ventas para PhoneEspinoza - Aplicación web empresarial desarrollada con JavaEE 2025

<div align="center">

![JavaEE](https://img.shields.io/badge/JavaEE-2025-blue?style=for-the-badge&logo=java)
![JDK](https://img.shields.io/badge/JDK-8-orange?style=for-the-badge&logo=java)
![Apache Tomcat](https://img.shields.io/badge/Apache%20Tomcat-9-red?style=for-the-badge&logo=apache)
![MySQL](https://img.shields.io/badge/MySQL-8.0-blue?style=for-the-badge&logo=mysql)

</div>

---

## 📋 Descripción del Proyecto

**Gestión Ventas PhoneEspinoza** es una aplicación web empresarial desarrollada con **JavaEE 2025** que proporciona una solución completa y robusta para la gestión integral de operaciones de ventas. Esta plataforma está diseñada para optimizar procesos comerciales, mejorar la eficiencia operativa y ofrecer una experiencia de usuario intuitiva y confiable.

### ¿Qué es PhoneEspinoza?

PhoneEspinoza es una tienda especializada en la venta y gestión de dispositivos móviles de última generación. Nuestro sistema fue creado para satisfacer todas las necesidades administrativas y comerciales de este negocio.

### ✨ Características Principales

- 📦 **Gestión de Inventario** - Control completo de stock de dispositivos móviles
- 💳 **Registro de Ventas** - Documentación detallada de todas las transacciones comerciales
- 📊 **Seguimiento de Ventas** - Monitoreo en tiempo real de operaciones de venta
- 👥 **Administración de Clientes** - Base de datos centralizada con historial de compras
- 📈 **Reportes Detallados** - Análisis y reportería avanzada de ventas y desempeño
- 🔐 **Control de Usuarios** - Sistema de autenticación y gestión de permisos por roles
- 📱 **Interfaz Responsiva** - Diseño adaptativo para múltiples dispositivos

---

## 🛠️ Stack Tecnológico

Este proyecto utiliza las siguientes tecnologías:

| Tecnología | Versión | Descripción |
|:--------:|:-------:|:-----------|
| **JavaEE** | 2025 | Plataforma empresarial para desarrollo de aplicaciones web |
| **JDK** | 8+ | Kit de desarrollo Java |
| **Apache Tomcat** | 9+ | Servidor web y contenedor de servlets |
| **MySQL** | 8.0+ | Sistema gestor de base de datos relacional |
| **JDBC Driver** | Último | Conector JDBC para MySQL |

---

## 🚀 Requisitos Previos

Antes de comenzar, asegúrate de tener instalado:

### Java Development Kit (JDK)
- Versión 8 o superior
- [Descargar Oracle JDK](https://www.oracle.com/java/technologies/javase-downloads.html)
- Verifica con: `java -version`

### MySQL Server
- Versión 8.0 o superior
- [Descargar MySQL Community Server](https://dev.mysql.com/downloads/mysql/)
- Verifica con: `mysql --version`

### Apache Tomcat
- Versión 9 o superior
- [Descargar Apache Tomcat](https://tomcat.apache.org/download-90.cgi)
- Configura la variable `CATALINA_HOME`

### JDBC Driver para MySQL
- Última versión
- [Descargar MySQL Connector/J](https://dev.mysql.com/downloads/connector/j/)
- Copia el archivo `.jar` en la carpeta `lib` de Tomcat

### Git
- Versión reciente
- [Descargar Git](https://git-scm.com/)

---

## 📦 Instalación y Configuración

### 1️⃣ Clonar el Repositorio

```bash
git clone https://github.com/luisespinozazapata/Gestion-Ventas-PhoneEspinoza.git
cd Gestion-Ventas-PhoneEspinoza
```

### 2️⃣ Configurar la Base de Datos

```bash
# Crear la base de datos
mysql -u root -p < database/schema.sql

# Importar datos iniciales
mysql -u root -p gestion_ventas < database/data.sql
```

### 3️⃣ Configurar Tomcat

1. Copia el archivo `.jar` del driver JDBC en `$CATALINA_HOME/lib/`
2. Actualiza el archivo `context.xml` con tus credenciales de base de datos
3. Reinicia el servidor Tomcat

### 4️⃣ Compilar e Implementar

```bash
# Compilar el proyecto
javac -d bin src/**/*.java

# Crear el archivo WAR
jar cvf Gestion-Ventas.war -C bin .

# Copiar el WAR a Tomcat
cp Gestion-Ventas.war $CATALINA_HOME/webapps/
```

### 5️⃣ Acceder a la Aplicación

- URL: `http://localhost:8080/Gestion-Ventas`
- Usuario por defecto: `Luis`
- Contraseña por defecto: `admin123`

---

## 📸 Galería de Pantallas

<div align="center">

[![Dashboard Principal](https://img.shields.io/badge/Dashboard-Inicio-blue?style=flat-square)]()
[![Gestión de Ventas](https://img.shields.io/badge/Gestión-Ventas-green?style=flat-square)]()
[![Inventario](https://img.shields.io/badge/Inventario-Productos-orange?style=flat-square)]()
[![Reportes](https://img.shields.io/badge/Reportes-Analytics-red?style=flat-square)]()

</div>

---

## 📂 Estructura del Proyecto

```
Gestion-Ventas-PhoneEspinoza/
├── src/
│   ├── controllers/          # Controladores de negocio
│   ├── models/               # Modelos de datos
│   ├── views/                # Vistas JSP
│   └── utils/                # Utilidades generales
├── database/
│   ├── schema.sql            # Estructura de base de datos
│   └── data.sql              # Datos iniciales
├── lib/                      # Librerías externas
├── WebContent/
│   ├── css/                  # Estilos CSS
│   ├── js/                   # Scripts JavaScript
│   └── index.jsp             # Página de inicio
└── README.md
```

---

## 🔐 Seguridad

- ✔️ Autenticación basada en sesiones seguras
- ✔️ Cifrado de contraseñas con SHA-256
- ✔️ Validación de entrada en formularios
- ✔️ Protección contra SQL Injection
- ✔️ Control de acceso basado en roles (RBAC)

---

## 📝 Licencia

Este proyecto está bajo la licencia **MIT**. Consulta el archivo [LICENSE](LICENSE) para más detalles.

---

## 👨‍💻 Autor

**Luis Espinoza Zapata**
- GitHub: [@luisespinozazapata](https://github.com/luisespinozazapata)

---

## 📞 Soporte y Contacto

Si tienes preguntas o necesitas soporte:
- Abre un [Issue](https://github.com/luisespinozazapata/Gestion-Ventas-PhoneEspinoza/issues)
- Contáctame directamente a través de GitHub

---

## 📸 Capturas del Sistema

### 🔑 Pantalla de Acceso
<img width="815" height="698" alt="image" src="https://github.com/user-attachments/assets/5071217b-d343-4338-af1a-fe647fca4d43" />

### 👤 Selección de Perfil de Usuario
<img width="1600" height="805" alt="image" src="https://github.com/user-attachments/assets/ff5e3f4d-5484-455d-92c3-de31bc6141a4" />

### 📊 Dashboard Principal - Centro de Control
<img width="1600" height="832" alt="image" src="https://github.com/user-attachments/assets/151343f2-f0f8-4fee-8422-d4abe5c8cb34" />

### 📱 Gestión de Inventario - Administración de Dispositivos
<img width="1600" height="847" alt="image" src="https://github.com/user-attachments/assets/299c159a-6737-4c7e-af1d-25f604d4238c" />

### 🏷️ Gestión de Categorías - Clasificación de Productos
<img width="1600" height="847" alt="image" src="https://github.com/user-attachments/assets/33f9f800-bffd-4adf-9e32-f58ac3c9f32a" />

### 💰 Nueva Venta - Registro de Transacciones
<img width="1600" height="815" alt="image" src="https://github.com/user-attachments/assets/9d2456de-d770-4caa-9cfb-70896ed2b91a" />

### 👥 Nuevo Cliente - Registro de Información
<img width="1600" height="794" alt="image" src="https://github.com/user-attachments/assets/35581a8b-26af-4c11-8953-e776fe99e9e5" />

### 📋 Base de Datos de Clientes - Gestión Completa
<img width="1600" height="806" alt="image" src="https://github.com/user-attachments/assets/fccf3150-8fe4-44fe-a2c9-35bc953a2e50" />

---

<div align="center">

### ¡Gracias por usar Gestión Ventas PhoneEspinoza! ⭐

Si este proyecto te fue útil, considera darle una ⭐ estrella.

</div>



