<%-- 
    Document   : connexion
    Created on : 9 oct. 2019, 15:50:51
    Author     : esic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page de connexion</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.indigo-pink.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
        <link rel="stylesheet"
              href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
              integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
        <script defer src="https://code.getmdl.io/1.2.1/material.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js"
                integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U"
        crossorigin="anonymous"></script>
        <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"
                integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9"
        crossorigin="anonymous"></script>
    </head>

    <body style="background-image: url(Ressources/LogoAvenger.jpg)">
        
        <div class="container text-center">
        <br>
        <h2 style = "color:goldenrod"> Connexion Conseiller</h2>
        <br>
            <div class="row">
                <div class="col d-flex justify-content-center">
                    <div class="card text-center" style="width: 30rem;
                        box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30)">
                        <div class="card-header" style="background-color: black; color: white">
                            Formulaire
                        </div>
                        <div class="card-body">
                            <form action ="connexioncons" method="POST">
                                <div class="form-group">
                                    <input type="email" placeholder="mail"
                                           required="" name="mail" class="form-control" 
                                </div>
                                <br>
                                <div class="form-group">
                                    <input type="password" placeholder="mot de passe"
                                           required="" name="mdp" class="form-control">
                                </div>
                                <br>
                                <h5 id="msg" value="msg"></h5>
                                <button type="submit" class="btn btn-primary text-center" style="color: goldenrod" >
                                    se connecter
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>        
            <br>
            <br>
        </div>   
    </body>
</html>
