<%-- 
    Document   : test
    Created on : 8/10/2019, 07:41:03 PM
    Author     : Crispancho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>

        <a id="link">test</a>
        <script type="text/javascript">

            function pagar() {
                let pago = {
                    "pago": "56"
                };


                $.ajax({
                    type: 'POST',
                    url: "http://localhost:8080/pagos/pago.jsp",
                    data: pago,
                    dataSrc: "confirmacion",
                    dataType: 'json',
                    success: function (response) {
                        console.log(response);
                    }});
            }
            
            pagar();
        </script>
        
        <p id="parrafo">ajax</p>
    </body>

</html>
