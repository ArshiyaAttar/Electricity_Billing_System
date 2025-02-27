package com.ebilling.DBConnection;

import java.sql.*;

public class DBConnect {

	public static Connection getConn() {
		Connection con = null;
		String loadDriver = "com.mysql.cj.jdbc.Driver"; // driver name for mysql
		String dbURL = "jdbc:mysql://localhost:3306/ebill"; // url of the
															// database
		String dbUSERNAME = "****"; // username to coonect db
		String dbPASSWORD = "****"; // password to connect db

		try {
			Class.forName(loadDriver); // load the driver
			con = DriverManager.getConnection(dbURL, dbUSERNAME, dbPASSWORD);// get
																				// the
																				// connection
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return con; // return the connection obj.

	}
}
