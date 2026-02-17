<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="app.modelos.Celular, app.modelos.Categoria" %>
<%@ page import="java.util.List" %>

<%
	Celular cel = (Celular) request.getAttribute("celular");
	//Recuperar datos y hacerle una terrible casteada a los datos enviados por el servlet
	@SuppressWarnings("unchecked")
    List<Categoria> listaCat = (List<Categoria>) request.getAttribute("listaCategorias");

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Celulares</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .card:hover { transform: scale(1.03); transition: 0.3s; }
    </style>
</head>

<body>

	<!-- NAVBAR -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
	    <div class="container-fluid">
	        <a class="navbar-brand fw-bold" href="#">Mobile HQ</a>
	     
	        		<a href="${pageContext.request.contextPath}/Logout" >Cerrar Sesión</a></div></nav>
	        
	

	<div class="container mt-4">
	
	    <div class="d-flex justify-content-between align-items-center mb-3">
	        <h3>Gestión de Celulares</h3>
	        <a href="${pageContext.request.contextPath}/Celular/Menu" class="btn btn-secondary">← Regresar</a>
	    </div>
	        <div class="card shadow-sm">
	            <div class="card-header bg-warning text-dark">
	                <h5 class="mb-0">Editar Celular</h5>
	            </div>
	
	            <div class="card-body">
	                <form action="CelularEditar" method="post">
	
	                    <input type="hidden" name="id" value="<%= cel.getIdCelular() %>">
	
	                    <div class="mb-3">
	                        <label class="form-label">Modelo</label>
	                        <input type="text" name="modelo" class="form-control" value="<%= cel.getModelo() %>" required>
	                    </div>
	                    
	                    <div class="mb-3">
	                        <label class="form-label">Marca</label>
	                        <input type="text" name="marca" class="form-control" value="<%= cel.getMarca() %>" required>
	                    </div>
	
	                    <div class="mb-3">
	                        <label class="form-label">Precio (S/.)</label>
	                        <input type="number" step="0.01" name="precio" class="form-control" value="<%= cel.getPrecio() %>" required>
	                    </div>
	
	                    <div class="mb-3">
	                        <label class="form-label">Stock</label>
	                        <input type="number" name="stock" class="form-control" value="<%= cel.getStock() %>" required>
	                    </div>
	
	                    <div class="mb-3">
	                        <label class="form-label">Categoría</label>
	                        <select name="categoria" class="form-select" required>
	                            <% for (Categoria c : listaCat) { %>
	                                <option value="<%= c.getIdCategoria() %>"
	                                    <%= c.getIdCategoria() == cel.getIdCategoria()
	                                            ? "selected" : "" %>>
	                                    <%= c.getNombre() %>
	                                </option>
	                            <% } %>
	                        </select>
	                    </div>
	
	                    <div class="d-flex gap-2">
	                        <button type="submit" class="btn btn-success">Actualizar</button>
	                        <a href="CelularPrincipal?accion=listar" class="btn btn-secondary">Cancelar</a></div>
	                </form>
	            </div>
	        </div>
	    </div>
<!-- FOOTER -->
<footer class="bg-dark text-white text-center py-2 mt-4">
    © 2025 - Sistema de Gestión de Venta de Celulares | Mobile HQ
</footer>

</body>
</html>
