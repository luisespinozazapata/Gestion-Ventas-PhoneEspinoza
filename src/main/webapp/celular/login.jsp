<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es-PE">
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity ="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body class="bg-light">

  <div class="container vh-100 d-flex justify-content-center align-items-center">
    <div class="col-12 col-sm-8 col-md-6 col-lg-4">
      <div class="card shadow">
        <div class="card-body p-4">

          <h3 class="text-center mb-4">Iniciar Sesión</h3>

          <form action="${pageContext.request.contextPath}/Login" method="post">
            <!-- Usuario -->
            <div class="mb-3">
              <label for="username" class="form-label">Nombre de usuario</label>
              <input 
                type="text" 
                class="form-control"
                id="username" 
                placeholder="Ingresa tu usuario"
                name="txtNombre"
                required>
            </div>

            <!-- Contraseña -->
            <div class="mb-3">
              <label for="password" class="form-label">Contraseña</label>
              <input 
                type="password" 
                class="form-control" 
                id="password" 
                placeholder="********"
                name="txtClave"
                required>
            </div>

            <!-- Remember me -->
            <div class="d-flex justify-content-between align-items-center mb-3">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" id="remember">
                <label class="form-check-label" for="remember">
                
                </label>
              </div>
           
            </div>

            <!-- Button -->
            <div class="d-grid">
              <button type="submit" class="btn btn-primary">
                Entrar
              </button>
            </div>
          </form>

          <hr class="my-4">

          <p class="text-center mb-0">
            
          </p>

        </div>
      </div>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>
