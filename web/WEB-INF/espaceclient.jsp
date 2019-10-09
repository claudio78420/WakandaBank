<%-- 
    Document   : espaceclient
    Created on : 9 oct. 2019, 11:57:00
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
        <link rel="stylesheet" href="Ressources/toolbarleftcss.css">
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
        

        
    </head>
    <body style="background-color: gold">
        
        <div class="container">

            <div id="mySidenav" class="sidenav">
              <a href="#">Comptes</a>
              <a href="#">Plafond</a>
              <a href="#">Conseiller</a>
              <br>
              <a href="#">Déconnexion</a>
            </div>

            <%@include file="toolbartop.jsp" %>
        </div>
        
        
        <div class="container" style="background-color: white">
            
            <button class="btn btn-primary">Hello</button>
            
            
        </div>
        
        
        
        
        

    </body>
</html>
