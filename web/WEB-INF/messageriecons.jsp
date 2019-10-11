<%-- 
    Document   : messageriecons
    Created on : 11 oct. 2019, 09:51:31
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

            <%@include file="toolbarleftconseiller.jsp" %>

            <%@include file="toolbartopconseiller.jsp" %>
        </div>
        
        <br>
        <div class="container backgroundcontainer" style="height: 2000px">
            <br>
            
            <h1 style="text-align: center; color: white">Messagerie</h1>
            <br><br>
            
            
            <div class="col d-flex justify-content-center">
                <div class="card text-center" style="width: 100%;
                     box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30)">
                    <h2 class="card-img-top" alt="" style="background: black; color: gold; padding-bottom: 3%"><br>Envoyer un message</h2>
                    <div class="card-body">
                        
                        
                       <form style="text-align: center" action ="contactconseiller" method="POST">
                            <h4>Entrez votre message ci-dessous :</h4>
                            <br>
                            <textarea rows = "5" cols = "120" name = "message"></textarea>
                            <br><br>
                            <button class="btn btn-primary btn-block" id="benvoyermessage" style="width: 20%; margin: auto" type = "submit">Envoyer</button>
                        </form>
                        
                        
                        
                    </div>
                </div>
            </div>
            <br>
            <br>

            
            
             <div class="col d-flex justify-content-center">
                <div class="card text-center" style="width: 100%;
                     box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30)">
                    <h2 class="card-img-top" alt=" " style="background: black; color: gold; padding-bottom: 3%"><br>Boite de réception<br></h2>
                    <br>
                    <div class="card-body">
                        <form style="text-align: center">
                            <br>
                            <textarea rows = "5" cols = "120" name = "boitereception">
                                    ${messagerie}
                            </textarea>
                                <br><br>


                        </form>
                    </div>
                </div>
            </div>
            <br>
            <br>           
            
            
        </div>

    </body>
</html>
