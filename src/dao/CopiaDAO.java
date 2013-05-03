package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Copia;

/**
 * Session Bean implementation class CopiaDAO
 */
@Stateless
@LocalBean
public class CopiaDAO extends DAO<Copia, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public CopiaDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Copia> getEntityClass() {
		// TODO Auto-generated method stub
		return Copia.class;
	}

}
