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
    int id;
    int carte;
    boolean statut;
    float solde;
    float decouvert;
    int id_client;

    public Compte() {
    }

    public Compte(int id, int carte, boolean statut, float solde, float decouvert, int id_client) {
        this.id = id;
        this.carte = carte;
        this.statut = statut;
        this.solde = solde;
        this.decouvert = decouvert;
        this.id_client = id_client;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCarte() {
        return carte;
    }

    public void setCarte(int carte) {
        this.carte = carte;
    }

    public boolean isStatut() {
        return statut;
    }

    public void setStatut(boolean statut) {
        this.statut = statut;
    }

    public float getSolde() {
        return solde;
    }

    public void setSolde(float solde) {
        this.solde = solde;
    }

    public float getDecouvert() {
        return decouvert;
    }

    public void setDecouvert(float decouvert) {
        this.decouvert = decouvert;
    }

    public int getId_client() {
        return id_client;
    }

    public void setId_client(int id_client) {
        this.id_client = id_client;
    }

    @Override
    public String toString() {
        return "Compte{" + "id=" + id + ", carte=" + carte + ", statut=" + statut + ", solde=" + solde + ", decouvert=" + decouvert + ", id_client=" + id_client + '}';
    }
}
