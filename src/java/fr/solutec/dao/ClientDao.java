/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.solutec.dao;

import fr.solutec.bean.Client;
import java.awt.Image;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

/**
 *
 * @author TLeMet
 */
public class ClientDao {

    public static Client getByLoginPass(String login, String password) throws SQLException {
        Client resultat = null;
        String sql = "SELECT * FROM Client WHERE mailclient=? AND passwordclient=?";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement requette = connexion.prepareStatement(sql);
        requette.setString(1, login);
        requette.setString(2, password);
        ResultSet rs = requette.executeQuery();
        if (rs.next()) {
            resultat = new Client();
            resultat.setId(rs.getInt("idclient"));
            resultat.setNom(rs.getString("nomclient"));
            resultat.setPrenom(rs.getString("prenomclient"));
            resultat.setMail(rs.getString("mailclient"));
            resultat.setIdcons(rs.getInt("idcons"));
        }
        return resultat;
    }

    public static void insertClient(Client client) throws SQLException {
        int many_cons = 1;
        String sql_cons = "SELECT COUNT(*) AS total FROM Conseiller";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement comptage = connexion.prepareStatement(sql_cons);
        ResultSet rs = comptage.executeQuery();
        if (rs.next()){
            many_cons = rs.getInt("total");
        }
        Connection connexion2 = AccessBD.getConnection();
        int random_cons = ThreadLocalRandom.current().nextInt(1,many_cons);        
        String sql = "INSERT INTO Client (nomclient, prenomclient, mailclient, passwordclient, idcons) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement insertion = connexion2.prepareStatement(sql);
        insertion.setString(1, client.getNom());
        insertion.setString(2, client.getPrenom());
        insertion.setString(3, client.getMail());
        insertion.setString(4, client.getPassword());
        insertion.setInt(5, random_cons);
        insertion.execute();
    }
    
    public static void editClientPassword(Client client, String new_pw) throws SQLException{
        String sql_edit = "UPDATE Client SET passwordclient=? WHERE idclient=?";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement pw_edit = connexion.prepareStatement(sql_edit);
        pw_edit.setString(1, new_pw);
        pw_edit.setString(2, String.valueOf(client.getId()));
        pw_edit.execute();
    }
    
    /* Fonction pour changer l'avatar, pb de conversion Image<>Blob
    
    public static void editClientImage(Client client, Image new_pic) throws SQLException{
        String sql_edit = "UPDATE Client SET photoclient=? WHERE idclient=?";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement pw_edit = connexion.prepareStatement(sql_edit);
        pw_edit.setBlob(1, new_pic);
        pw_edit.setString(2, String.valueOf(client.getId()));
        pw_edit.execute();
    }

    */

    public static List<Client> getAllClients() throws SQLException {
        List<Client> result = new ArrayList<>();
        String sql = "SELECT * FROM Client";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement requette = connexion.prepareStatement(sql);
        ResultSet rs = requette.executeQuery();
        while (rs.next()) {
            Client c = new Client();
            c.setId(rs.getInt("idclient"));
            c.setNom(rs.getString("nomclient"));
            c.setPrenom(rs.getString("prenomclient"));
            c.setMail(rs.getString("mailclient"));
            c.setIdcons(rs.getInt("idcons"));
            result.add(c);
        }
        return result;
    }

}
