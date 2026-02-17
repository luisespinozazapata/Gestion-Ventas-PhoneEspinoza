<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Solicitante - Editar</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
	<main class="container mt-5">
		<h3 class="mb-4">Editar Solicitante</h3>

		<form method="post">
			<!-- ID (solo lectura) -->
			<div class="mb-3">
				<label for="id" class="form-label">ID</label>
				<input type="text" class="form-control" id="id" name="numId" value="${ solicitante.id }" readonly>
			</div>
	
			<!-- Descripción -->
			<div class="mb-3">
				<label for="nombre" class="form-label">Nombre</label>
				<input type="text" class="form-control" id="nombre" name="txtNombre" 
					   value="${ solicitante.nombre }" required>
			</div>

	
			<!-- Categoría -->
			<div class="mb-3">
				<label for="modelo" class="form-label">Modelo</label>
				<select class="form-select" id="modelo" name="cmbModelo" required>
					<option value="1">Xiaomi</option>
					<option value="2">Nokia</option>
					<option value="3">Samsung</option>
				</select>
			</div>
	
	
	
	
			<!-- Precio -->
			<div class="mb-3">
				<label for="pagos" class="form-label">Pagos</label>
				<input type="number" step="0.01" class="form-control" id="pagos" name="numPagos" 
					   value="${ solicitante.pagos }" required>
			</div>
	
			<!-- Stock -->
			<div class="mb-3">
				<label for="pendiente" class="form-label">Pendiente</label>
				<input type="number" class="form-control" id="pendiente" name="numPendiente" step="0.01"
					   value="${ solicitante.pendiente}" required>
			</div>
	
			<!-- Botones -->
			<div class="d-flex gap-2">
				<button type="submit" class="btn btn-success">Actualizar</button>
				<a href="<%= request.getContextPath() %>/Solicitante/Buscar" class="btn btn-secondary">Cancelar</a>
			</div>
		</form>
	</main>
	<footer class="mt-auto bg-dark text-light text-center py-3">
        <small>Tienda de Celulares ©2025 - Equipo3</small>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
<%
if (request.getAttribute("mensaje") != null) {
	boolean ok = (boolean) request.getAttribute("ok");
	String titulo = request.getAttribute("titulo").toString();
	String mensaje = request.getAttribute("mensaje").toString();
%>
	<script type="text/javascript">
		Swal.fire({
		  title: "<%= titulo %>",
		  text: "<%= mensaje %>",
		  icon: "<%= ok ? "success" : "error" %>"
		});
	</script>
<%}%>
</body>
</html>