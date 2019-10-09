/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.solutec.dao;

import fr.solutec.bean.Administrateur;
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
public class AdministrateurDao {

    public static Administrateur getByLoginPass(String login, String password) throws SQLException {
        Administrateur resultat = null;

        String sql = "SELECT * FROM Administrateur WHERE mailadmin=? AND passwordadmin=?";
        Connection connexion = AccessBD.getConnection();

        PreparedStatement requette = connexion.prepareStatement(sql);
        requette.setString(1, login);
        requette.setString(2, password);

        ResultSet rs = requette.executeQuery();

        if (rs.next()) {
            resultat = new Administrateur();
            resultat.setId(rs.getInt("idadmin"));
            resultat.setNom(rs.getString("nomadmin"));
            resultat.setPrenom(rs.getString("prenomadmin"));
            resultat.setMail(rs.getString("mailadmin"));
        }
        return resultat;
    }

    public static void insertAdministrateur(Administrateur admin) throws SQLException {
        String sql = "INSERT INTO Administrateur (nomadmin, prenomadmin, mailadmin, passwordadmin) VALUES (?, ?, ?, ?)";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement requette = connexion.prepareStatement(sql);
        requette.setString(1, admin.getNom());
        requette.setString(2, admin.getPrenom());
        requette.setString(3, admin.getMail());
        requette.setString(4, admin.getPassword());

        requette.execute();
    }

    public static List<Administrateur> getAllAdministrateurs() throws SQLException {
        List<Administrateur> result = new ArrayList<>();

        String sql = "SELECT * FROM Administrateur";
        Connection connexion = AccessBD.getConnection();

        Statement requette = connexion.createStatement();

        ResultSet rs = requette.executeQuery(sql);

        while (rs.next()) {
            Administrateur u = new Administrateur();
            u.setId(rs.getInt("idadmin"));
            u.setNom(rs.getString("nomadmin"));
            u.setPrenom(rs.getString("prenomadmin"));
            u.setMail(rs.getString("mailadmin"));

            result.add(u);
        }

        return result;
    }

}