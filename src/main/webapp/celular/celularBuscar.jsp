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

	        		<a href="${pageContext.request.contextPath}/Logout" class="btn btn-danger btn-sm">Cerrar Sesión</a></div></nav>
	        


	<main class="container mt-4">
	
	    <div class="d-flex justify-content-between align-items-center mb-3">
	        <h3>Gestión de Celulares</h3>
	        <a href="CelularPrincipal" class="btn btn-secondary">← Regresar</a>
	    </div>
	
	
	    <!-- BÚSQUEDA -->
	    <div class="card p-3 mb-4">
	        <h5>Buscar celulares</h5>
	
	        <form action="CelularBuscar" method="get" class="row g-3">
	            <input type="hidden" name="accion" value="listar">
	        <div class="col-md-4">
	                <select name="categoria" class="form-select">
	                    <option value="0">Buscar por categoría...</option>
	                    <% for (Categoria c : listaCat) { %>
	                        <option value="<%= c.getIdCategoria() %>"><%= c.getNombre() %></option>
	                    <% } %>
	                </select>
	            </div>
	
	            <div class="col-md-2">
	                <button class="btn btn-success w-100" type="submit">Buscar</button>
	            </div>
	
	            <div class="col-md-2">
	                <a href="CelularBuscar?accion=listar" class="btn btn-secondary w-100">Limpiar</a>
	            </div>
	        </form>
	    </div>
		<% if (lista != null && !lista.isEmpty()) { %>
		<table class="table table-bordered table-striped">
	    	<thead class="table-dark text-center">
	            <tr>
	                <th>ID</th>
	                <th>MODELO</th>
	                <th>MARCA</th>
	                <th>PRECIO (S/)</th>
	                <th>STOCK</th>
	                <th>CATEGORÍA</th>
	                <th>ACCIONES</th>
	            </tr>
	        </thead>
			<tbody>
	            <% for (Celular cel : lista) { %>
	            	<tr>
	            		<td><%= cel.getIdCelular() %></td>
	                <td><%= cel.getModelo() %></td>
	                <td><%= cel.getMarca() %></td>
	                <td>S/. <%= cel.getPrecio() %></td>
	                <td><%= cel.getStock() %></td>
	                <td>
	                    <%
	                        for (Categoria cat : listaCat) {
	                            if (cat.getIdCategoria() == cel.getIdCategoria()) {
	                                out.print(cat.getNombre());
	                                break;
	                            }
	                        }
	                    %>
	                </td>
	                <td>
	                	<a href="${pageContext.request.contextPath}/CelularEditar?id=<%= cel.getIdCelular() %>" class="btn btn-warning btn-sm">Editar</a>
						<a href="javascript:void(0)" class="btn btn-danger btn-sm" onclick="confirmarEliminar(<%= cel.getIdCelular() %>)"> Eliminar</a>						
	                </td>
	            	</tr>
	            	<% } %>
	         </tbody>
	     </table>
	     <% } else { %>
		        <div class="alert alert-warning" role="alert">
		            No se encontraron productos en la base de datos.
		        </div>
	     <% } %>
	</main>	
<!-- FOOTER -->
<footer class="bg-dark text-white text-center py-2 mt-4">
    © 2025 - Sistema de Gestión de Venta de Celulares | Mobile HQ
</footer>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	function confirmarEliminar(id) {
	    Swal.fire({
	        title: '¿Eliminar celular?',
	        text: 'Esta acción no se puede deshacer.',
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#d33',
	        cancelButtonColor: '#3085d6',
	        confirmButtonText: 'Sí, eliminar',
	        cancelButtonText: 'Cancelar'
	    }).then((result) => {
	        if (result.isConfirmed) {
	            window.location.href =
	                'CelularEliminar?id=' + id;
	        }
	    });
	}
</script>

	<%
	    String msg = (String) session.getAttribute("msg");
	    if ("actualizado".equals(msg)) {
	%>
<script>
    Swal.fire({
        icon: 'success',
        title: '¡Actualizado!',
        text: 'El producto fue actualizado correctamente.',
        timer: 2000,
        showConfirmButton: false
    });
</script>
<%
        session.removeAttribute("msg");
    }
%>
</body>
</html>
