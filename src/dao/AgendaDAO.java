package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Agenda;

/**
 * Session Bean implementation class AgendaDAO
 */
@Stateless
@LocalBean
public class AgendaDAO extends DAO<Agenda, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public AgendaDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Agenda> getEntityClass() {
		// TODO Auto-generated method stub
		return Agenda.class;
	}

}
