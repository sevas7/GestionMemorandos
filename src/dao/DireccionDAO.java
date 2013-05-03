package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Direccion;

/**
 * Session Bean implementation class DireccionDAO
 */
@Stateless
@LocalBean
public class DireccionDAO extends DAO<Direccion, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public DireccionDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Direccion> getEntityClass() 
	{
		return Direccion.class;
	}

}
