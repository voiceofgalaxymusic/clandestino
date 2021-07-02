package com.eoi.modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.eoi.controladores.Conexion;

public class UsuarioDAO {
	private Connection con;
	private PreparedStatement pst;
	private ResultSet rs;

	public Usuario login(String nik, String pass) throws SQLException {
		Usuario u=null;
		u = new Usuario();
		con =  Conexion.getInstance().getConnection();
		String query = "SELECT * FROM t_user WHERE user_nik=? and user_pass=?";
		
		pst = con.prepareStatement(query);
		pst.setString(1, nik);
		pst.setString(2, pass);
		rs = pst.executeQuery();
		
		if (rs.next()) {
				
				u.setNik(rs.getString("user_nik"));
				u.setPass(rs.getString("user_pass"));
				u.setNom(rs.getString("user_nom"));
				u.setRol(rs.getString("user_rol"));
				u.setCiu(rs.getString("user_ciu"));
				u.setPai(rs.getString("user_pai"));
				u.setImg(rs.getString("user_img"));	
			
			}
		
		rs.close();
		pst.close();
		con.close();
		
	return u;
	}

	public void altaUser(Usuario u) throws SQLException {
		String sql = "insert into t_user(user_rol , user_nik , user_pass,  user_nom , user_pai , user_ciu , user_img  ) values (?,?,?,?,?,?,?)";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, u.getRol());
		pst.setString(2, u.getNik());
		pst.setString(3, u.getPass());
		pst.setString(4, u.getNom());
		pst.setString(5, u.getPai());
		pst.setString(6, u.getCiu());
		pst.setString(7, u.getImg());
	
		pst.executeUpdate();
	}

	public void modificarUser(Usuario u) throws SQLException {
		String sql = "update t_user set user_rol=?, user_nik=?, user_pass=?, user_nom=? , user_pai=? , user_ciu=? , user_img=? where user_id=?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, u.getRol());
		pst.setString(2, u.getNik());
		pst.setString(3, u.getPass());
		pst.setString(4, u.getNom());
		pst.setString(5, u.getPai());
		pst.setString(6, u.getCiu());
		pst.setString(7, u.getImg());
		pst.setString(8, u.getId());

		pst.executeUpdate();
	}

	public void borrarUser(String userId) throws SQLException {
		String sql = "delete from t_user where user_id=?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, userId);

		pst.executeUpdate();
	}

	public Usuario getUser(String userId) throws SQLException {
		Usuario u = null;
		String sql = "select * from departamento where user_id = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, userId);
		rs = pst.executeQuery();
		if (rs.next()) {
			u = new Usuario();
			u.setRol(rs.getString("user_rol"));
			u.setNik(rs.getString("user_nik"));
			u.setNom(rs.getString("user_nom"));
			u.setPass(rs.getString("user_pass"));
			u.setPai(rs.getString("user_pai"));
			u.setCiu(rs.getString("user_ciu"));
			u.setImg(rs.getString("user_img"));
		}
		return u;
	}
}
