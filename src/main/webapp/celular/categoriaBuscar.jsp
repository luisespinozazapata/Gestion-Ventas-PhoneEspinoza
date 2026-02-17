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
        <h3>Gestión de Categorías</h3>
        <a href="CategoriaPrincipal" class="btn btn-secondary">← Regresar</a>
    </div>

   <!-- BÚSQUEDA -->
	    <div class="card p-3 mb-4">
	        <h5>Buscar categoria</h5>
	
	        <form action="CategoriaBuscar" method="post" class="row g-3">
	            <input type="hidden" name="accion" value="listar">
	            
	            <div class="col-md-4">
	                <input type="text" name="nombre" class="form-control" placeholder="Buscar por nombre...">
	            </div>
	            <div class="col-md-2">
	                <button class="btn btn-success w-100" type="submit">Buscar</button>
	            </div>
	
	            <div class="col-md-2">
	                <a href="CategoriaBuscar?accion=listar" class="btn btn-secondary w-100">Limpiar</a>
	            </div>
	        </form>
	    </div>

    <!-- TABLA -->
    <table class="table table-striped table-hover">
        <thead class="table-dark text-center">
            <tr>
                <th>ID</th>
                <th>NOMBRE</th>
                <th>DESCRIPCIÓN</th>
                <th>ACCIONES</th>
            </tr>
        </thead>

        <tbody class="text-center">
        <% if (lista != null) {
               for (Categoria c : lista) { %>
            <tr>
                <td><%= c.getIdCategoria() %></td>
                <td><%= c.getNombre() %></td>
                <td><%= c.getDescripcion() %></td>
                <td>
                    <a href="${pageContext.request.contextPath}/CategoriaEditar?id=<%= c.getIdCategoria() %>"
                       class="btn btn-warning btn-sm">Editar</a>

                    <a href="javascript:void(0)" class="btn btn-danger btn-sm" onclick="confirmarEliminar(<%= c.getIdCategoria() %>)">Eliminar</a>
                </td>
            </tr>
        <%   }
           } %>
        </tbody>
    </table>

</div>

<!-- FOOTER -->
<footer class="bg-dark text-white text-center py-2 mt-4">
    © 2025 - Sistema de Gestión de Venta de Celulares | Mobile HQ
</footer>

</body>
</html>
