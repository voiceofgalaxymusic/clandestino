package com.eoi.modelos;

public class Usuario {
	private String id;
	private String rol;
	private String nik;
	private String nom;
	private String pass;
	private String pai;
	private String ciu;
	private String img;
	
	public Usuario() {
		super();
	}
	public Usuario(String rol, String nik, String nom, String pass, String pai, String ciu, String img) {
		super();
		this.rol = rol;
		this.nik = nik;
		this.nom = nom;
		this.pass = pass;
		this.pai = pai;
		this.ciu = ciu;
		this.img = img;
	}
	public Usuario(String id, String rol, String nik, String nom, String pass, String pai, String ciu, String img) {
		super();
		this.id = id;
		this.rol = rol;
		this.nik = nik;
		this.nom = nom;
		this.pass = pass;
		this.pai = pai;
		this.ciu = ciu;
		this.img = img;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRol() {
		return rol;
	}
	public void setRol(String rol) {
		this.rol = rol;
	}
	public String getNik() {
		return nik;
	}
	public void setNik(String nik) {
		this.nik = nik;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getPai() {
		return pai;
	}
	public void setPai(String pai) {
		this.pai = pai;
	}
	public String getCiu() {
		return ciu;
	}
	public void setCiu(String ciu) {
		this.ciu = ciu;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "Usuario [id=" + id + ", rol=" + rol + ", nik=" + nik + ", pass=" + pass + ", nom=" + nom + ", pai="
				+ pai + ", ciu=" + ciu + ", img=" + img + "]";
	}
	
	
}
