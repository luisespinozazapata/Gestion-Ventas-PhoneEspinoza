<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es-PE">
<head>
    <meta charset="UTF-8">
    <title>Roles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- HEADER -->
<header class="bg-dark text-white py-3 mb-4">
    <div class="container d-flex justify-content-between align-items-center">
        <h2 class="mb-0">Gestión de Inventario</h2>
        <div>
            <span>Bienvenido, <strong>${usuario.nombre}</strong></span>
            <a href="${pageContext.request.contextPath}/Logout" class="btn btn-warning btn-sm ms-3">Cerrar Sesión</a>
        </div>
    </div>
</header>

<main class="container text-center">
    <h1 class="mb-4">Selecciona tu Rol</h1>
    <div class="row justify-content-center g-4">
        <c:forEach var="rol" items="${usuario.roles}">
            <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                <div class="card shadow-sm h-100">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">${rol.nombre}</h5>
                        <form action="${pageContext.request.contextPath}/Celular/Menu" method="post" class="mt-auto">
                            <input type="hidden" name="rolId" value="${rol.id}">
                            <button type="submit" class="btn btn-primary w-100">Seleccionar</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</main>

<!-- FOOTER -->
<footer class="bg-dark text-white text-center py-2 mt-4">
    © 2025 - Sistema de Gestión de Venta de Celulares | Mobile HQ
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
