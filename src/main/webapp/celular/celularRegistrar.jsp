<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="app.modelos.Celular, app.modelos.Categoria" %>
<%@ page import="java.util.List" %>

<%
	//Recuperar datos y hacerle una terrible casteada a los datos enviados por el servlet
	@SuppressWarnings("unchecked")
    List<Celular> lista = (List<Celular>) request.getAttribute("listaCelulares");
	@SuppressWarnings("unchecked")
    List<Categoria> listaCat = (List<Categoria>) request.getAttribute("listaCategorias");

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion de Celulares</title>

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
		    
		        		<a href="${pageContext.request.contextPath}/Logout" class="btn btn-danger btn-sm">Cerrar Sesión</a></div></nav>
	

		<div class="container mt-4">
		
		    <div class="d-flex justify-content-between align-items-center mb-3">
		        <h3>Gestión de Celulares</h3>
		
		        		<a href="${pageContext.request.contextPath}/CelularPrincipal" class="btn btn-secondary">Rgresar</a></div>
		        
		  
		
		    <!-- FORMULARIO REGISTRO -->
		   <div class="card shadow-sm">
		    <div class="card-header bg-primary text-white">
		        <h5 class="mb-0">Registrar Celular</h5>
		    </div>
		
		    <div class="card-body">
		        <form action="CelularRegistrar" method="post">
		            <input type="hidden" name="accion" value="guardar">
		
		            <div class="mb-3">
		                <label class="form-label">Modelo</label>
		                <input type="text" name="modelo" class="form-control" placeholder="Ingrese el modelo" required>
		            </div>
		
		            <div class="mb-3">
		                <label class="form-label">Marca</label>
		                <input type="text" name="marca" class="form-control" placeholder="Ingrese la marca" required>
		            </div>
		
		            <div class="mb-3">
		                <label class="form-label">Precio (S/.)</label>
		                <input type="number" name="precio" step="0.01" class="form-control" placeholder="0.00" required>
		            </div>
		
		            <div class="mb-3">
		                <label class="form-label">Stock</label>
		                <input type="number" name="stock" class="form-control" placeholder="Cantidad disponible" required>
		            </div>
		
		            <div class="mb-3">
		                <label class="form-label">Categoría</label>
		                <select name="categoria" class="form-select" required>
		                    <option value="">Seleccione una categoría</option>
		                    <% for (Categoria c : listaCat) { %>
		                        <option value="<%= c.getIdCategoria() %>">
		                            <%= c.getNombre() %>
		                        </option>
		                    <% } %>
		                </select>
		            </div>
		
		            <div class="d-flex gap-2">
		                <button type="submit" class="btn btn-primary">Guardar</button>
		                <a href="CelularPrincipal?accion=listar" class="btn btn-secondary"> Cancelar</a>
		            </div>
		        </form>
		   	 </div>
			</div>
		</div>

<!-- FOOTER -->
<footer class="bg-dark text-white text-center py-2 mt-4">
    © 2025 - Sistema de Gestión de Venta de Celulares | Mobile HQ | Cibertec
</footer>

</body>
</html>
