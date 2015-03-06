package pitaside.model;

import javax.jdo.annotations.*;
import java.util.Date;

/**
 * Created by root on 1/14/2015.
 */

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class ProjectInfo {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long project_id;
	@Persistent
	private String project_description;
	@Persistent
	private String project_name;
	@Persistent
	private String project_type;
	@Persistent
	private String project_image_key;
	@Persistent
	private Date timestamp;
	@Persistent
	private String project_link;



	public ProjectInfo(){}

	public ProjectInfo(
			String project_name, String project_type, String project_description,
	        Date timestamp, String project_image_key, String project_link
	){
		this.project_name = project_name;
		this.project_type = project_type;
		this.project_description = project_description;
		this.timestamp = timestamp;
		this.project_image_key = project_image_key;
		this.project_link = project_link;
	}

	public Long getProject_id() {
		return project_id;
	}

	public void setProject_id(Long project_id) {
		this.project_id = project_id;
	}

	public Date getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}

	public String getProject_description() {
		return project_description;
	}

	public void setProject_description(String project_description) {
		this.project_description = project_description;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getProject_type() {
		return project_type;
	}

	public void setProject_type(String project_type) {
		this.project_type = project_type;
	}

	public String getProject_image_key() {
		return project_image_key;
	}

	public void setProject_image_key(String project_image_key) {
		this.project_image_key = project_image_key;
	}

	public String getProject_link()
	{
		return project_link;
	}

	public void setProject_link(String project_link)
	{
		this.project_link = project_link;
	}
}
