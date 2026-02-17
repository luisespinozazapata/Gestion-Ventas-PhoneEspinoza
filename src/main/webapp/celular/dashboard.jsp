<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es-PE">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rol</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- HEADER -->
<header class="bg-dark text-white py-3 mb-4">
    <div class="container d-flex justify-content-between align-items-center">
        <div class="fw-bold fs-5">Gestión Inventario</div>
        <div>
            <span class="me-3">${usuario.nombre}</span>
            <span class="me-3">${usuarioRolSelect.nombre}</span>
            <a href="${pageContext.request.contextPath}/Logout" class="btn btn-warning btn-sm">Cerrar Sesión</a>
        </div>
    </div>
</header>

<!-- MAIN -->
<main class="container text-center py-5">
    <h3 class="text-muted">Sin contenido</h3>
</main>

<footer class="bg-dark text-white text-center py-2 mt-4">
    © 2025 - Sistema de Gestión de Venta de Celulares | Mobile HQ 
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
