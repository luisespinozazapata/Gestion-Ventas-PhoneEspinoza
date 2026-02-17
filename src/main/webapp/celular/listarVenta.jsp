<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,app.modelos.Ventas"%>
<!DOCTYPE html>
<html lang="es-PE">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Ventas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
    <div class="container">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/Celular/Menu">Mobile HQ</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Ventas/Registrar">Registrar Venta</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <h1 class="mb-4 text-center">Lista de Ventas</h1>

    <%
        @SuppressWarnings("unchecked")
        List<Ventas> ventas = (List<Ventas>) request.getAttribute("atrVentas");
    %>

    <%
        if (ventas != null && !ventas.isEmpty()) {
    %>
    <div class="table-responsive">
        <table class="table table-striped table-hover table-bordered text-center align-middle">
            <thead class="table-dark">
                <tr>
                    <th>Código</th>
                    <th>Solicitante</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Cantidad de Equipos</th>
                    <th>Categoría</th>
                    <th>Modelo</th>
                    <th>Marca</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Ventas venta : ventas) {
                %>
                <tr>
                    <td><%= venta.getCodigo() %></td>
                    <td><%= venta.getSolicitante() %></td>
                    <td><%= venta.getFecha() %></td>
                    <td><%= venta.getHora() %></td>
                    <td><%= venta.getCantidadEquipos() %></td>
                    <td><%= venta.getCategoria() %></td>
                    <td><%= venta.getModelo() %></td>
                    <td><%= venta.getMarca() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    <%
        } else {
    %>
        <div class="alert alert-info text-center" role="alert">
            No hay ventas para mostrar.
        </div>
    <%
        }
    %>
</div>
<footer class="bg-dark text-white text-center py-2 mt-4">
    © 2025 - Sistema de Gestión de Venta de Celulares | Mobile HQ 
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
