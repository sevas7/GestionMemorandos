package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Calendario;

/**
 * Session Bean implementation class CalendarioDAO
 */
@Stateless
@LocalBean
public class CalendarioDAO extends DAO<Calendario, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public CalendarioDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Calendario> getEntityClass() {
		// TODO Auto-generated method stub
		return Calendario.class;
	}

}
