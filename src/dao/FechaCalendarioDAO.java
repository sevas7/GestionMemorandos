package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Fechacalendario;

/**
 * Session Bean implementation class FechaCalendarioDAO
 */
@Stateless
@LocalBean
public class FechaCalendarioDAO extends DAO<Fechacalendario, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public FechaCalendarioDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Fechacalendario> getEntityClass() {
		// TODO Auto-generated method stub
		return Fechacalendario.class;
	}

}
