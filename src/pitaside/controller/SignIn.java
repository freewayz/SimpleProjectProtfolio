package pitaside.controller;

import pitaside.model.Accounts;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by root on 1/14/2015.
 */
@SuppressWarnings("serial")
public class SignIn extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("username");
		String pass = request.getParameter("password");

		Accounts accounts = new Accounts();
		accounts.setUsername(user);
		accounts.setPassword(pass);
//		getServletContext().setAttribute("accounts", accounts);
		request.getSession().setAttribute("accounts", accounts);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/p_admin.jsp");
		dispatcher.forward(request,response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
