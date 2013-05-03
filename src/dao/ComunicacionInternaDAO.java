package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import vo.Comunciacioninterna;


/**
 * Session Bean implementation class ComunicacionInternaDAO
 */
@Stateless
@LocalBean
public class ComunicacionInternaDAO extends DAO<Comunciacioninterna, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public ComunicacionInternaDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Comunciacioninterna> getEntityClass() 
	{
		return Comunciacioninterna.class;
	}

}
