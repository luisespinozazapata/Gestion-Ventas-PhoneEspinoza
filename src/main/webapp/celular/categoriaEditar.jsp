<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="app.modelos.Categoria" %>

<%
    Categoria categoria = (Categoria) request.getAttribute("categoria");
%>

<!DOCTYPE html>
<html lang="es-PE">
<head>
    <meta charset="UTF-8">
    <title>Editar Categoría</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .card:hover { transform: scale(1.02); transition: 0.3s; }
        .form-label { font-weight: 500; }
    </style>
</head>
<body>

    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="#">Gestión de Categorías</a>
            <a href="${pageContext.request.contextPath}/Logout" class="btn btn-danger btn-sm">Cerrar Sesión</a>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3>Editar Categoría</h3>
            <a href="CategoriaPrincipal?accion=listar" class="btn btn-secondary">← Regresar</a>
        </div>

        <div class="card shadow-sm">
            <div class="card-header bg-warning text-dark">
                <h5 class="mb-0">Formulario de Edición</h5>
            </div>
            <div class="card-body">
                <form action="CategoriaEditar" method="post">
                
                    <input type="hidden" name="id" value="<%= categoria.getIdCategoria() %>">

                    <div class="mb-3">
                        <label class="form-label">Nombre</label>
                        <input type="text" name="nombre" class="form-control" value="<%= categoria.getNombre() %>" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Descripción</label>
                        <textarea name="descripcion" class="form-control" rows="3"><%= categoria.getDescripcion() %></textarea>
                    </div>

                    <div class="d-flex gap-2">
                        <button type="submit" class="btn btn-success">Actualizar</button>
                        <a href="CategoriaPrincipal?accion=listar" class="btn btn-secondary">Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- FOOTER -->
    <footer class="bg-dark text-white text-center py-2 mt-4">
        © 2025 - Sistema de Gestión de Categorías | Mobile HQ
    </footer>

</body>
</html>
