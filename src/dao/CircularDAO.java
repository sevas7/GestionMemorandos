package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Circular;

/**
 * Session Bean implementation class CircularDAO
 */
@Stateless
@LocalBean
public class CircularDAO extends DAO<Circular, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public CircularDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Circular> getEntityClass() 
	{
		return Circular.class;
	}

}
