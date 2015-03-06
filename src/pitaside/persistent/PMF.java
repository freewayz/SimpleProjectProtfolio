package pitaside.persistent;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManagerFactory;

/**
 * Created by root on 1/14/2015.
 */
public class PMF {

	private static final PersistenceManagerFactory
	PERSISTENCE_MANAGER_FACTORY = JDOHelper.getPersistenceManagerFactory("transactions-optional");


	public PMF(){

	}
	public static PersistenceManagerFactory getPMF(){
		return PERSISTENCE_MANAGER_FACTORY;
	}
}
