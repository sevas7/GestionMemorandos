package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.Query;
import vo.Estadocomunicacion;

/**
 * Session Bean implementation class EstadoComunicacionDAO
 */
@Stateless
@LocalBean
public class EstadoComunicacionDAO extends DAO<Estadocomunicacion, String>  {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public EstadoComunicacionDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Estadocomunicacion> getEntityClass() 
	{
		return Estadocomunicacion.class;
	}
	
	public Estadocomunicacion obtenerEstadoComunicacion(String estado)
	{
		Query query = entityManager.createQuery("SELECT entidad FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.estado='"+estado+"'", getEntityClass());

		return (Estadocomunicacion) query.getSingleResult();
	}

}
