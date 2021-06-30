package com.eoi.modelos;

public class Compra {
	private String id;
	private String idclien;
	private String iddisc;
	private String cant;
	public Compra() {
		super();
	}
	public Compra(String id, String idclien, String iddisc, String cant) {
		super();
		this.id = id;
		this.idclien = idclien;
		this.iddisc = iddisc;
		this.cant = cant;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIdclien() {
		return idclien;
	}
	public void setIdclien(String idclien) {
		this.idclien = idclien;
	}
	public String getIddisc() {
		return iddisc;
	}
	public void setIddisc(String iddisc) {
		this.iddisc = iddisc;
	}
	public String getCant() {
		return cant;
	}
	public void setCant(String cant) {
		this.cant = cant;
	}
	@Override
	public String toString() {
		return "Compra [id=" + id + ", idclien=" + idclien + ", iddisc=" + iddisc + ", cant=" + cant + "]";
	}
	
}
