<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es-PE">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Nueva Venta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- NAVBAR -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    	<div class="container-fluid">
        	<a class="navbar-brand fw-bold" href="#">Mobile HQ</a>
   
        			<a href="${pageContext.request.contextPath}/Logout" class="btn btn-danger btn-sm">Cerrar Sesión</a></div></nav>

<div class="container mt-5">
    <h1 class="mb-4 text-center">Registrar Nueva Venta</h1>

    <!-- Navegación -->
    <div class="mb-4 d-flex justify-content-between">
        <a class="btn btn-secondary" href="${ pageContext.request.contextPath }/Celular/Menu">Inicio</a>
        <a class="btn btn-primary" href="${ pageContext.request.contextPath }/Ventas/Registrar">Registrar</a>
    </div>

    <%
        // Verificar si el ID generado está disponible
        Integer idGenerado = (Integer) request.getAttribute("atrIdGenerado");
    %>

    <form action="<%= request.getContextPath() %>/Ventas/Registrar" method="post" class="row g-3">
        <div class="col-md-6">
            <label for="solicitante" class="form-label">Solicitante:</label>
            <input type="text" id="solicitante" name="solicitante" class="form-control" required />
        </div>

        <div class="col-md-3">
            <label for="fecha" class="form-label">Fecha (YYYY-MM-DD):</label>
            <input type="date" id="fecha" name="fecha" class="form-control" required />
        </div>

        <div class="col-md-3">
            <label for="hora" class="form-label">Hora (HH:MM:SS):</label>
            <input type="time" id="hora" name="hora" class="form-control" required />
        </div>

        <div class="col-md-3">
            <label for="cantidad_equipos" class="form-label">Cantidad de Equipos:</label>
            <input type="number" id="cantidad_equipos" name="cantidad_equipos" min="1" class="form-control" required />
        </div>

        <div class="col-md-3">
            <label for="categoria" class="form-label">Categoría:</label>
            <input type="text" id="categoria" name="categoria" class="form-control" required />
        </div>

        <div class="col-md-3">
            <label for="modelo" class="form-label">Modelo:</label>
            <input type="text" id="modelo" name="modelo" class="form-control" required />
        </div>

        <div class="col-md-3">
            <label for="marca" class="form-label">Marca:</label>
            <input type="text" id="marca" name="marca" class="form-control" required />
        </div>

        <% if (idGenerado != null && idGenerado != -2) { %>
        <div class="col-md-3">
            <label for="idGenerado" class="form-label">ID Generado:</label>
            <input type="text" id="idGenerado" name="idGenerado" value="<%= idGenerado %>" class="form-control" readonly />
        </div>
        <% } %>

        <div class="col-12 text-center">
            <button type="submit" class="btn btn-success">Registrar Venta</button>
        </div>
    </form>

    <div class="mt-4 text-center">
        <a href="<%= request.getContextPath() %>/Ventas/Listar" class="btn btn-info">Ver todas las ventas</a>
    </div>
</div>
<footer class="bg-dark text-white text-center py-2 mt-4">
    © 2025 - Sistema de Gestión de Venta de Celulares | Mobile HQ 
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
