package com.eoi.modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.eoi.controladores.Conexion;

public class CompraDAO {
	private Connection con;
	private PreparedStatement pst;
	private ResultSet rs;

	public Compra getDepartamento(String compId) throws SQLException {
		Compra c = null;
		String sql = "select * from departamento where codDepto = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, compId);
		rs = pst.executeQuery();
		if (rs.next()) {
			c = new Compra();
			c.setIdclien(rs.getString("comp_idclien  "));
			c.setIddisc(rs.getString("comp_iddisc  "));
			c.setCant(rs.getString("comp_cant "));
		}
		return c;
	}
}
