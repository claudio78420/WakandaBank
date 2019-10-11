<%-- 
    Document   : espaceadmin
    Created on : 10 oct. 2019, 13:24:02
    Author     : esic
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.indigo-pink.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
        <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
              integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
        <link rel="stylesheet" href="Ressources/espaceclientcss.css">
        <link rel="stylesheet" href="Ressources/espaceadmincss.css">
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
    </head>
    
    
    
    <body class="backgroundgeneral">
        
        

        
        <div class="container">


            <%@include file="toolbartopadmin.jsp" %>
        </div>
        
        <br>
        <div class="container backgroundcontainer">
            <br>
            
            <h1 style="text-align: center; color: white">Gestion des conseillers</h1>
            <br><br>
            
            
            <div class="col d-flex justify-content-center">
                <div class="card text-center" style="width: 100%;
                     box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30)">
                    <h2 class="card-img-top" alt="" style="background: black; color: gold; padding-bottom: 3%"><br>Conseillers activés</h2>
                    <div class="card-body">     
                        
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Nom</th>
                                    <th>Prénom</th>
                                    <th>Mail</th>
                                    <th>Modifier</th>
                                    <th>Désactiver</th>
                                </tr>
                            </thead>
                            

                            <tbody>
                                <c:forEach items="${listeconseillersactives}" var="m">
                                    <tr>
                                        <th scope="row">${m.id}</th>
                                        <td>${m.nom}</td>
                                        <td>${m.prenom}</td>
                                        <td>${m.mail}</td>
                                        <td><button class="btn btn-primary">Modifier</button></td>
                                        <td><button class="btn btn-primary">Désactiver</button></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    
                    </div>
                </div>
            </div>
            <br>
            <br>  
            

            
            
            
            
            
            
            
            
            <div class="col d-flex justify-content-center">
                <div class="card text-center" style="width: 100%;
                     box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30)">
                    <h2 class="card-img-top" alt="" style="background: black; color: gold; padding-bottom: 3%"><br>Conseillers désactivés</h2>
                    <div class="card-body"> 
                        
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Nom</th>
                                    <th>Prénom</th>
                                    <th>Mail</th>
                                    <th>Modifier</th>
                                    <th>Activer</th>
                                </tr>
                            </thead>
                            

                            <tbody>
                                <c:forEach items="${listeconseillersdesactives}" var="p">
                                    <tr>
                                        <th scope="row">${p.id}</th>
                                        <td>${p.nom}</td>
                                        <td>${p.prenom}</td>
                                        <td>${p.mail}</td>
                                        <td><button class="btn btn-primary">Modifier</button></td>
                                        <td><button class="btn btn-primary">Activer</button></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        
                        
                        
                            <!-- Trigger/Open The Modal -->
                            <button class="btn btn-primary">Ajouter conseiller</button>

 
                        
                        
                    </div>
                </div>
            </div>
            
            <br>
            <br>
            
            
            
            
                        <div class="col d-flex justify-content-center">
                <div class="card text-center" style="width: 100%;
                     box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30)">
                    <h2 class="card-img-top" alt="" style="background: black; color: gold; padding-bottom: 3%"><br>Créer un compte conseiller</h2>
                    <div class="card-body text-center"> 
                        <form action ="espaceadmin" method="POST" class='text-center'>
                            <div class="form-group text-center">
                                <input type="email" placeholder="mail"
                                       required="" name="mail" class="form-control text-center">
                            </div>
                            <br>
                            <div class="form-group">
                                <input type="text" placeholder="nom"
                                       required="" name="nom" class="form-control text-center">
                            </div>
                            <br>
                            <div class="form-group">
                                <input type="text" placeholder="prénom"
                                       required="" name="prenom" class="form-control text-center">
                            </div>
                            <br>
                            <div class="form-group">
                                <input type="password" placeholder="mot de passe"
                                       required="" name="mdp" class="form-control text-center">
                            </div>
                            <br>
                            <button type="submit" class="btn btn-primary" style="color: goldenrod" >
                                Créer
                            </button>
                        </form>
                    </div>
                </div>
            </div>
            
            <br>
            <br>


        </div>
    </body>
</html>
