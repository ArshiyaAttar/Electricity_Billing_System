package com.ebilling.Ctrl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebilling.DBConnection.DBConnect;
import com.ebilling.DBConnection.Validation;
import com.ebilling.Model.CalcDAO;
import com.ebilling.bean.CalcBill;
import com.ebilling.bean.CostBean;

/**
 * Servlet implementation class CalcBillCtrl
 */
@WebServlet("/CalcBillCtrl")
public class CalcBillCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CalcBillCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("CalculateBillView.jsp").forward(request, response);
		request.getRequestDispatcher("paybill.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("Action").equals("Calculate Bill")) {
			CalcBill bill = new CalcBill();
			bill.setUserid(Integer.parseInt(request.getParameter("userid")));
			bill.setUnitConsumed(Integer.parseInt(request.getParameter("unit")));
			bill.setZoneName(request.getParameter("zonename"));
			bill.setMonth(request.getParameter("month"));
			bill.setName(request.getParameter("name"));
			bill.setYear(request.getParameter("year"));
			bill.setStatus("Not Paid");
			bill.setDues(Integer.parseInt(request.getParameter("dues")));
			CalcDAO calcDAO = new CalcDAO();
			int result;
			try {
				calcDAO.calculateBill(bill);
				/*
				 * if(result!=0) {
				 */
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("bill", bill);
				String msg = "Bill Calculated";
				request.setAttribute("msg", msg);
				request.getRequestDispatcher("CalculateBillView.jsp").forward(request, response);
				// response.sendRedirect("CalculateBillView.jsp");
				/* } */

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(request.getParameter("Action").equals("Search"))
		{
			Connection con=DBConnect.getConn();
			System.out.println("inside search");
			
			int id=Integer.parseInt(request.getParameter(("userid")));
			//String id2=request.getParameter("userid");
			
			ArrayList list=null;
			ArrayList pid=new ArrayList();
			String query="SELECT * FROM E_USER WHERE USERID='"+id+"'";
			try {
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery(query);
				while(rs.next())
				{
					list=new ArrayList();
					list.add(rs.getInt(1));
					list.add(rs.getString(2));
					list.add(rs.getString(5));
					pid.add(list);
				}
				request.setAttribute("piList", pid);
	            RequestDispatcher view = request.getRequestDispatcher("CalculateBillView.jsp");
	            view.forward(request, response);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}

		if (request.getParameter("Action").equals("Pay")) {
			CalcBill bill2 = new CalcBill();
			// CalcDAO calcDAO2=new CalcDAO();

		}
		// doGet(request, response);
		if (request.getParameter("Action").equals("Pay Bill")) {
			System.out.println("inside pay bill");
			CalcBill bill2 = new CalcBill();
			bill2.setCid(Integer.parseInt(request.getParameter("id")));
			bill2.setPayamt(Integer.parseInt(request.getParameter("bamt")));
			bill2.setStatus("PAID");

			CalcDAO calcDAO2 = new CalcDAO();
			try {
				bill2 = calcDAO2.payAmount(bill2);
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("pay", bill2);
				request.setAttribute("msg", "Bill Paid Successfully!!!");
				request.getRequestDispatcher("paybill.jsp").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		if (request.getParameter("Action").equals("Update Cost")) {
			CostBean bean = new CostBean();
			bean.setCost1(Integer.parseInt(request.getParameter("c1")));
			bean.setCost2(Integer.parseInt(request.getParameter("c2")));
			bean.setCost3(Integer.parseInt(request.getParameter("c3")));
			bean.setCost4(Integer.parseInt(request.getParameter("c4")));
			try {
				bean = CalcDAO.updateCost(bean);
				request.setAttribute("msg", "Cost Updated Successfully");
				request.getRequestDispatcher("updatecost.jsp").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
