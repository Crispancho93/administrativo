<%-- 
    Document   : index
    Created on : 7/10/2019, 11:13:21 AM
    Author     : Crispancho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!--iconos-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

        <!--estilos-->
        <link href="stryle/loguin.css" rel="stylesheet" type="text/css"/>

        <!--bootstrap-->
        <link href="stryle/bootstrap/bootstrap4.1.3.min.css" rel="stylesheet" type="text/css"/>


        <title>Loguin</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">
                            <h5 class="card-title text-center">Administrativo</h5>
                            <center><img  style="width: 220px;" class="rounded-circle mb-3" src="imagenes/store.png"/></center>
                            <form class="form-signin" method="POST" action="ValidarUsuario">
                                <div class="form-label-group">
                                    <input type="text" id="loguin" name="loguin" class="form-control" placeholder="Usuario" required autofocus>
                                    <label for="loguin">Usuario</label>
                                </div>

                                <div class="form-label-group">
                                    <input type="password" id="clave" name="clave" class="form-control" placeholder="clave" required>
                                    <label for="clave">Clave</label>
                                </div>

                                <div class="custom-control custom-checkbox mb-3">
                                    <input type="checkbox" class="custom-control-input" id="customCheck1">
                                    <label class="custom-control-label" for="customCheck1">Recordar contraseña</label>
                                </div>
                                <button class="btn btn-lg btn-primary btn-block" name="btnIniciarSesion" type="submit"><i class="fas fa-sign-in-alt"></i> Iniciar sesión</button>
                                <hr class="my-4">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
         <% 
        // si el usuario existe creo la sesión
        if (request.getAttribute("UsuarioValidado") != null) {
            if (request.getAttribute("UsuarioValidado").equals("1")) {
                    
                // creo objeto de sesión y recupero las sesiones
                HttpSession miSesion = request.getSession();
                
                // atributos de las sesión
                miSesion.setMaxInactiveInterval(10800);
                miSesion.setAttribute("loguin", request.getAttribute("loguin"));
                miSesion.setAttribute("tipoUsuario", request.getAttribute("tipoUsuario"));
                miSesion.setAttribute("llave", request.getAttribute("llave"));
                
                // redireccionamos al home
                response.sendRedirect("home.jsp");
                
            }else {
                out.write("<script type='text/javascript'>\n");
                out.write("window.location.href = \"index.jsp\";");
                out.write("alert('Datos incorrectos')");
                out.write("</script>\n");
            }
        }
    %>
    </body>
</html>
