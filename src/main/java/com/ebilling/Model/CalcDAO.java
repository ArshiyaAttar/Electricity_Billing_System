package com.ebilling.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ebilling.DBConnection.DBConnect;
import com.ebilling.bean.CalcBill;
import com.ebilling.bean.CostBean;
import com.ebilling.bean.UserBean;

public class CalcDAO {

	public void calculateBill(CalcBill bill) throws SQLException {
		// TODO Auto-generated method stub
		int cost1, cost2, cost3, cost4;
		Connection connection = DBConnect.getConn();
		PreparedStatement statement = connection.prepareStatement("SELECT * FROM E_UNIT ORDER BY ID DESC");
		ResultSet resultSet = statement.executeQuery();
		if (resultSet.next())
		// while(resultSet.next())
		{
			cost1 = resultSet.getInt(2);
			cost2 = resultSet.getInt(3);
			cost3 = resultSet.getInt(4);
			cost4 = resultSet.getInt(5);
			System.out.println(cost1 + " " + cost2 + "" + cost3 + "+" + cost4);
			int due = bill.getDues();
			int unit = bill.getUnitConsumed();
			int tamt = +due;
			if (unit > 100) {
				if (unit >= 200) {
					if (unit > 300) {
						tamt = (unit * cost1) + due;
					} else
						tamt = (unit * cost2) + due;
				} else
					tamt = (unit * cost3) + due;
			} else {
				tamt = (unit * cost4) + due;
			}
			System.out.println(tamt);

			Connection con = DBConnect.getConn();
			String sql = "INSERT INTO E_CALBILL (USERID,NAME,UNIT,ZONE,MONTH,TAMT,YEAR,STATUS,DUES) VALUES (?,?,?,?,?,?,?,?,?)  ";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setInt(1, bill.getUserid());
			preparedStatement.setString(2, bill.getName());
			preparedStatement.setInt(3, bill.getUnitConsumed());
			preparedStatement.setString(4, bill.getZoneName());
			preparedStatement.setString(5, bill.getMonth());
			preparedStatement.setInt(6, tamt);
			preparedStatement.setString(7, bill.getYear());
			preparedStatement.setString(8, bill.getStatus());
			preparedStatement.setInt(9, bill.getDues());
			int result = preparedStatement.executeUpdate();
			System.out.println(result);

		}
		// return result;
	}

	public CalcBill payAmount(CalcBill bill2) throws SQLException {
		// TODO Auto-generated method stub
		Connection con = DBConnect.getConn();

		String sql = "UPDATE E_CALBILL SET AMTPAID=?,STATUS=? WHERE ID=?";
		PreparedStatement preparedStatement = con.prepareStatement(sql);
		preparedStatement.setInt(1, bill2.getPayamt());
		preparedStatement.setString(2, bill2.getStatus());
		preparedStatement.setInt(3, bill2.getCid());
		int result = preparedStatement.executeUpdate();

		if (result != 0) {
			System.out.println("valid");
		}
		return bill2;
	}

	public static CalcBill getRecordById(int id) throws SQLException {
		CalcBill bean = new CalcBill();
		Connection con = DBConnect.getConn();
		String sql = "SELECT * FROM E_CALBILL where ID=?";
		PreparedStatement preparedStatement = con.prepareStatement(sql);
		preparedStatement.setInt(1, id);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			bean.setCid(rs.getInt(1));
			bean.setUserid(rs.getInt(2));
			bean.setUnitConsumed(rs.getInt(3));

		}
		return bean;

	}

	public static CostBean updateCost(CostBean bean) throws SQLException {
		Connection con = DBConnect.getConn();
		String sql = "INSERT INTO E_UNIT (CHARGE1,CHARGE2,CHARGE3,CHARGE4) VALUES (?,?,?,?)";
		PreparedStatement preparedStatement = con.prepareStatement(sql);
		preparedStatement.setInt(1, bean.getCost1());
		preparedStatement.setInt(2, bean.getCost2());
		preparedStatement.setInt(3, bean.getCost3());
		preparedStatement.setInt(4, bean.getCost4());
		int i = preparedStatement.executeUpdate();
		if (i != 0) {
			System.out.println("done");
		}

		return bean;
		// TODO Auto-generated method stub

	}

}
