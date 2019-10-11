/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.solutec.dao;

import fr.solutec.bean.Client;
import fr.solutec.bean.Conseiller;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.ThreadLocalRandom;

/**
 *
 * @author esic
 */
public class MessagerieDao {
    
    
    
    public static String getMessageCons(int co, boolean dir) throws SQLException {
        
        String msg = "";   

        String sql = "SELECT message FROM Communication WHERE idcons=? AND cli2co =?";
        
        Connection connexion = AccessBD.getConnection();
        PreparedStatement requette = connexion.prepareStatement(sql);
        
        requette.setInt(1, co);
        requette.setBoolean(2, dir);
        ResultSet rs = requette.executeQuery();
        while (rs.next()) {
            msg = msg + rs.getString("message") + "\n";
        }
        return msg;
    }
    
        public static void insertMsg(int co, int c, String msg, boolean dir) throws SQLException {
 

        String sql = "INSERT INTO Communication (idcons, idclient, cli2co, message) VALUES (?, ?, ?, ?)";
        
        Connection connexion = AccessBD.getConnection();
        
        PreparedStatement insertion = connexion.prepareStatement(sql);
        insertion.setInt(1, co);
        insertion.setInt(2, c);
        insertion.setBoolean(3, dir);
        insertion.setString(4, msg);
        insertion.execute();
    }
 
}
