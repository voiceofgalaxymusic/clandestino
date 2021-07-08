package com.eoi.modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.*;
import com.eoi.controladores.Conexion;

public class CompraDAO {
	private Connection con;
	private PreparedStatement pst;
	private ResultSet rs;

	public Compra getCompra(String compId) throws SQLException {
		Compra c = null;
		String sql = "select * from t_compra  where comp_id  = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, compId);
		rs = pst.executeQuery();
		if (rs.next()) {
			c = new Compra();
			c.setIdclien(rs.getString("comp_idclien"));
			c.setIddisc(rs.getString("comp_iddisc"));
			c.setCant(rs.getString("comp_cant"));
		}
		return c;
		
	}
	
	public void borrarCompra(String compId) throws SQLException {
		String sql= "DELETE FROM t_compra WHERE comp_id=?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, compId);
		pst.executeUpdate();
		pst.close();
		con.close();
		System.out.println("Compra ("+compId+") borrado");
	}
	
	public void altaCompra(String iduser, HttpServletRequest request, HttpServletResponse response) throws SQLException {
		con = Conexion.getInstance().getConnection();
		List<String> discosList = null;
		List<String> discosCant = null;
		String idDisc = null;
		String discCant = null;
		HttpSession sesion = request.getSession();
		
		System.out.println("id user: "+iduser);

		discosList =(List<String>) sesion.getAttribute("discosList");
		discosCant = (List<String>) sesion.getAttribute("discosCant");
		for (int i=0;i<discosList.size();i++){
			idDisc = discosList.get(i);
			discCant = discosCant.get(i);
			System.out.println("id disco: "+idDisc+" cantidad: "+discCant);
			
			String sqlComp = "insert into t_compra (comp_idclien, comp_iddisc, comp_cant) values (?, ?, ?)";
			PreparedStatement pstc = con.prepareStatement(sqlComp);
			pstc.setString(1, iduser);
			pstc.setString(2, idDisc);
			pstc.setString(3, discCant);
			pstc.executeUpdate();

			pstc.close();
		}
		sesion.setAttribute("discosList", null);
		sesion.setAttribute("discosCant", null);
		con.close();
	}
}



















