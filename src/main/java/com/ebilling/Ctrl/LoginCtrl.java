package com.ebilling.Ctrl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebilling.Model.LoginDAO;
import com.ebilling.bean.UserBean;

/**
 * Servlet implementation class LoginCtrl
 */
@WebServlet("/LoginCtrl")
public class LoginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginCtrl() {
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

		request.getRequestDispatcher("login.jsp").forward(request, response);
		request.getRequestDispatcher("userhome.jsp").forward(request, response);
		request.getRequestDispatcher("adminhome.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		System.out.println("inside post");
		String username = request.getParameter("username");

		String pass = request.getParameter("pass");
		UserBean bean = new UserBean();
		bean.setUsername(username);
		bean.setPassword(pass);
		System.out.println("before creating object of dao");
		LoginDAO dao = new LoginDAO();
		try {
			String result = dao.authenticateUser(bean);
			System.out.println("result " + result);
			if (result.equals("ADMIN_ROLE")) {
				System.out.println("inside admin");
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("admin", username);
				request.setAttribute("username", username);
				System.out.println(username);
				response.sendRedirect("adminhome.jsp");
			}
			if (result.equals("USER_ROLE")) {
				System.out.println("inside auser");
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("user", username);
				request.setAttribute("username", username);
				System.out.println(username);
				response.sendRedirect("userhome.jsp");
			}
			if (result.equals("INVALID")) {
				System.out.println("invalid");
				String msg = "Please enter valid Username or password";
				request.setAttribute("msg", msg);
				request.getRequestDispatcher("login.jsp").forward(request, response);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// doGet(request, response);
	}

}
