package dao;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.Query;
import vo.Conversacion;

/**
 * Session Bean implementation class ConversacionDAO
 */
@Stateless
@LocalBean
public class ConversacionDAO extends DAO<Conversacion, String> {

	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor. 
	 */
	public ConversacionDAO() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Class<Conversacion> getEntityClass() {
		// TODO Auto-generated method stub
		return Conversacion.class;
	}

	@SuppressWarnings("unchecked")
	public List<Conversacion> listaConversacionesDeUnaComunicacion(String idComunicacion)
	{
		Query query = entityManager.createQuery("SELECT entidad FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.comunicacion.idDocumento= '"+idComunicacion+"' ", getEntityClass());

		return query.getResultList();

	}

}
