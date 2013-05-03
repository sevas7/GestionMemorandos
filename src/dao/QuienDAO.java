package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Quien;

/**
 * Session Bean implementation class QuienDAO
 */
@Stateless
@LocalBean
public class QuienDAO extends DAO<Quien, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public QuienDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Quien> getEntityClass() 
	{
		return Quien.class;
	}

}
