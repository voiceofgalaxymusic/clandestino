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

	public Usuario login(String nik, String pass) {
		System.out.println("DATOS AL PASAR MÉTODO LOGIN: " + nik + " " + pass);
		Usuario u = null;
		

		try {
			
			String query = "SELECT * FROM t_user WHERE user_nik = ? and user_pass = ?";
			con = Conexion.getInstance().getConnection();
			pst = con.prepareStatement(query);
			pst.setString(1, nik);
			pst.setString(2, pass);
			rs = pst.executeQuery();
			
			if (rs.next()) {
				u = new Usuario();
				u.setId(rs.getString("user_id"));
				u.setRol(rs.getString("user_rol"));
				u.setNik(rs.getString("user_nik"));
				u.setPass(rs.getString("user_pass"));
				u.setNom(rs.getString("user_nom"));
				u.setPai(rs.getString("user_pai"));
				u.setCiu(rs.getString("user_ciu"));
				u.setImg(rs.getString("user_img"));
			}
			
			/*rs.close(); pst.close(); con.close();*/
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}

	public void altaUser(Usuario u) throws SQLException {
		
		System.out.println("DATOS QUE RECIBE EL MÉTODO altaUser" + u);
		
		String sql = "insert into t_user (user_id, user_rol, user_nik, user_pass, user_nom, user_pai, user_ciu, user_img) values (?,?,?,?,?,?,?,?)";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, u.getId());
		pst.setString(2, u.getRol());
		pst.setString(3, u.getNik());
		pst.setString(4, u.getPass());
		pst.setString(5, u.getNom());
		pst.setString(6, u.getPai());
		pst.setString(7, u.getCiu());
		pst.setString(8, u.getImg());

		pst.executeUpdate();
		
		System.out.println("USUARIO INCLUIDO EN BBDD: " + u);
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
		System.out.println("El usuario (ID "+userId+") se ha borrado");
	}

	public Usuario getUser(String userId) throws SQLException {
		Usuario u = null;
		String sql = "select * from t_user where user_id = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, userId);
		rs = pst.executeQuery();
		if (rs.next()) {
			u = new Usuario();
			u.setId(userId);
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
