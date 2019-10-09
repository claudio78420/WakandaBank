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
public class Conseiller {
    int id;
    String nom;
    String prenom;
    String mail;
    String password;
    Image avatar;

    public Conseiller() {
    }

    public Conseiller(int id, String nom, String prenom, String mail, String password, Image avatar) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.mail = mail;
        this.password = password;
        this.avatar = avatar;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    @Override
    public String toString() {
        return "Conseiller{" + "id=" + id + ", nom=" + nom + ", prenom=" + prenom + ", mail=" + mail + ", password=" + password + ", avatar=" + avatar + '}';
    }    
}
