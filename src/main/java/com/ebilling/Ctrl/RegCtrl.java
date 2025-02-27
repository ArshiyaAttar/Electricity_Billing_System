package com.ebilling.Ctrl;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebilling.Model.RegDAO;
import com.ebilling.bean.UserBean;
import com.ebilling.DBConnection.*;
/**
 * Servlet implementation class RegCtrl
 */
@WebServlet("/RegCtrl")
public class RegCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegCtrl() {
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
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());

		request.getRequestDispatcher("adduser.jsp").forward(request, response);
		request.getRequestDispatcher("viewusers.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("Action").equals("Add User"))
		{
		String username = request.getParameter("username");
		String emailid = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String password = request.getParameter("pass");

		UserBean bean = new UserBean();
		bean.setUsername(username);
		bean.setUseremail(emailid);
		bean.setUserphone(phone);
		bean.setUseraddress(address);
		bean.setPassword(password);
		bean.setRoleid(2);
		
		if(!Validation.isValid(phone))
		{
			System.out.println("please enter number");
			String no="Please enter a valid number";
			request.setAttribute("no", no);
			request.getRequestDispatcher("adduser.jsp").forward(request, response);
		}
		else if(!Validation.isValidUsername(username))
		{
			System.out.println("please enter String only");
			String umsg="Please enter Characters only";
			request.setAttribute("umsg", umsg);
			request.getRequestDispatcher("adduser.jsp").forward(request, response);
		}
		else
		{
		
		RegDAO dao = new RegDAO();
		try {
			int id = dao.addUser(bean);
			// int id=dao.getLastId();
			System.out.println("called " + id);
			// System.out.println(id);
			System.out.println(bean);
			if (id == 0) {

			}
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("id", id);
			String regmsg = "Your User ID is " + id;
			// request.setAttribute("id", id);
			request.setAttribute("regmsg", regmsg);
			request.getRequestDispatcher("adduser.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("ERROR", "User already exist");
			request.getRequestDispatcher("adduser.jsp").forward(request, response);
		}
		}
		}
		if (request.getParameter("Action").equals("Edit")) {
			System.out.println("inside edit section");
			UserBean userBean = new UserBean();
			userBean.setUserid(Integer.parseInt(request.getParameter("id")));
			userBean.setUseremail(request.getParameter("email"));
			userBean.setUseraddress(request.getParameter("address"));
			userBean.setUserphone(request.getParameter("phone"));
			RegDAO dao2 = new RegDAO();
			try {
				int result = dao2.editUser(userBean);
				System.out.println("result is " + result);
				String msg = "User edited successfully!!";
				request.setAttribute("msg", msg);
				request.getRequestDispatcher("edituser.jsp").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if (request.getParameter("Action").equals("Edit Profile")) {
			System.out.println("inside edit section");
			UserBean userBean = new UserBean();
			userBean.setUserid(Integer.parseInt(request.getParameter("id")));
			userBean.setUsername(request.getParameter("uname"));
			userBean.setUseremail(request.getParameter("email"));
			userBean.setUseraddress(request.getParameter("address"));
			userBean.setUserphone(request.getParameter("phone"));
			userBean.setPassword(request.getParameter("password"));
			RegDAO dao2 = new RegDAO();
			try {
				int result = dao2.editMyProfile(userBean);
				System.out.println("result is " + result);
				String msg = "Profile edited successfully!!";
				request.setAttribute("msg", msg);
				request.getRequestDispatcher("editprofileView.jsp").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
	
}
