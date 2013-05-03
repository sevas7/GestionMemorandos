package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Ciudad;

/**
 * Session Bean implementation class CiudadDAO
 */
@Stateless
@LocalBean
public class CiudadDAO extends DAO<Ciudad, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public CiudadDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Ciudad> getEntityClass() {
		// TODO Auto-generated method stub
		return Ciudad.class;
	}

}
