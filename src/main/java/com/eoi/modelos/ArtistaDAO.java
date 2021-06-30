package com.eoi.modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.eoi.controladores.Conexion;

public class ArtistaDAO {

	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	public void altaArtista(Artista a) throws SQLException {

		String query = "INSERT INTO t_art (art_nom, art_gen, art_img) values (?,?,?)";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(query);
		pst.setString(1, a.getNomArt());
		pst.setString(2, a.getGenero());
		pst.setString(3, a.getImg());

		// AL TRABAJAR CON INSERT O UPDATE, TENEMOS QUE UTILIZAR ESE Y NO EXECUTEQUERY
		pst.executeUpdate();
	}

	public void modificarArtista(Artista a) throws SQLException {

		String query = "UPDATE t_art SET art_nom = ?, art_gen = ?, art_img = ? WHERE art_id = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(query);
		pst.setString(1, a.getNomArt());
		pst.setString(2, a.getGenero());
		pst.setString(3, a.getImg());
		pst.setString(4, a.getidart());

		pst.executeUpdate();
	}

	public void borrarArtista(String idart) throws SQLException {
		
		String query = "DELETE FROM t_art WHERE art_id=?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(query);
		pst.setString(1, idart);
		
		pst.executeUpdate();
		
	}

	public Artista getArtista(String idart) throws SQLException {
		Artista a = null;

		String query = "SELECT * FROM t_art WHERE art_id = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(query);
		pst.setString(1, idart);

		rs = pst.executeQuery();

		if (rs.next()) {

			a = new Artista();
			a.setidart(rs.getString("ID"));
			a.setNomArt(rs.getString("Nombre"));
			a.setGenero(rs.getString("Genero"));
			a.setImg(rs.getString("Imagen"));

		}

		return a;

	}

}
