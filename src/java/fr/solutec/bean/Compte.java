/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.solutec.bean;

/**
 *
 * @author stagiaire
 */
public class Compte {
    Long id;
    Long carte;
    boolean statut;
    Double solde;
    Double decouvert;
    int id_client;

    public Compte() {
    }

    public Compte(Long id, Long carte, boolean statut, Double solde, Double decouvert, int id_client) {
        this.id = id;
        this.carte = carte;
        this.statut = statut;
        this.solde = solde;
        this.decouvert = decouvert;
        this.id_client = id_client;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCarte() {
        return carte;
    }

    public void setCarte(Long carte) {
        this.carte = carte;
    }

    public boolean isStatut() {
        return statut;
    }

    public void setStatut(boolean statut) {
        this.statut = statut;
    }

    public Double getSolde() {
        return solde;
    }

    public void setSolde(Double solde) {
        this.solde = solde;
    }

    public Double getDecouvert() {
        return decouvert;
    }

    public void setDecouvert(Double decouvert) {
        this.decouvert = decouvert;
    }

    public int getId_client() {
        return id_client;
    }

    public void setId_client(int id_client) {
        this.id_client = id_client;
    }
//
    @Override
    public String toString() {
        return "Compte{" + "id=" + id + ", carte=" + carte + ", statut=" + statut + ", solde=" + solde + ", decouvert=" + decouvert + ", id_client=" + id_client + '}';
    }
}
