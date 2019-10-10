<%-- 
    Document   : index
    Created on : 9 oct. 2019, 13:28:40
    Author     : esic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page d'acceil</title>
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
        
      <nav class="navbar navbar-expand-lg" style="background-color: black; color: goldenrod">  
        <a class="navbar-brand" href="#">
            <button class ="btn btn-primary" style="color: goldenrod; background-color: black">
                Wakanda Bank
            </button>
        </a>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div class="navbar-nav">
            <a class="nav-item nav-link active" href="accueil">
                <button class ="btn btn-primary" style="color: goldenrod; background-color: black">
                    Accueil 
                </button>
                <span class="sr-only">(current)</span>
            </a>
            <a class="nav-item nav-link" href="#">
                <button class ="btn btn-primary" style="color: goldenrod; background-color: black">
                    Features 
                </button>
            </a>
            <a class="nav-item nav-link" href="#">
                <button class ="btn btn-primary" style="color: goldenrod; background-color: black">
                    Purchace 
                </button>
            </a>


                <button onclick="location.href = 'connexion'" class="btn btn-primary my-2 my-sm-0" style="color: goldenrod; background-color: black;
                        outline: 1; outline-color: goldenrod">

                    Se connecter

                </button>


          </div>
        </div>
      </nav>
        
        <div class="container text-center" style="background-color: white">
        <br>
        <br>
            <div class="row">
                <div class="col-sm-6">
                    <!-- Définir la colonne 1 ici -->
                    <div class="col d-flex justify-content-center">
                        <div class="card text-center" style="width: 18rem;
                             box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30)">
                            <img src="https://image.freepik.com/vecteurs-libre/fond-ornemental-luxe-noir-or_1017-20607.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Wakanda World</h5>
                                <p class="card-text">Découvrez l'actualité du Wakanda.</p>
                            </div>
                            <div class="card-body">
                                <button type='button' class ='btn btn-outline-dark'
                                        style="color:black">
                                    Accéder
                                </button>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="col d-flex justify-content-center">
                        <div class="card text-center" style="width: 18rem;
                             box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30)">
                            <img src="https://image.freepik.com/vecteurs-libre/fond-ornemental-luxe-noir-or_1017-20607.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Wakanda World</h5>
                                <p class="card-text">Découvrez l'actualité du Wakanda.</p>
                            </div>
                            <div class="card-body">
                                <button type='button' class ='btn btn-outline-dark'
                                        style="color:black">
                                    Accéder
                                </button>
                            </div>
                        </div>
                    </div>                    
                </div>
                <div class="col-sm-6">
                    <!-- Définir la colonne 2 ici -->
                    <div class="col d-flex justify-content-center">
                        <div class="card text-center" style="width: 18rem;
                             box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30)">
                            <img src="https://image.freepik.com/vecteurs-libre/fond-ornemental-luxe-noir-or_1017-20607.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Wakanda World</h5>
                                <p class="card-text">Découvrez l'actualité du Wakanda.</p>
                            </div>
                            <div class="card-body">
                                <button type='button' class ='btn btn-outline-dark'
                                        style="color:black">
                                    Accéder
                                </button>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="col d-flex justify-content-center">
                        <div class="card text-center" style="width: 18rem;
                             box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30)">
                            <img src="https://image.freepik.com/vecteurs-libre/fond-ornemental-luxe-noir-or_1017-20607.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Wakanda World</h5>
                                <p class="card-text">Découvrez l'actualité du Wakanda.</p>
                            </div>
                            <div class="card-body">
                                <button type='button' class ='btn btn-outline-dark'
                                        style="color:black">
                                    Accéder
                                </button>
                            </div>
                        </div>
                    </div>                    
                </div>
            </div>
            <br>
            <br>
            
            <hr>
            
            <footer class="site-footer">
                <!-- Mettre les liens vers les connexions administrateurs -->
                <div  class = "row text-center">
                    <div class = "col-sm-3">
                        <a href="connexioncons" style="color: goldenrod"> Connexion conseiller </a>
                    </div>
                    <div class = "col-sm-3">
                        <a href="connexionadmin" style="color: goldenrod"> Connexion administrateur </a>
                    </div>
                    <div class = "col-sm-3" >
                        <a href="#" style="color: goldenrod"> Mentions légales </a>
                    </div>
                    <div class = "col-sm-3">
                        <a href="#" style="color: goldenrod"> Protection des données </a>
                    </div>
                </div>
            </footer>
        </div>      
    </body>
</html>
