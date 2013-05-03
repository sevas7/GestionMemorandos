package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Actorrol;

/**
 * Session Bean implementation class ActorRolDAO
 */
@Stateless
@LocalBean
public class ActorRolDAO extends DAO<Actorrol, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public ActorRolDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Actorrol> getEntityClass() 
	{
		return Actorrol.class;
	}

}
