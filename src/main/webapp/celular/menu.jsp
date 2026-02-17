
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Menú Principal</title>

    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- CSS personalizado -->
    <link rel="stylesheet" href="css/menu.css">
    
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="#">Mobile HQ</a>
        
        <div>Gestión Inventario</div>
	<div>

		<a href="${pageContext.request.contextPath}/Logout" class="btn btn-danger btn-sm">Cerrar Sesión</a></div></nav>
<!-- CONTENIDO -->
<div class="container mt-5">

    <h3 class="text-center mb-4">Sistema de Gestión de Venta de Celulares</h3>

    <div class="row g-4">

        <!-- GESTIÓN DE CELULARES -->
        <div class="col-md-4">
            <div class="card shadow text-center p-3">
            	<!-- Imagen -->
        		<img src="${ pageContext.request.contextPath }/img/celulares.png" alt="Celulares" class="card-img;">
                <h4 class="fw-bold">Gestionar Celulares</h4>
                  

 		<a class="btn btn-primary" href="${ pageContext.request.contextPath }/CelularPrincipal">Entrar</a>
            </div>
        </div>
        
         <!-- GESTIÓN DE CATEGORÍAS -->
        <div class="col-md-4">
            <div class="card shadow text-center p-3">
            	<!-- Imagen -->
        		<img src="${ pageContext.request.contextPath }/img/categoria.png" alt="Categoria" class="card-img;">
                <h4 class="fw-bold">Gestionar Categorias</h4>
                <a href="${ pageContext.request.contextPath }/CategoriaPrincipal" class="btn btn-primary">Entrar</a>
            </div>
        </div>

        <!-- REGISTRAR VENTA -->
        <div class="col-md-4">
            <div class="card shadow text-center p-3">
            	<!-- Imagen -->
        		<img src="${ pageContext.request.contextPath }/img/ventas.png" alt="Ventas" class="card-img;">
                <h4 class="fw-bold">Ventas</h4>
                <p></p>
         <a class="btn btn-primary" href="${ pageContext.request.contextPath }/Ventas/Registrar">Entrar</a>
            </div>
        </div>

        <!-- REPORTES -->
        <div class="col-md-4">
            <div class="card shadow text-center p-3">
            	<!-- Imagen -->
        		<img src="${ pageContext.request.contextPath }/img/reportes.png" alt="Reportes" class="card-img;">
                <h4 class="fw-bold">Reportar Solicitante</h4>
                <p></p>
                <a class="btn btn-primary" href="${ pageContext.request.contextPath }/Solicitante/Registrar">Entrar</a>
            </div>
        </div>
</div>
</div>

<!-- FOOTER -->
<footer class="bg-dark text-white text-center py-2 mt-4">
    © 2025 - Sistema de Gestión de Venta de Celulares | Mobile HQ 
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>