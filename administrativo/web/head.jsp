<%-- 
    Document   : head
    Created on : 7/10/2019, 10:54:12 AM
    Author     : Crispancho
--%>

<%@page contentType="text/html; charset=iso-8859-1" pageEncoding="iso-8859-1"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!--iconos-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">


        <!--bootstrap-->
        <link href="stryle/bootstrap/bootstrap4.1.3.min.css" rel="stylesheet" type="text/css"/>

        <!--jquery-->
        <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>

        <title>administrativo</title>
    </head>

    <body>

        <nav class="navbar navbar-expand-sm navbar-expand-md bg-dark navbar-dark ">
            <a class="navbar-brand" href="home.jsp">Logo</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Dropdown
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>

                    <!--Bienvenido-->
                    <li class="nav-item">
                        <a class="nav-link" href="#" id="navbardrop" data-toggle="dropdown">
                            <%
                                // creo objeto de sesión y recupero las seiones
                                HttpSession miSesion = request.getSession();

                                // valido que este activa la sesión
                                if (miSesion.getAttribute("loguin") != null) {
                                    out.print("<i class=\"fas fa-user-circle\"></i>" + " " + miSesion.getAttribute("loguin"));

                                } else {
                                    response.sendRedirect("index.jsp");
                                }

                                // validamos c para cerrar la sesión
                                if (request.getParameter("c") != null) {

                                    miSesion.removeAttribute("loguin");
                                    //miSesion.invalidate();
                                    response.sendRedirect("index.jsp");
                                }

                                // si tipoUsuario es diferente de null, es tipo user 
                                if (miSesion.getAttribute("tipoUsuario") != null) {
                                    out.write("<script type='text/javascript'>\n");
                                    //out.write("ocultarUsuariosSistema();");
                                    out.write("</script>\n");

                                }


                            %>
                        </a>
                    </li>
                    <!--Cerrar sesión-->
                    <li class="nav-item">
                        <a class="nav-link " href=head.jsp?c=1>Salir <i class="fas fa-sign-out-alt"></i></a>
                    </li>
                </ul>
            </div>
        </nav>
          
        <!--llave db, asigna el valor de la llave que esta en la tabla pago-->                
        <input id="llave" type="hidden" value="<%out.print(miSesion.getAttribute("llave"));%>">
        <!--validar pago-->                
        <script  type='text/javascript'>
            let data = {
                "pago": document.getElementById("llave").value
            };


            $.ajax({
                type: 'POST',
                url: "http://localhost:8080/pagos/pago.jsp",
                data: data,
                dataSrc: "confirmacion",
                dataType: 'json',
                success: function (response) {
                    
                    let confirmacion;
                    
                    try {
                        // convierto respuesta json en string
                        confirmacion = JSON.stringify(response.confirmacion[0]['pago']);
                    } catch (e) {
                        confirmacion = "0";
                    }
                        console.log(confirmacion);
                      
                        if(confirmacion === "1"){
                            console.log("Pago la día");
                        } else {
                            console.log("Comunicate con tu proveedor");
                        }
                }}
            );


        </script>                        
