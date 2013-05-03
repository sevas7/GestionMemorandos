package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Version;

/**
 * Session Bean implementation class VersionDAO
 */
@Stateless
@LocalBean
public class VersionDAO extends DAO<Version, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public VersionDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Version> getEntityClass() 
	{
		return Version.class;
	}

}
