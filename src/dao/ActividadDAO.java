package dao;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.Query;

import vo.Actividad;

/**
 * Session Bean implementation class ActividadDAO
 */
@Stateless
@LocalBean
public class ActividadDAO extends DAO<Actividad, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public ActividadDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Actividad> getEntityClass() {
		return Actividad.class;
	}
	
	@SuppressWarnings("unchecked")
	public List<Actividad> actividadesAsiganadasAUnContacto(String id)
	{
		Query query = entityManager.createQuery("SELECT entidad FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.contacto = '"+id+"'", getEntityClass());
		
		return query.getResultList();
	}

}
