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
        PreparedStatement insertion = connexion.prepareStatement(sql);
        insertion.setString(1, Integer.toString(compte.getId()));
        insertion.setString(2, Integer.toString(compte.getCarte()));
        insertion.setString(3, Boolean.toString(compte.isStatut()));
        insertion.setString(4, Double.toString(compte.getDecouvert()));
        insertion.setString(5, Double.toString(compte.getSolde()));
        insertion.setString(5, Integer.toString(client.getId()));

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
        swap.setString(1, Double.toString(new_decouvert));
        swap.setString(2, Integer.toString(compte.getId()));
        swap.execute();
    }
}


