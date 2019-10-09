/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.solutec.dao;

import fr.solutec.bean.Client;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
        }
        return resultat;
    }

    public static void insertClient(Client client) throws SQLException {
        String sql = "INSERT INTO user (nomclient, prenomclient, mailclient, passwordclient) VALUES (?, ?, ?, ?)";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement requette = connexion.prepareStatement(sql);
        requette.setString(1, client.getNom());
        requette.setString(2, client.getPrenom());
        requette.setString(3, client.getMail());
        requette.setString(4, client.getPassword());

        requette.execute();
    }

    public static List<Client> getAllClients() throws SQLException {
        List<Client> result = new ArrayList<>();

        String sql = "SELECT * FROM Client";
        Connection connexion = AccessBD.getConnection();

        Statement requette = connexion.createStatement();

        ResultSet rs = requette.executeQuery(sql);

        while (rs.next()) {
            Client c = new Client();
            c.setId(rs.getInt("idclient"));
            c.setNom(rs.getString("nomclient"));
            c.setPrenom(rs.getString("prenomclient"));
            c.setMail(rs.getString("mailclient"));

            result.add(c);
        }

        return result;
    }

}
