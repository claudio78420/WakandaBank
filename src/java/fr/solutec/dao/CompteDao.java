/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.solutec.dao;

import fr.solutec.bean.Client;
import fr.solutec.bean.Compte;
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
public class CompteDao {

    public static void insertCompte(Compte compte, Client client) throws SQLException {
        String sql = "INSERT INTO user (idcompte, idcarte, statutcarte, decouvertcompte, soldecompte, idclient) VALUES (?, ?, ?, ?, ?, ?)";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement requette = connexion.prepareStatement(sql);
        requette.setString(1, Integer.toString(compte.getId()));
        requette.setString(2, Integer.toString(compte.getCarte()));
        requette.setString(3, Boolean.toString(compte.isStatut()));
        requette.setString(4, Double.toString(compte.getDecouvert()));
        requette.setString(5, Double.toString(compte.getSolde()));
        requette.setString(5, Integer.toString(client.getId()));

        requette.execute();
    }
    
    public static Boolean isCompteUnique(int compte, int carte) throws SQLException {
        Boolean check = true;
        String sql = "SELECT COUNT(*) AS total FROM Compte where (idcompte=? OR idcarte=?)";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement requette = connexion.prepareStatement(sql);
        requette.setString(1, Integer.toString(compte));
        requette.setString(2, Integer.toString(carte));
        ResultSet rs = requette.executeQuery();
        if (rs.getInt("total")>0){
            check = false;
        }
        return check;
    }

    public static List<Client> getAllClients() throws SQLException {
        List<Client> result = new ArrayList<>();

        String sql = "SELECT * FROM Client";
        Connection connexion = AccessBD.getConnection();

        Statement requette = connexion.createStatement();

        ResultSet rs = requette.executeQuery(sql);

        while (rs.next()) {
            Client u = new Client();
            u.setId(rs.getInt("idclient"));
            u.setNom(rs.getString("nomclient"));
            u.setPrenom(rs.getString("prenomclient"));
            u.setMail(rs.getString("mailclient"));

            result.add(u);
        }

        return result;
    }

}
