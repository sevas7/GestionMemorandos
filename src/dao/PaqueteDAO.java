package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Paquete;

/**
 * Session Bean implementation class PaqueteDAO
 */
@Stateless
@LocalBean
public class PaqueteDAO extends DAO<Paquete, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public PaqueteDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Paquete> getEntityClass() {
		// TODO Auto-generated method stub
		return Paquete.class;
	}

}
