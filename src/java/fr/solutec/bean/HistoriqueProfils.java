/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.solutec.bean;

import java.sql.Date;

/**
 *
 * @author stagiaire
 */
public class HistoriqueProfils {
    int id;
    Date timestamp;
    String ancien;
    String nouveau;
    int idmodif;
    int idcompte;

    public HistoriqueProfils() {
    }

    public HistoriqueProfils(Date timestamp, String ancien, String nouveau, int idmodif) {
        this.timestamp = timestamp;
        this.ancien = ancien;
        this.nouveau = nouveau;
        this.idmodif = idmodif;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public String getAncien() {
        return ancien;
    }

    public void setAncien(String ancien) {
        this.ancien = ancien;
    }

    public String getNouveau() {
        return nouveau;
    }

    public void setNouveau(String nouveau) {
        this.nouveau = nouveau;
    }

    public int getIdmodif() {
        return idmodif;
    }

    public void setIdmodif(int idmodif) {
        this.idmodif = idmodif;
    }

    public int getIdcompte() {
        return idcompte;
    }

    public void setIdcompte(int idcompte) {
        this.idcompte = idcompte;
    }

    @Override
    public String toString() {
        return "HistoriqueProfils{" + "id=" + id + ", timestamp=" + timestamp + ", ancien=" + ancien + ", nouveau=" + nouveau + ", idmodif=" + idmodif + ", idcompte=" + idcompte + '}';
    }
    
    
    
    
}
