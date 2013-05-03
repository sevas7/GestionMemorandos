package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.Query;

import vo.Actor;

/**
 * Session Bean implementation class ActorDAO
 */
@Stateless
@LocalBean
public class ActorDAO extends DAO<Actor, String> {

	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor. 
	 */
	public ActorDAO() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Class<Actor> getEntityClass() 
	{
		return Actor.class;
	}

	/**
	 * Consulta: (SELECT r.DESCRIPCION FROM actorrol ac INNER JOIN rol r ON ac.rol=r.IDROL INNER JOIN actor act ON act.idActor=ac.actor WHERE act.username='"+username+"' AND act.password='"+password+"'");
	 * @param username
	 * @param password
	 * @return
	 */
//	public Actor verificarUsuario(String username, String password) 
//	{	
//		try{
//			Query query = entityManager.createQuery("SELECT entidad FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.username = '"+username+"' AND entidad.password = '"+password+"'", getEntityClass());
//			return (Actor) query.getSingleResult();
//		}
//		catch(Exception e)
//		{
//			e.printStackTrace();
//		}
//
//		return null;
//	}

	/**
	 * Definir el rol del usuario a partir de su nombre de usuario y contraseña
	 * @param username
	 * @param password
	 * @return
	 */
	public Object definirRolUsuario(String username, String password)
	{
		Query query = entityManager.createNativeQuery("SELECT r.DESCRIPCION FROM actorrol ac INNER JOIN rol r ON ac.rol=r.IDROL INNER JOIN actor act ON act.idActor=ac.actor WHERE act.username='"+username+"' AND act.password='"+password+"'");
		return query.getSingleResult();

	}
	
	/**
	 * Identificar al usuario para recuperar su contraseña
	 * @param username
	 * @return
	 */
	public Actor buscarActor(String username)
	{
		Query query = entityManager.createQuery("SELECT entidad FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.username = '"+username+"'", getEntityClass());
		return (Actor) query.getSingleResult();
	}

}
