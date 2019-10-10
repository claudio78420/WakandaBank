/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.solutec.bean;

import java.awt.Image;

/**
 *
 * @author TLeMet
 */
public class Client {
    int idclient;
    String nom;
    String prenom;
    String mail;
    String password;
    Image avatar;
    int idcons;

    public Client() {
    }

    public Client(String nom, String prenom, String mail, String password) {
        this.nom = nom;
        this.prenom = prenom;
        this.mail = mail;
        this.password = password;
    }

    public int getIdclient() {
        return idclient;
    }

    public void setIdclient(int idclient) {
        this.idclient = idclient;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Image getAvatar() {
        return avatar;
    }

    public void setAvatar(Image avatar) {
        this.avatar = avatar;
    }
    
    public int getIdcons() {
        return idcons;
    }

    public void setIdcons(int idcons) {
        this.idcons = idcons;
    }

    @Override
    public String toString() {
        return "Client{" + "id=" + idclient + ", nom=" + nom + ", prenom=" + prenom + ", mail=" + mail + ", password=" + password + ", avatar=" + avatar + ", idcons=" + idcons + '}';
    }
}
