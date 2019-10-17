<?php header('Content-Type: text/html; charset=iso-8859-1');?>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset=iso-8859-1>

        <!--iconos-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

        <!--estilos-->
        <link href="stryle/loguin.css" rel="stylesheet" type="text/css"/>

        <!--bootstrap-->
        <link href="bootstrap/bootstrap4.1.3.min.css" rel="stylesheet" type="text/css"/>


        <title>Loguin</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">

                            <!--logo-->
                            <center><img  style="width: 220px;" class="rounded-circle mb-3" src="../files/logo-letra-c-rayas_1043-277.jpg"/></center>
                            <form class="form-signin" method="POST" action="../controller/validar_usuario.php">

                                <!--usuario-->
                                <div class="form-label-group">
                                    <input type="text" id="loguin" name="loguin" class="form-control" placeholder="Usuario" required autofocus>
                                    <label for="loguin">Usuario</label>
                                </div>

                                <!--clave-->
                                <div class="form-label-group">
                                    <input type="password" id="clave" name="clave" class="form-control" placeholder="clave" required>
                                    <label for="clave">Clave</label>
                                </div>

                                <!--botones-->
                                <button class="btn btn-lg btn-primary btn-block" name="btnIniciarSesion" type="submit"><i class="fas fa-sign-in-alt"></i> Iniciar sesión</button>
                                <hr class="my-4">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
