package pitaside.controller;

import pitaside.persistent.DAOImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by root on 3/5/2015.
 */
public class DeleteProject extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String project_id = request.getParameter("id");
		String blob_key = request.getParameter("blob_key");
		Long id = Long.parseLong(project_id);
		DAOImpl.Datastore.deleteProjects(id, blob_key, response );
		response.sendRedirect("/p_admin.jsp");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request,response);
	}
}
