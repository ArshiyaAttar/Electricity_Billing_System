package com.ebilling.Model;

import java.sql.*;

import com.ebilling.DBConnection.DBConnect;
import com.ebilling.bean.UserBean;

public class RegDAO {

	/* Add User By Admin */
	public int addUser(UserBean bean) throws SQLException {
		Connection con = null;
		con = DBConnect.getConn();
		String sql = "INSERT INTO E_USER (USERNAME,USEREMAIL,USERPHONE,USERADDRESS,PASSWORD,ROLEID) VALUES"
				+ "(?,?,?,?,?,?)";
		PreparedStatement preparedStatement = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		preparedStatement.setString(1, bean.getUsername());
		preparedStatement.setString(2, bean.getUseremail());
		preparedStatement.setString(3, bean.getUserphone());
		preparedStatement.setString(4, bean.getUseraddress());
		preparedStatement.setString(5, bean.getPassword());
		preparedStatement.setInt(6, bean.getRoleid());
		int i = preparedStatement.executeUpdate();
		if (i == 0) {
			System.out.println("not inserted");
		} else {
			System.out.println("inserted");
		}
		int id = 0;

		ResultSet rs = preparedStatement.getGeneratedKeys();
		if (rs.next()) {
			id = rs.getInt(1);
		}
		System.out.println("Last inserted id" + id);

		return id;

	}

	public static UserBean getRecordById(int id) throws SQLException {
		UserBean bean = new UserBean();
		Connection con = DBConnect.getConn();
		String sql = "SELECT * FROM E_USER where USERID=?";
		PreparedStatement preparedStatement = con.prepareStatement(sql);
		preparedStatement.setInt(1, id);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			bean.setUserid(rs.getInt(1));
			bean.setUsername(rs.getString(2));
			bean.setUseremail(rs.getString(3));
			bean.setUserphone(rs.getString(4));
			bean.setUseraddress(rs.getString(5));
			bean.setPassword(rs.getString(6));
		}
		return bean;

	}

	public int editUser(UserBean userBean) throws SQLException {
		// TODO Auto-generated method stub
		Connection con = DBConnect.getConn();
		int status = 0;
		String sql = "UPDATE E_USER SET USEREMAIL=?,USERADDRESS=?,USERPHONE=? WHERE USERID=?";
		PreparedStatement preparedStatement = con.prepareStatement(sql);
		preparedStatement.setString(1, userBean.getUseremail());
		preparedStatement.setString(2, userBean.getUseraddress());
		preparedStatement.setString(3, userBean.getUserphone());
		preparedStatement.setInt(4, userBean.getUserid());
		status = preparedStatement.executeUpdate();
		System.out.println(status);
		if (status != 0) {
			System.out.println(status);
			return 1;
		} else {
			return 0;
		}

	}

	public int editMyProfile(UserBean userBean) throws SQLException {
		// TODO Auto-generated method stub
		Connection con = DBConnect.getConn();
		int status = 0;
		String sql = "UPDATE E_USER SET USERNAME=?,USEREMAIL=?,USERADDRESS=?,USERPHONE=?,PASSWORD=? WHERE USERID=?";
		PreparedStatement preparedStatement = con.prepareStatement(sql);
		preparedStatement.setString(1, userBean.getUsername());
		preparedStatement.setString(2, userBean.getUseremail());
		preparedStatement.setString(3, userBean.getUseraddress());
		preparedStatement.setString(4, userBean.getUserphone());
		preparedStatement.setString(5, userBean.getPassword());
		preparedStatement.setInt(6, userBean.getUserid());
		status = preparedStatement.executeUpdate();
		System.out.println(status);
		if (status != 0) {
			System.out.println(status);
			return 1;
		} else {
			return 0;
		}

	}

}
