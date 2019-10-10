/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.solutec.dao;

import fr.solutec.bean.Client;
import fr.solutec.bean.Compte;
import fr.solutec.bean.HistoriqueChiffres;
import fr.solutec.bean.HistoriqueProfils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author stagiaire
 */
public class HistoriqueDao {
    
    public static List<HistoriqueChiffres> getHistoriqueChiffres(Compte compte) throws SQLException {
        List<HistoriqueChiffres> historique = new ArrayList<>();
        String sql_ask = "SELECT * FROM Historique_chiffres WHERE idcompte=?";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement requette = connexion.prepareStatement(sql_ask);
        requette.setString(1, Integer.toString(compte.getId()));
        ResultSet rs = requette.executeQuery();
        while (rs.next()) {
            HistoriqueChiffres hc = new HistoriqueChiffres();
            hc.setId(rs.getInt("idchiffres"));
            hc.setTimestamp(rs.getDate("date"));
            hc.setAncien(rs.getDouble("ancien"));
            hc.setNouveau(rs.getDouble("nouveau"));
            hc.setIdmodif(rs.getInt("idmodif"));
            hc.setIdcompte(rs.getInt("idcompte"));
            historique.add(hc);
        }
        return historique;
    }
    
    public static List<HistoriqueChiffres> getAllHistoriqueChiffres() throws SQLException {
        List<HistoriqueChiffres> historique = new ArrayList<>();
        String sql_ask = "SELECT * FROM Historique_chiffres";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement requette = connexion.prepareStatement(sql_ask);
        ResultSet rs = requette.executeQuery();
        while (rs.next()) {
            HistoriqueChiffres hc = new HistoriqueChiffres();
            hc.setId(rs.getInt("idchiffres"));
            hc.setTimestamp(rs.getDate("date"));
            hc.setAncien(rs.getDouble("ancien"));
            hc.setNouveau(rs.getDouble("nouveau"));
            hc.setIdmodif(rs.getInt("idmodif"));
            hc.setIdcompte(rs.getInt("idcompte"));
            historique.add(hc);
        }
        return historique;
    }
    
    
    
    public static List<HistoriqueProfils> getHistoriqueProfils(Compte compte) throws SQLException {
        List<HistoriqueProfils> historique = new ArrayList<>();
        String sql_ask = "SELECT * FROM Historique_profils WHERE idcompte=?";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement requette = connexion.prepareStatement(sql_ask);
        requette.setString(1, Integer.toString(compte.getId()));
        ResultSet rs = requette.executeQuery();
        while (rs.next()) {
            HistoriqueProfils hc = new HistoriqueProfils();
            hc.setId(rs.getInt("idchiffres"));
            hc.setTimestamp(rs.getDate("date"));
            hc.setAncien(rs.getString("ancien"));
            hc.setNouveau(rs.getString("nouveau"));
            hc.setIdmodif(rs.getInt("idmodif"));
            hc.setIdcompte(rs.getInt("idcompte"));
            historique.add(hc);
        }
        return historique;
    }
    
    public static List<HistoriqueProfils> getAllHistoriqueProfils() throws SQLException {
        List<HistoriqueProfils> historique = new ArrayList<>();
        String sql_ask = "SELECT * FROM Historique_profils";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement requette = connexion.prepareStatement(sql_ask);
        ResultSet rs = requette.executeQuery();
        while (rs.next()) {
            HistoriqueProfils hc = new HistoriqueProfils();
            hc.setId(rs.getInt("idchiffres"));
            hc.setTimestamp(rs.getDate("date"));
            hc.setAncien(rs.getString("ancien"));
            hc.setNouveau(rs.getString("nouveau"));
            hc.setIdmodif(rs.getInt("idmodif"));
            hc.setIdcompte(rs.getInt("idcompte"));
            historique.add(hc);
        }
        return historique;
    }
    
}
