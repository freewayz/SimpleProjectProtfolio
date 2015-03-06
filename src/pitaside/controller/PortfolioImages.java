package pitaside.controller;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by root on 1/14/2015.
 */
public class PortfolioImages extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
		BlobKey p_img_key = new BlobKey(request.getParameter("project_image_key"));
		blobstoreService.serve(p_img_key,response);


	}
}
