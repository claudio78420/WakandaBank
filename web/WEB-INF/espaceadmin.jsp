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

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
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
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listeconseillersactives}" var="m">
                                    <tr>
                                        <th scope="row">${m.id}</th>
                                        <td>${m.nom}</td>
                                        <td>${m.prenom}</td>
                                        <td>${m.mail}</td>
                                        <td><button name="${m.id}" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal2" style="color: goldenrod">Modifier</button></td>
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
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listeconseillersdesactives}" var="p">
                                    <tr>
                                        <th scope="row">${p.id}</th>
                                        <td>${p.nom}</td>
                                        <td>${p.prenom}</td>
                                        <td>${p.mail}</td>
                                        <td><button name="${p.id}" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal2" style="color: goldenrod">Modifier</button></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        
                        
                        
                        
                        


                        <!-- Trigger/Open The Modal -->
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" style="color: goldenrod">Ajouter conseiller</button>
                        
                        
                        <!-- Modal 1 -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                          <div class="modal-dialog" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                                </button>
                              </div>
                              <div class="modal-body">
                                
                                  
                                  
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
                                                   required="" name="mdp1" class="form-control text-center">
                                        </div>
                                        <br>

                                    </div>
                                </div>
                                  
                                  
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary" style="color: goldenrod">Créer</button>
                                </form>
                              </div>
                            </div>
                          </div>
                        </div>
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        <!-- Modal 2 -->
                        <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                          <div class="modal-dialog" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                                </button>
                              </div>
                              <div class="modal-body">
                                
                                  
                                <div class="card text-center" style="width: 100%;
                                 box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30)">
                                <h2 class="card-img-top" alt="" style="background: black; color: gold; padding-bottom: 3%"><br>Modifier un compte conseiller</h2>
                                <div class="card-body text-center"> 
                                    <form action ="espaceadmin2" method="POST" class='text-center'>
                                        <div class="form-group text-center">
                                            <input type="email" placeholder="mail"
                                                   required="" name="mail" class="form-control text-center" value="${conseillerchoisi.mail}">
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <input type="text" placeholder="nom"
                                                   required="" name="nom" class="form-control text-center" value="${conseillerchoisi.nom}">
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <input type="text" placeholder="prénom"
                                                   required="" name="prenom" class="form-control text-center" value="${conseillerchoisi.prenom}">
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <input type="password" placeholder="mot de passe"
                                                   required="" name="mdp2" class="form-control text-center">
                                        </div>
                                        <br>           
        <div class="container">                                        
<div class="input-group mb-3">
  <div class="input-group-prepend">
    <div class="input-group-text">
        <input type="checkbox">
    <p>Activé</p>
    </div>
  </div>
</div>
            </div>
                                        
                                        <br>

                                    </div>
                                </div>
                                  
                                  
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary" style="color: goldenrod">Modifier</button>
                                </form>
                              </div>
                            </div>
                          </div>
                        </div>
                        
                                    
                                    
                                    
                    </div>
                </div>
            </div>
            <br>
            <br>



            <br>
            <br>






        </div>









    </body>
</html>
