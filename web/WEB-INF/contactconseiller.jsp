<%-- 
    Document   : contactconseiller
    Created on : 9 oct. 2019, 15:15:16
    Author     : esic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Ressources/toolbarleftcss.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.indigo-pink.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
        <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
              integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    </head>
<body style="background-color: gold">
        
        <div class="container">

            <div id="mySidenav" class="sidenav">
                <h3>Monsieur ${personne.nom}</h3>
              <a href="espaceclient">Comptes</a>
              <a href="plafond">Plafond</a>
              <a href="contactconseiller">Conseiller</a>
              <br>
              <a href="#">Déconnexion</a>
            </div>

            <%@include file="toolbartop.jsp" %>
        </div>
        
        <br>
        <div class="container" style="background-color: white">
            <br>
            
            <h1 style="text-align: center">Comptes</h1>
            <button class="btn btn-primary">Hello</button>
            
            
        </div>
        
        
        
        
        

    </body>
</html>
