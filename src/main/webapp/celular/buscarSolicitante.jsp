<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List,app.modelos.Solicitante" %>
<%
// Recuperar y castear los datos enviados por el servlet
@SuppressWarnings("unchecked")
List<Solicitante>  solicitantes = (List<Solicitante>) request.getAttribute("atrSolicitantes");
%>
<!DOCTYPE html>

<html lang="es-PE">
<head>
	<meta charset="UTF-8">
	<title>Buscar Solicitante</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="${ pageContext.request.contextPath }/Celular/Menu">Mobile HQ</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="${ pageContext.request.contextPath }/Login">Inicio</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Celulares
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                  <li><a class="dropdown-item" href="${ pageContext.request.contextPath }/Solicitante/Buscar">Buscar Cliente</a></li>
                                   <li><a class="dropdown-item" href="${ pageContext.request.contextPath }/Solicitante/Registrar">Registrar Cliente</a></li>
                                    <li><a class="dropdown-item" href="${ pageContext.request.contextPath }/Ventas/Registrar">Registrar Venta</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
	<main class="container mt-5">
		<h1 class="text-center mb-4">Buscar Solicitante</h1>
		
		<div class="card mb-4 shadow-sm">
            <div class="card-body">
                <form action="${ pageContext.request.contextPath }/Solicitante/Buscar" method="post" class="row g-3">
                    <div class="col-md-8">
                        <label class="form-label">Descripción solicitante</label>
                        <input 
                            type="text" 
                            name="txtNombre" 
                            class="form-control" 
                            placeholder="Ej: Luis Espinoza,Gustavo Flores, etc..." 
                            value="${ atrNombre }">
                    </div>


                    <div class="col-md-4 d-flex align-items-end">
                        <button class="btn btn-primary w-100" type="submit">
                            Buscar
                        </button>
                    </div>
                </form>
            </div>
        </div>
        
        <%
                if (solicitantes != null && !solicitantes.isEmpty()) {
                %>
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Modelo</th>
                    <th>Pagos (S/)</th>
                    <th>Pendiente (S/)</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
            <%
            for (Solicitante d : solicitantes) {
            %>
                <tr>
                    <td><%= d.getId() %></td>
                    <td><%= d.getNombre() %></td>
                    <td><%= d.getModelo().getNombre() %></td>
                    <td>S/ <%= d.getPagos() %></td>
                    <td>S/<%= d.getPendiente() %></td>
                    <td>
                    	<a href="${ pageContext.request.contextPath }/Solicitante/Editar?id=<%= d.getId() %>" class="btn btn-warning">Editar</a>
                    	<a href="${ pageContext.request.contextPath }/Solicitante/Eliminar?id=<%= d.getId() %>" class="btn btn-danger" onclick="confirmarEliminar(event, this.href)">Eliminar</a>
                    </td>
                </tr>
            <% } %>
            </tbody>
        </table>
        <% } else { %>
        <div class="alert alert-warning" role="alert">
            No se encontraron solicitantes en la base de datos.
        </div>
        <% } %>
	</main>
	<footer class="mt-auto bg-dark text-light text-center py-3">
        <small>Tienda de Celulares ©2025 - Desarrollado por Equipo3</small>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
<%if (request.getAttribute("ok") != null) {
	boolean ok = Boolean.parseBoolean(request.getAttribute("ok").toString());%>
	<script type="text/javascript">
		Swal.fire({
		  title: "<%= ok ? "Cliente Eliminado" : "Error al eliminar" %>",
		  text: "<%= ok ? "Se elimino correctamente." : "Codigo de error: 103" %>",
		  icon: "<%= ok ? "success" : "error" %>"
		});
	</script>
<%}%>
	<script type="text/javascript">
		function confirmarEliminar(event, url) {
		    event.preventDefault(); // Evita que el enlace navegue inmediatamente
	
		    Swal.fire({
		        title: "¿Eliminar Cliente?",
		        text: "Esta acción no se puede deshacer.",
		        icon: "warning",
		        showCancelButton: true,
		        confirmButtonColor: "#d33",
		        cancelButtonColor: "#3085d6",
		        confirmButtonText: "Sí, eliminar",
		        cancelButtonText: "Cancelar"
		    }).then((result) => {
		        if (result.isConfirmed) {
		            // Redirige a la URL original (la de eliminar)
		            window.location.href = url;
		        }
		    });
		}
	</script>
</body>
</html>
