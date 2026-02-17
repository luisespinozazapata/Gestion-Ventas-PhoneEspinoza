<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="es-PE">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Solicitante</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="${ pageContext.request.contextPath }/Inicio">Mobile HQ</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="${ pageContext.request.contextPath }/Celular/Menu">Inicio</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                           Solicitante
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="${ pageContext.request.contextPath }/Solicitante/Registrar">Registrar Cliente</a></li>
                            <li><a class="dropdown-item" href="${ pageContext.request.contextPath }/Solicitante/Buscar">Buscar Cliente</a></li>
                            <li><a class="dropdown-item" href="${ pageContext.request.contextPath }/Ventas/Registrar">Registrar Ventas</a></li>
                            
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <main class="container mt-5">
        <h1 class="text-center mb-4">Registrar Solicitante</h1>
        
        <div class="card shadow">
            <div class="card-body">
                <form action="${ pageContext.request.contextPath }/Solicitante/Registrar" method="post">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">ID Solicitante</label>
                            <input type="text" name="txtId" class="form-control" value="${ atrId }" readonly>
                        </div>
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Nombre</label>
                            <input type="text" name="txtNombre" class="form-control" required placeholder="Ej: Adrian Alvarado">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Modelo</label>
                            <select class="form-select" id="modelo" name="cmbModelo" required>
								<option value="1">Xiaomi</option>
								<option value="2">Nokia</option>
								<option value="3">Samsung</option>
							</select>
                        </div>
                    </div>
      
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Pagos (S/)</label>
                            <input type="number" name="numPagos" class="form-control" required min="0" step="0.01" placeholder="Ej: 2499.90">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Pendiente</label>
                            <input type="number" name="numPendiente" class="form-control" required min="0" step="0.01" placeholder="Ej: 1233.99">
                        </div>
                    </div>

                    <div class="text-center mt-4">
                        <button class="btn btn-success px-5" type="submit">Registrar</button>
                        <a href="${ pageContext.request.contextPath }/Solicitante/Buscar" class="btn btn-secondary px-4 ms-2">Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
    </main>
    <footer class="bg-dark text-white text-center py-2 mt-4">
    © 2025 - Sistema de Gestión de Venta de Celulares | Mobile HQ
</footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>