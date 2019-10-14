/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.solutec.dao;

import fr.solutec.bean.Conseiller;
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
public class ConseillerDao {

    public static Conseiller getByLoginPass(String login, String password) throws SQLException {
        Conseiller resultat = null;
        String sql = "SELECT * FROM Conseiller WHERE mailcons=? AND passwordcons=?";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement requette = connexion.prepareStatement(sql);
        requette.setString(1, login);
        requette.setString(2, password);
        ResultSet rs = requette.executeQuery();
        if (rs.next()) {
            resultat = new Conseiller();
            resultat.setId(rs.getInt("idcons"));
            resultat.setNom(rs.getString("nomcons"));
            resultat.setPrenom(rs.getString("prenomcons"));
            resultat.setMail(rs.getString("mailcons"));
        }
        return resultat;
    }

    public static void insertConseiller(Conseiller cons) throws SQLException {
        String sql = "INSERT INTO Conseiller (nomcons, prenomcons, mailcons, passwordcons, statutcons) VALUES (?, ?, ?, ?, 0)";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement requette = connexion.prepareStatement(sql);
        requette.setString(1, cons.getNom());
        requette.setString(2, cons.getPrenom());
        requette.setString(3, cons.getMail());
        requette.setString(4, cons.getPassword());
        requette.execute();
    }
    
    public static void editConseillerPassword(Conseiller cons, String new_pw) throws SQLException{
        String sql_edit = "UPDATE Conseiller SET passwordcons=? WHERE idcons=?";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement pw_edit = connexion.prepareStatement(sql_edit);
        pw_edit.setString(1, new_pw);
        pw_edit.setString(2, String.valueOf(cons.getId()));
        pw_edit.execute();
    }

    public static List<Conseiller> getAllCons() throws SQLException {
        List<Conseiller> result = new ArrayList<>();
        String sql = "SELECT * FROM Conseiller";
        Connection connexion = AccessBD.getConnection();
        Statement requette = connexion.createStatement();
        ResultSet rs = requette.executeQuery(sql);
        while (rs.next()) {
            Conseiller c = new Conseiller();
            c.setId(rs.getInt("idcons"));
            c.setNom(rs.getString("nomcons"));
            c.setPrenom(rs.getString("prenomcons"));
            c.setMail(rs.getString("mailcons"));
            result.add(c);
        }
        return result;
    }
    
    public static List<Conseiller> getActiveCons() throws SQLException {
        List<Conseiller> result = new ArrayList<>();
        String sql = "SELECT * FROM Conseiller WHERE statutcons=1";
        Connection connexion = AccessBD.getConnection();
        Statement requette = connexion.createStatement();
        ResultSet rs = requette.executeQuery(sql);
        while (rs.next()) {
            Conseiller c = new Conseiller();
            c.setId(rs.getInt("idcons"));
            c.setNom(rs.getString("nomcons"));
            c.setPrenom(rs.getString("prenomcons"));
            c.setMail(rs.getString("mailcons"));
            result.add(c);
        }
        return result;
    }
    
    public static List<Conseiller> getDisabledCons() throws SQLException {
        List<Conseiller> result = new ArrayList<>();
        String sql = "SELECT * FROM Conseiller WHERE statutcons=0";
        Connection connexion = AccessBD.getConnection();
        Statement requette = connexion.createStatement();
        ResultSet rs = requette.executeQuery(sql);
        while (rs.next()) {
            Conseiller c = new Conseiller();
            c.setId(rs.getInt("idcons"));
            c.setNom(rs.getString("nomcons"));
            c.setPrenom(rs.getString("prenomcons"));
            c.setMail(rs.getString("mailcons"));
            result.add(c);
        }
        return result;
    }
    
    public static void switchCons(Conseiller cons) throws SQLException {
        String sql_interro = "SELECT statutcons AS status FROM Conseiller WHERE idcons=?";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement interro = connexion.prepareStatement(sql_interro);
        interro.setString(1, Long.toString(cons.getId()));
        ResultSet rs = interro.executeQuery();
        String new_status = "";
        if (rs.next()){
            if (rs.getBoolean("status")){
                new_status = "0";
             }else{
                new_status = "1";
            }
        }
        String sql_swap = "UPDATE Conseiller SET statutcons=? WHERE idcons=?";
        PreparedStatement swap = connexion.prepareStatement(sql_swap);
        swap.setString(1, new_status);
        swap.setString(2, Integer.toString(cons.getId()));
        swap.execute();
    }
    public static Conseiller getById(int id) throws SQLException {
        
        Conseiller resultat = null;
        String sql = "SELECT * FROM Conseiller WHERE idcons=?";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement requette = connexion.prepareStatement(sql);
        requette.setInt(1, id);
        ResultSet rs = requette.executeQuery();
        if (rs.next()) {
            resultat = new Conseiller();
            resultat.setId(rs.getInt("idcons"));
            resultat.setNom(rs.getString("nomcons"));
            resultat.setPrenom(rs.getString("prenomcons"));
            resultat.setMail(rs.getString("mailcons"));
        }
        return resultat;
    }
}
