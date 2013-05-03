package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.Query;

import vo.Palabraclave;

/**
 * Session Bean implementation class PalabraClaveDAO
 */
@Stateless
@LocalBean
public class PalabraClaveDAO extends DAO<Palabraclave, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public PalabraClaveDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Palabraclave> getEntityClass() 
	{
		return Palabraclave.class;
	}
	
	/**
	 * Obtener el objeto "PalabraClave" a partir del atributo "palabra"
	 * @param palabra
	 * @return
	 */
	public Palabraclave getPalabraClave(String palabra)
	{
		Query query = entityManager.createQuery("SELECT entidad FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.palabra= '"+palabra+"'", getEntityClass());
	
		return  (Palabraclave) query.getSingleResult();
	}

}
