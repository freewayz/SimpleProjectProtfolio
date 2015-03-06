package pitaside.model;

import java.io.Serializable;

/**
 * Created by root on 1/14/2015.
 */
public class Accounts implements Serializable
{
	private  static final Long versionID = 1233444L;
	private String username;
	private String password;

	public  Accounts(){

	}
	public void setUsername(String username) {
		this.username = username;
	}

	public String getUsername() {
		return username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return password;
	}
}
