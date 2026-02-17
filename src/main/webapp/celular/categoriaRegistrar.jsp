<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="app.modelos.Categoria" %>
<%@ page import="java.util.List" %>

<%
	@SuppressWarnings("unchecked")
    List<Categoria> lista = (List<Categoria>) request.getAttribute("listaCategorias");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Categorías</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="#">Mobile HQ</a>
        <a href="${pageContext.request.contextPath}/Logout" class="btn btn-danger btn-sm">Cerrar Sesión</a>
    </div>
</nav>

<div class="container mt-4">

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Registrar Categoria</h3>
        <a href="CategoriaPrincipal" class="btn btn-secondary">← Regresar</a>
    </div>

    <!-- FORMULARIO REGISTRAR -->
    <div class="card p-3 mb-4">
        <form action="CategoriaRegistrar" method="post">
            <input type="hidden" name="accion" value="guardar">

            <div class="row">
                <div class="col-md-4">
                    <input type="text" name="nombre" class="form-control"
                           placeholder="Nombre" required>
                </div>

                <div class="col-md-6">
                    <input type="text" name="descripcion" class="form-control"
                           placeholder="Descripción">
                </div>

                <div class="col-md-2">
                    <button class="btn btn-primary w-100">Guardar</button>
                </div>
            </div>
        </form>
    </div>

</div>

<!-- FOOTER -->
<footer class="bg-dark text-white text-center py-2 mt-4">
    © 2025 - Sistema de Gestión de Venta de Celulares | Mobile HQ
</footer>

</body>
</html>
