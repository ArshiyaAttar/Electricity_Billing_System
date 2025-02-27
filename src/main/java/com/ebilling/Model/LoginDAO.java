package com.ebilling.Model;

import java.sql.*;

import com.ebilling.DBConnection.DBConnect;
import com.ebilling.bean.UserBean;

public class LoginDAO {

	public String authenticateUser(UserBean bean) throws SQLException {
		String username=bean.getUsername();
		String pass=bean.getPassword();
		System.out.println(username+pass);
		Connection  con=null;
		Statement statement=null;
		ResultSet resultSet=null;
		String usernamedb="";
		String passdb="";
		int roledb;
		 con=DBConnect.getConn();
		 statement=con.createStatement();
		 resultSet=statement.executeQuery("SELECT *FROM E_USER WHERE USERNAME='"+username+"' AND PASSWORD='"+pass+"'");
		while(resultSet.next())
		{
			usernamedb=resultSet.getString("username");
			passdb=resultSet.getString("password");
			roledb=resultSet.getInt("roleid");
			
			System.out.println(usernamedb+passdb+roledb);
			if(username.equals(usernamedb) && pass.equals(passdb) && roledb==1)
				return "ADMIN_ROLE";
				
			else if (username.equals(usernamedb) && pass.equals(passdb) && roledb==2) 
				return "USER_ROLE";
			
				
		}
			
		
		
		
		return "INVALID";

}
	
}
