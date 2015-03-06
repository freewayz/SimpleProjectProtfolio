package pitaside.controller;

import pitaside.model.ProjectInfo;
import pitaside.persistent.DAOImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by root on 3/5/2015.
 */
public class Update extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String project_name = request.getParameter("p_name");
		List<ProjectInfo> project_to_update = DAOImpl.Datastore.getCurrentProject(project_name);
		request.getSession().setAttribute("update_project", project_to_update.get(0));
		RequestDispatcher dispatcher = request.getRequestDispatcher("/update.jsp");
		dispatcher.forward(request,response);
	}
}
