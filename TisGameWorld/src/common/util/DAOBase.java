package common.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DAOBase {

	protected DataSource ds;
	
	protected Connection con;
	protected PreparedStatement ps;
	protected ResultSet rs;

	public DAOBase() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TISGAMEWORLD");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null)	 rs.close();
			if (ps != null)	 ps.close();
			if (con != null) con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
