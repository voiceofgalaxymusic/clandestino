package com.eoi.modelos;

public class Disco {

	String disc_id;
	String disc_nom;
	String disc_idart;
	String disc_img;
	String disc_pre;

	public Disco() {

	}
	
	public Disco(String disc_nom, String disc_idart, String disc_img, String disc_pre) {
		super();
		this.disc_nom = disc_nom;
		this.disc_idart = disc_idart;
		this.disc_img = disc_img;
		this.disc_pre = disc_pre;
	}

	public Disco(String disc_id, String disc_nom, String disc_idart, String disc_img, String disc_pre) {
		super();
		this.disc_id = disc_id;
		this.disc_nom = disc_nom;
		this.disc_idart = disc_idart;
		this.disc_img = disc_img;
		this.disc_pre = disc_pre;
	}

	public String getDisc_id() {
		return disc_id;
	}

	public void setDisc_id(String disc_id) {
		this.disc_id = disc_id;
	}

	public String getDisc_nom() {
		return disc_nom;
	}

	public void setDisc_nom(String disc_nom) {
		this.disc_nom = disc_nom;
	}

	public String getDisc_idart() {
		return disc_idart;
	}

	public void setDisc_idart(String disc_idart) {
		this.disc_idart = disc_idart;
	}

	public String getDisc_img() {
		return disc_img;
	}

	public void setDisc_img(String disc_img) {
		this.disc_img = disc_img;
	}

	public String getDisc_pre() {
		return disc_pre;
	}

	public void setDisc_pre(String disc_pre) {
		this.disc_pre = disc_pre;
	}

	@Override
	public String toString() {
		return "Disco [disc_id=" + disc_id + ", disc_nom=" + disc_nom + ", disc_idart=" + disc_idart + ", disc_img="
				+ disc_img + ", disc_pre=" + disc_pre + "]";
	}

}