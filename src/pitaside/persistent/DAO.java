package pitaside.persistent;

import pitaside.model.ProjectInfo;

import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * Created by root on 3/3/2015.
 */
public interface DAO
{

	/**
	 * @return
	 */
	public List<ProjectInfo> getAllProjects();

	/**
	 * @param $project_type
	 * @return
	 */
	public List<ProjectInfo> getProject(String $project_type);

	/**
	 * @param $project_name
	 * @param $project_type
	 * @param $project_description
	 * @param $timestamp
	 * @param $project_image_key
	 * @param $project_github_link
	 * @throws Exception
	 */
	public void addProject(
			String $project_name,
			String $project_type,
			String $project_description,
			Date $timestamp,
			String $project_image_key,
			String $project_github_link) throws Exception;

	/**
	 *
	 * @param $projectId
	 * @param $blob_serv_key
	 * @param http_response
	 */
	public void deleteProjects(Long $projectId, String $blob_serv_key, HttpServletResponse http_response);

	/**
	 *@param id
	 * @param $project_name
	 * @param $currentDesc
	 * @param $git
	 * @param $timestamp
	 * @param $new_image
	 */
	public void updateProject(Long id, String $project_name, String $currentDesc, String $git, Date $timestamp, String $new_image);

	/**
	 *
	 * @param projectName
	 * @return
	 */
	public List<ProjectInfo> getCurrentProject(String projectName);
}
