package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Expediente;

/**
 * Session Bean implementation class ExpedienteDAO
 */
@Stateless
@LocalBean
public class ExpedienteDAO extends DAO<Expediente, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public ExpedienteDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Expediente> getEntityClass() 
	{
		return Expediente.class;
	}

}
