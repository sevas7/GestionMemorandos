package dao;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.Query;

import vo.Observacion;

/**
 * Session Bean implementation class ObservacionDAO
 */
@Stateless
@LocalBean
public class ObservacionDAO extends DAO<Observacion, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public ObservacionDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Observacion> getEntityClass() 
	{
		return Observacion.class;
	}
	
	/**
	 * Lista de Observaciones de un documento
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Observacion> obtenerObservaciones(String id)
	{
		Query query = entityManager.createQuery("SELECT entidad FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.documento.idDocumento='"+id+"' ", getEntityClass());
		
		return query.getResultList();
	}

}
