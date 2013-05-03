package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Fecha;

/**
 * Session Bean implementation class FechaDAO
 */
@Stateless
@LocalBean
public class FechaDAO extends DAO<Fecha, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public FechaDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Fecha> getEntityClass() {
		// TODO Auto-generated method stub
		return Fecha.class;
	}

}
