<%-- 
    Document   : infosclient
    Created on : 10 oct. 2019, 14:01:13
    Author     : esic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Espace Client</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.indigo-pink.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
        <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
              integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
        <link rel="stylesheet" href="Ressources/espaceclientcss.css">
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
        

        
    </head>
    <body class="backgroundgeneral">
        
        <div class="container">

            <%@include file="toolbarleft.jsp" %>

            <%@include file="toolbartop.jsp" %>
        </div>
        
        <br>
        <div class="container backgroundcontainer">
            <br>
            
            <h1 style="text-align: center; color: white">Vos informations personnelles</h1>
            <br><br>
            
            
            <div class="col d-flex justify-content-center">
                <div class="card text-center" style="width: 70%;
                     box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30)">
                    <h2 class="card-img-top" alt="" style="background: black; color: gold; padding-bottom: 3%"><br>Modifier vos données</h2>
                    <div class="card-body">
                        <br>
                            
                            <div>
                                <h5>Nom :</h5>
                                <br>
                                <input type="text" id="auto" class="form-control text-center" placeholder="Nom" value="${client.nom}">
                            </div>
                            <br><br>
                            <div>
                                <h5>Prénom :</h5>
                                <br>
                                <input type="text" id="auto" class="form-control text-center" placeholder="Prénom" value="${client.prenom}">
                            </div>
                            <br><br>
                            <div>
                                <h5>Mail :</h5>
                                <br>
                                <input type="text" id="auto" class="form-control text-center" placeholder="Mail" value="${client.mail}">
                            </div>
                            <br><br>
                            <div>
                                <h5>Password :</h5>
                                <br>
                                <input type="text" id="auto" class="form-control text-center" placeholder="Mot de passe">
                            </div>
                            <br><br>
                            <div>
                                <button type="submit" class="btn btn-primary btn-block" id="validerinfos">Enregistrer</button>

                            </div>
                        
                                
                               
                

                               
                            

                        <br><br><br>
                    </div>
                </div>
            </div>
            <br>
            <br>
            <br>
            
          
        </div>
        

    </body>
</html>
