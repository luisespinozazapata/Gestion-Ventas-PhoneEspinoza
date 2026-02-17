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
        <a href="${pageContext.request.contextPath}/Celular/Menu" class="btn btn-secondary">← Regresar</a>
    </div>
    
     <!-- BÚSQUEDA -->
    <div class="card p-3 mb-4">

        <form action="CategoriaPrincipal" method="get" class="row g-3">
            <input type="hidden" name="accion" value="listar">
            <div class="col-md-2"><a href="CategoriaPrincipal?accion=listar" class="btn btn-secondary w-100">Listar</a></div>
            <div class="col-md-2"><a href="CategoriaPrincipal" class="btn btn-secondary w-100">Limpiar</a></div>
            <div class="col-md-2"><a href="CategoriaBuscar" class="btn btn-success w-100">Buscar</a></div>
            <div class="col-md-2"><a href="CategoriaRegistrar" class="btn btn-success w-100">Registrar</a></div>
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
function confirmarEliminar(id) {
    Swal.fire({
        title: '¿Eliminar categoría?',
        text: 'Esta acción no se puede deshacer.',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Sí, eliminar',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = 'CategoriaEliminar?accion=eliminar&id=' + id;
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
        text: 'Categoria fue actualizado correctamente.',
        timer: 2000,
        showConfirmButton: false
    });
</script>
<%
        session.removeAttribute("msg");
    } else if ("registrado".equals(msg)) {
%>
<script>
    Swal.fire({
        icon: 'success',
        title: '¡Registrado!',
        text: 'Categoria fue registrado correctamente.',
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
