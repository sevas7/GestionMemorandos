package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Edificio;

/**
 * Session Bean implementation class EdificioDAO
 */
@Stateless
@LocalBean
public class EdificioDAO extends DAO<Edificio, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public EdificioDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Edificio> getEntityClass() 
	{
		return Edificio.class;
	}

}
