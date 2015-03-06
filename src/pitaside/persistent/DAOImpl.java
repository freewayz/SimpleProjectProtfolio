package pitaside.persistent;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import pitaside.model.ProjectInfo;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.jdo.Transaction;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by root on 3/3/2015.
 */
public enum DAOImpl implements DAO
{
	Datastore;

	@Override
	public List<ProjectInfo> getAllProjects()
	{
		PersistenceManager $persistent_manager = PMF.getPMF().getPersistenceManager();
		String $get_all_project = "select from " + ProjectInfo.class.getName();
		Query query = $persistent_manager.newQuery($get_all_project);
		List<ProjectInfo> result = (List<ProjectInfo>) query.execute();
		return result;
	}

	@Override
	public List<ProjectInfo> getProject(String $project_type)
	{
		PersistenceManager $persistent_manager = PMF.getPMF().getPersistenceManager();
		String $get_project = "select from " + ProjectInfo.class.getName() +
				" where project_type == '" + $project_type +"'";
		Query query = $persistent_manager.newQuery($get_project);
		List<ProjectInfo> results = (List<ProjectInfo>) query.execute();
		return results;
	}

	@Override
	public void addProject(String $project_name, String $project_type,
	                       String $project_description, Date $timestamp,
	                       String $project_image_key, String $project_github_link) throws Exception
	{
		ProjectInfo projectInfo =
				new ProjectInfo($project_name,
						$project_type,
						$project_description,
						$timestamp,$project_image_key,
						$project_github_link);

		PersistenceManager $persistent_manager = PMF.getPMF().getPersistenceManager();
		Transaction transaction = $persistent_manager.currentTransaction();
		try{
			transaction.begin();
			$persistent_manager.makePersistent(projectInfo);
			transaction.commit();
		}finally {
			$persistent_manager.close();

		}


	}

	@Override
	public void deleteProjects(Long $projectId, String $blob_serv_key, HttpServletResponse http_response)
	{
		PersistenceManager persistenceManager = PMF.getPMF().getPersistenceManager();
		Transaction transaction = persistenceManager.currentTransaction();

		BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
		BlobKey image_key = new BlobKey($blob_serv_key);

		try{
			transaction.begin();
			ProjectInfo projectInfoToDelete = persistenceManager.getObjectById(ProjectInfo.class,$projectId);
			persistenceManager.deletePersistent(projectInfoToDelete);
			blobstoreService.delete(image_key);
			transaction.commit();
		}catch (Exception http_err){
			if(transaction.isActive()){
				transaction.rollback();
			}else {
				persistenceManager.close();
			}
			try {
				persistenceManager.close();
				http_response.getOutputStream().println(
						"<html>" +
								"<head><title>ERROR</title></head>" +
								"<body><p><i>" + http_err.getMessage() + "</i></p></body>" +
						"</html>"
				);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}finally {
			persistenceManager.close();

		}
	}

	@Override
	public void updateProject(Long id, String $project_name, String $currentDesc,
	                          String $git, Date $timestamp, String $new_image)
	{

		PersistenceManager persistenceManager = PMF.getPMF().getPersistenceManager();
		Transaction transaction = persistenceManager.currentTransaction();
		try{
			transaction.begin();
			ProjectInfo updateProject = persistenceManager.getObjectById(ProjectInfo.class, id);
			updateProject.setProject_name($project_name);
			updateProject.setProject_description($currentDesc);
			updateProject.setProject_link($git);
			updateProject.setTimestamp($timestamp);
			updateProject.setProject_image_key($new_image);
			transaction.commit();
		}catch (Exception http_err){
			if(transaction.isActive()){
				transaction.rollback();
			}else {
				persistenceManager.close();
			}
		}
		finally {
			persistenceManager.close();
		}
	}

	@Override
	public List<ProjectInfo> getCurrentProject(String projectName)
	{
		PersistenceManager persistenceManager = PMF.getPMF().getPersistenceManager();
		String $get_project = "select from " + ProjectInfo.class.getName() +
				" where project_name == '" + projectName +"'";
		Query query = persistenceManager.newQuery($get_project);

		List<ProjectInfo> results = (List<ProjectInfo>) query.execute();

		return results;
	}
}
