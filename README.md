# Gestion Ventas PhoneEspinoza

## Introduction
Este proyecto es un sistema de ventas diseñado para optimizar la gestión de operaciones en puntos de venta.  

## Cómo Empezar

### 1. Clonar el Repositorio
Abre tu terminal y ejecuta el siguiente comando para clonar el repositorio:
```bash
git clone https://github.com/luisespinozazapata/Gestion-Ventas-PhoneEspinoza.git
```  

### 2. Requisitos Previos
Asegúrate de tener instalado lo siguiente en tu máquina:
- [Node.js](https://nodejs.org)
- [MongoDB](https://www.mongodb.com)

### 3. Instalación
Navega a la carpeta del proyecto con:
```bash
cd Gestion-Ventas-PhoneEspinoza
```
Luego, instala las dependencias necesarias:
```bash
npm install
```

### 4. Configuración de la Base de Datos
Necesitas configurar la conexión a tu base de datos MongoDB. Edita el archivo `config.js` y actualiza las credenciales de conexión:
```js
const dbURI = 'mongodb://<tu_usuario>:<tu_contraseña>@localhost:27017/<tu_base_de_datos>';
```

### 5. Ejecución del Proyecto
Para iniciar el servidor, ejecuta el siguiente comando:
```bash
npm start
```
Luego abre tu navegador y dirígete a `http://localhost:3000` para acceder a la aplicación.

## Contribuciones
Si deseas contribuir, por favor abre un Pull Request o crea un Issues para discutir cambios.

## Licencia
Este proyecto está licenciado bajo la MIT License.