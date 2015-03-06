package pitaside.controller;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import pitaside.persistent.DAOImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

/**
 * Created by root on 1/14/2015.
 */
public class UploadPortfolio extends HttpServlet {

	private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try{
			Map<String, BlobKey> blobKeyMap = blobstoreService.getUploadedBlobs(request);
			BlobKey project_image_key = blobKeyMap.get("p_img_key");
			String p_name = request.getParameter("p_name");
			String p_desc = request.getParameter("p_desc");
			String p_type = request.getParameter("p_type");
			String p_link  = request.getParameter("p_link");
			Date timestamp = new Date();
			DAOImpl.Datastore.addProject(p_name,p_type,p_desc,timestamp,project_image_key.getKeyString(),p_link);
			response.getOutputStream().print("");
			response.sendRedirect("/p_admin.jsp");
		}catch (Exception HTTP_ERR){
			response.getOutputStream().print(
					"<p><i>" + HTTP_ERR.getMessage() + "</i></p>"
			);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
}
