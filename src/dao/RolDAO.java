package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Rol;

/**
 * Session Bean implementation class RolDAO
 */
@Stateless
@LocalBean
public class RolDAO extends DAO<Rol, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public RolDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Rol> getEntityClass() 
	{
		return Rol.class;
	}

}
