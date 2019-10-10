/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.solutec.dao;

import fr.solutec.bean.Client;
import fr.solutec.bean.Compte;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

/**
 *
 * @author TLeMet
 */
public class CompteDao {

    public static void insertCompte(Compte compte, Client client) throws SQLException {
        String sql = "INSERT INTO user (idcompte, idcarte, statutcarte, decouvertcompte, soldecompte, idclient) VALUES (?, ?, ?, ?, ?, ?)";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement insertion = connexion.prepareStatement(sql);
        Long no_compte = 0L;
        Long no_carte = 0L;
        Boolean lever = false;
        while (lever){
            no_compte = 10000000000L + (long)(Math.random() * ((99999999999L - 10000000000L) + 1));
            no_carte = 1000000000000000L + (long)(Math.random() * ((9999999999999999L - 1000000000000000L) + 1));
            lever = isCompteUnique(no_compte, no_carte);
        }
        insertion.setString(1, Long.toString(no_compte));
        insertion.setString(2, Long.toString(no_carte));
        insertion.setBoolean(3, compte.isStatut());
        insertion.setDouble(4, compte.getDecouvert());
        insertion.setDouble(5, compte.getSolde());
        insertion.setInt(5, client.getId());
        insertion.execute();
    }
    
    public static Boolean isCompteUnique(Long compte, Long carte) throws SQLException {
        Boolean check = true;
        String sql = "SELECT COUNT(*) AS total FROM Compte WHERE (idcompte=? OR idcarte=?)";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement comptage = connexion.prepareStatement(sql);
        comptage.setString(1, Long.toString(compte));
        comptage.setString(2, Long.toString(carte));
        ResultSet rs = comptage.executeQuery();
        if (rs.getInt("total")>0){
            check = false;
        }
        return check;
    }
    
    public static void switchCarte(Compte compte) throws SQLException {
        String sql_interro = "SELECT statutcarte AS status FROM Compte WHERE idcompte=?";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement interro = connexion.prepareStatement(sql_interro);
        interro.setString(1, Long.toString(compte.getId()));
        ResultSet rs = interro.executeQuery();
        String new_status = "";
        if (rs.getBoolean("status")){
            new_status = "FALSE";
         }else{
            new_status = "TRUE";
        }
        String sql_swap = "UPDATE Compte SET statuscarte=? WHERE idcompte=?";
        PreparedStatement swap = connexion.prepareStatement(sql_swap);
        swap.setString(1, new_status);
        swap.setString(2, Long.toString(compte.getId()));
        swap.execute();
    }

    public static void changeDecouvert(Compte compte, double new_decouvert) throws SQLException{
        Connection connexion = AccessBD.getConnection();
        String sql_swap = "UPDATE Compte SET decouvertcompte=? WHERE idcompte=?";
        PreparedStatement swap = connexion.prepareStatement(sql_swap);
        swap.setDouble(1, new_decouvert);
        swap.setString(2, Long.toString(compte.getId()));
        swap.execute();
    }
    
    public static Double getSoldeCompte(Compte compte) throws SQLException{
        Connection connexion = AccessBD.getConnection();
        String sql_ask = "SELECT soldecompte AS solde FROM Compte WHERE idcompte=?";
        PreparedStatement ask = connexion.prepareStatement(sql_ask);
        ask.setString(1, Long.toString(compte.getId()));
        ResultSet rs = ask.executeQuery();
        return rs.getDouble("solde");
    }
    
    public static Double getDecouvertCompte(Compte compte) throws SQLException{
        Connection connexion = AccessBD.getConnection();
        String sql_ask = "SELECT decouvertcompte AS decouvert FROM Compte WHERE idcompte=?";
        PreparedStatement ask = connexion.prepareStatement(sql_ask);
        ask.setString(1, Long.toString(compte.getId()));
        ResultSet rs = ask.executeQuery();
        return rs.getDouble("decouvert");
    }
    
    public static Boolean getStatutCarteCompte(Compte compte) throws SQLException{
        Connection connexion = AccessBD.getConnection();
        String sql_ask = "SELECT statutcarte AS statut FROM Compte WHERE idcompte=?";
        PreparedStatement ask = connexion.prepareStatement(sql_ask);
        ask.setString(1, Long.toString(compte.getId()));
        ResultSet rs = ask.executeQuery();
        return rs.getBoolean("statut");
    }
    
    public static List<Compte> getComptesClient(Client client) throws SQLException{
       List<Compte> result = new ArrayList<>();
        Connection connexion = AccessBD.getConnection();
        String sql_ask = "SELECT * FROM Compte WHERE idclient=?";
        PreparedStatement ask = connexion.prepareStatement(sql_ask);
        ask.setInt(1, client.getId());
        ResultSet rs = ask.executeQuery();
        while (rs.next()) {
            Compte c = new Compte();
            c.setId(rs.getLong("idcompte"));
            c.setCarte(rs.getLong("idcarte"));
            c.setStatut(rs.getBoolean("statutcarte"));
            c.setSolde(rs.getDouble("decouvertcompte"));
            c.setDecouvert(rs.getDouble("soldecompte"));
            c.setId_client(rs.getInt("idclient"));
            result.add(c);
        }
        return result;
    }
}


