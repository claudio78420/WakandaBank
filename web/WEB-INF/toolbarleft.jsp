<%-- 
    Document   : toolbarleft
    Created on : 9 oct. 2019, 15:57:01
    Author     : esic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Ressources/toolbarleftcss.css">
    </head>
    <body>
        <div id="mySidenav" class="sidenav">
            <div style="text-align: center">
                <img src="Ressources/crossedarms.jpg" width="50%">
            </div>
            <br>
            
        <h3>Monsieur ${personne.nom}</h3>
          <a href="espaceclient">Comptes</a>
          <a href="plafond">Plafond</a>
          <a href="contactconseiller">Conseiller</a>
          <br>
          <a href="deco">Déconnexion</a>
        </div>
    </body>
</html>
