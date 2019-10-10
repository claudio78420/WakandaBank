<%-- 
    Document   : plafond
    Created on : 9 oct. 2019, 15:13:35
    Author     : esic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Ressources/espaceclientcss.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.indigo-pink.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
        <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
              integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    </head>
<body class="backgroundgeneral">
        
        <div class="container">

            <%@include file="toolbarleft.jsp" %>

            <%@include file="toolbartop.jsp" %>
        </div>
        
        <br>
        <div class="container backgroundcontainer">
            <br>
            
            <h1 style="text-align: center; color: white">Plafond</h1>
            <br><br>
            
            
            <div class="col d-flex justify-content-center">
                <div class="card text-center" style="width: 100%;
                     box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30)">
                    <h2 class="card-img-top" alt="" style="background: black; color: gold; padding-bottom: 3%"><br>Votre plafond actuel</h2>
                    <div class="card-body">
                        <br>
                        <h4 class="card-body" id="idplafondactuel" style="display: inline">Ici le plafond</h4>
                        <h4 class="card-body" style="display: inline">€</h4>
                        <br><br><br>
                    </div>
                </div>
            </div>
            <br>
            <br>
            
            
            <div class="col d-flex justify-content-center">
                <div class="card text-center" style="width: 100%;
                     box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30)">
                    <h2 class="card-img-top" alt=" " style="background: black; color: gold; padding-bottom: 3%"><br>Changement de plafond<br></h2>
                    <br>
                    <div class="card-body">
                        <form style="text-align: center">
                            <h4>Pour modifier votre plafond, veuillez faire la demande ci-dessous en entrant le montant du plafond souhaité :</h4>
                            <br>
                            <div style="width: 50%; margin: auto">
                                <input type="number" id="idplafond" class="form-control text-center" placeholder="Montant  (€)">
                                <br>
                                <button class="btn btn-primary btn-block" id="bvaliderplafond">Faire la demande</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <br>
            <br>
            
          
            




            
            
        </div>
        
        
        
        
        

    </body>
</html>
