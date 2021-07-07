package com.eoi.modelos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.eoi.controladores.Conexion;

public class DiscoDAO {
	
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
	public void altaDisc(Disco d) throws SQLException {
		String sql= "INSERT INTO t_disc (disc_id, disc_nom, disc_idart, disc_img, disc_pre) VALUES (?, ?, ?, ?, ?)";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, d.getDisc_id());
		pst.setString(2, d.getDisc_nom());
		pst.setString(3, d.getDisc_idart());
		pst.setString(4, d.getDisc_img());
		pst.setString(5, d.getDisc_pre());
		
		pst.executeUpdate();
		System.out.println("Disco ("+d.getDisc_nom()+") creado");
		pst.close();
		con.close();
	}
	
	public void modificarDisc(Disco d) throws SQLException {
		String sql= "UPDATE t_disc SET disc_nom = ?, disc_idart = ?, disc_img = ?, disc_pre = ? WHERE disc_id = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);

		pst.setString(1, d.getDisc_nom());
		pst.setString(2, d.getDisc_idart());
		pst.setString(3, d.getDisc_img());
		pst.setString(4, d.getDisc_pre());
		pst.setString(5, d.getDisc_id());
		
		pst.executeUpdate();

		System.out.println("Disco ("+d.getDisc_id()+") modificado");
		pst.close();
		con.close();
	}
	
	public void borrarDisc(String disc_id) throws SQLException {
		String sql= "DELETE FROM t_disc WHERE disc_id = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		
		pst.setString(1, disc_id);
		
		pst.executeUpdate();
		System.out.println("Disco ("+disc_id+") borrado");
		pst.close();
		con.close();
	}
	
	public Disco getDisc(String disc_id) throws SQLException {
		Disco d = null;
		String sql= "SELECT * FROM t_disc WHERE disc_id = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		
		pst.setString(1, disc_id);
		rs = pst.executeQuery();
		if (rs.next()) {
			d = new Disco();
			d.setDisc_id(rs.getString("disc_id"));
			d.setDisc_nom(rs.getString("disc_nom"));
			d.setDisc_idart(rs.getString("disc_idart"));
			d.setDisc_img(rs.getString("disc_img"));
			d.setDisc_pre(rs.getString("disc_pre"));
		}
		rs.close();
		pst.close();
		con.close();
		return d;
	}
}