package dao;

import java.util.List;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.Query;
import vo.Comunicaciondestinatario;
import vo.Contacto;

/**
 * Session Bean implementation class ComunicacionDestinatarioDAO
 */
@Stateless
@LocalBean
public class ComunicacionDestinatarioDAO extends DAO<Comunicaciondestinatario, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public ComunicacionDestinatarioDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Comunicaciondestinatario> getEntityClass() 
	{
		return Comunicaciondestinatario.class;
	}
	
	/**
	 * Lista de comunicaciones enviadas a un contacto (Bandeja de entrada)
	 * @param id
	 * @return Lista de comunicaciones asociadas a un destinatario
	 */
	@SuppressWarnings("unchecked")
	public List<Comunicaciondestinatario> obtenerListaComunicaciones(String id)
	{
		Query query = entityManager.createQuery("SELECT entidad FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.contacto.idContacto='"+id+"'", getEntityClass());
		
		return query.getResultList();
	}
	
	/**
	 * Todos los destinatarios de una comunicacion
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Contacto> getDestinatariosComunicacion(String id)
	{
		Query query = entityManager.createQuery("SELECT entidad.contacto FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.comunicacionBean.idDocumento='"+id+"' AND entidad.cc IS NULL", getEntityClass());
		
		return query.getResultList();
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Contacto> getDestinatariosConCopiaComunicacion(String id)
	{
		Query query = entityManager.createQuery("SELECT entidad.contacto FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.comunicacionBean.idDocumento='"+id+"' AND entidad.cc='SI'", getEntityClass());
		
		return query.getResultList();
	}


}