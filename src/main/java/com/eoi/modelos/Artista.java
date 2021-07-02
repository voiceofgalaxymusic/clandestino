package com.eoi.modelos;

public class Artista {

	private String idart;
	private String nomart;
	private String genero;
	private String img;

	public Artista() {
		super();
	}

	public Artista(String nomArt, String genero, String img) {
		super();
		this.nomart = nomArt;
		this.genero = genero;
		this.img = img;
	}
	
	public Artista(String idart, String nomArt, String genero, String img) {
		super();
		this.idart = idart;
		this.nomart = nomArt;
		this.genero = genero;
		this.img = img;
	}
	
	public String getidart() {
		return idart;
	}

	public void setidart(String idart) {
		this.idart = idart;
	}

	public String getNomArt() {
		return nomart;
	}

	public void setNomArt(String nomArt) {
		this.nomart = nomArt;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "Artista [ idArt =" + idart + "nomArt=" + nomart + ", genero=" + genero + "img=" + img + "]";
	}

}
