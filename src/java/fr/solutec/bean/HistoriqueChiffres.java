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
public class HistoriqueChiffres {
    int id;
    Date timestamp;
    Double ancien;
    Double nouveau;
    int idmodif;
    int idcompte;

    public HistoriqueChiffres() {
    }

    public HistoriqueChiffres(Date timestamp, Double ancien, Double nouveau, int idmodif) {
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

    public Double getAncien() {
        return ancien;
    }

    public void setAncien(Double ancien) {
        this.ancien = ancien;
    }

    public Double getNouveau() {
        return nouveau;
    }

    public void setNouveau(Double nouveau) {
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
        return "HistoriqueChiffres{" + "id=" + id + ", timestamp=" + timestamp + ", ancien=" + ancien + ", nouveau=" + nouveau + ", idmodif=" + idmodif + ", idcompte=" + idcompte + '}';
    }
    
    
    
    
}
