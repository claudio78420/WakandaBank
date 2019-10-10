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

/**
 *
 * @author TLeMet
 */
public class CompteDao {

    public static void insertCompte(Compte compte, Client client) throws SQLException {
        String sql = "INSERT INTO user (idcompte, idcarte, statutcarte, decouvertcompte, soldecompte, idclient) VALUES (?, ?, ?, ?, ?, ?)";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement insertion = connexion.prepareStatement(sql);
        insertion.setString(1, Integer.toString(compte.getId()));
        insertion.setString(2, Integer.toString(compte.getCarte()));
        insertion.setBoolean(3, compte.isStatut());
        insertion.setDouble(4, compte.getDecouvert());
        insertion.setDouble(5, compte.getSolde());
        insertion.setInt(5, client.getIdclient());
        insertion.execute();
    }
    
    public static Boolean isCompteUnique(int compte, int carte) throws SQLException {
        Boolean check = true;
        String sql = "SELECT COUNT(*) AS total FROM Compte WHERE (idcompte=? OR idcarte=?)";
        Connection connexion = AccessBD.getConnection();
        PreparedStatement comptage = connexion.prepareStatement(sql);
        comptage.setString(1, Integer.toString(compte));
        comptage.setString(2, Integer.toString(carte));
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
        interro.setString(1, Integer.toString(compte.getId()));
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
        swap.setString(2, Integer.toString(compte.getId()));
        swap.execute();
    }

    public static void changeDecouvert(Compte compte, double new_decouvert) throws SQLException{
        Connection connexion = AccessBD.getConnection();
        String sql_swap = "UPDATE Compte SET decouvertcompte=? WHERE idcompte=?";
        PreparedStatement swap = connexion.prepareStatement(sql_swap);
        swap.setDouble(1, new_decouvert);
        swap.setString(2, Integer.toString(compte.getId()));
        swap.execute();
    }
    
    public static Double getSoldeCompte(Compte compte) throws SQLException{
        Connection connexion = AccessBD.getConnection();
        String sql_ask = "SELECT soldecompte AS solde FROM Compte WHERE idcompte=?";
        PreparedStatement ask = connexion.prepareStatement(sql_ask);
        ask.setString(1, Integer.toString(compte.getId()));
        ResultSet rs = ask.executeQuery();
        return rs.getDouble("solde");
    }
    
    public static Double getDecouvertCompte(Compte compte) throws SQLException{
        Connection connexion = AccessBD.getConnection();
        String sql_ask = "SELECT decouvertcompte AS decouvert FROM Compte WHERE idcompte=?";
        PreparedStatement ask = connexion.prepareStatement(sql_ask);
        ask.setString(1, Integer.toString(compte.getId()));
        ResultSet rs = ask.executeQuery();
        return rs.getDouble("decouvert");
    }
    
    public static Boolean getStatutCarteCompte(Compte compte) throws SQLException{
        Connection connexion = AccessBD.getConnection();
        String sql_ask = "SELECT statutcarte AS statut FROM Compte WHERE idcompte=?";
        PreparedStatement ask = connexion.prepareStatement(sql_ask);
        ask.setString(1, Integer.toString(compte.getId()));
        ResultSet rs = ask.executeQuery();
        return rs.getBoolean("statut");
    }
    
    public static List<Compte> getComptesClient(Client client) throws SQLException{
       List<Compte> result = new ArrayList<>();
        Connection connexion = AccessBD.getConnection();
        String sql = "SELECT * FROM Compte WHERE idclient=?";
        PreparedStatement requette = connexion.prepareStatement(sql);
        sql.setString(1, Integer.toString(client.getIdclient()));
        ResultSet rs = requette.executeQuery();
        while (rs.next()) {
            Compte c = new Compte();
            c.setId(rs.getInt("idcompte"));
            c.setCarte(rs.getInt("idcarte"));
            c.setStatut(rs.getBoolean("statutcarte"));
            c.setSolde(rs.getDouble("decouvertcompte"));
            c.setDecouvert(rs.getDouble("soldecompte"));
            c.setId_client(rs.getInt("idclient"));
            result.add(c);
        }
        return result;
    }
}


