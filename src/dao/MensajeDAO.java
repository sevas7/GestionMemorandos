package dao;

import java.util.List;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.Query;

import vo.Conversacion;
import vo.Mensaje;

/**
 * Session Bean implementation class MensajeDAO
 */
@Stateless
@LocalBean
public class MensajeDAO extends DAO<Mensaje, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public MensajeDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Mensaje> getEntityClass() {
		// TODO Auto-generated method stub
		return Mensaje.class;
	}
	
	/**
	 * Mensajes de una conversación enviados por un contacto en particular 
	 * (Usado en la bandeja de salida)
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Mensaje> obtenerMensajesConversacion(String conversacion, String contacto)
	{
		Query query = entityManager.createQuery("SELECT entidad FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.conversacion.idConversacion = '"+conversacion+"' AND entidad.contacto.idContacto = '"+contacto+"' ", getEntityClass());
	
		return query.getResultList();
	}
	
	/**
	 * Todos los mensajes de una conversación
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Mensaje> obtenerMensajesConversacion(String conversacion)
	{
		Query query = entityManager.createQuery("SELECT entidad FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.conversacion.idConversacion = '"+conversacion+"'", getEntityClass());
	
		return query.getResultList();
	}
	
	/**
	 * Obtener Los mensajes de una conversación enviados a un Contacto en particular 
	 * (Usado bandeja de entrada)
	 * @param conversacion
	 * @param contacto
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Object> obtenerMensajesConversacionContacto(String conversacion, String contacto)
	{
		Query query = entityManager.createNativeQuery(" SELECT m.idMensaje FROM comunicaciondestinatario cd INNER JOIN mensaje m ON cd.comunicacion=m.idMensaje WHERE m.conversacion='"+conversacion+"' AND cd.destinatario ='"+contacto+"' ORDER BY m.idMensaje DESC");
	
		return query.getResultList();
	}
	
	/**
	 * Agrupar mensajes de una conversación pertenecientes a un contacto para 
	 * mostrarlos en la bandeja de salida
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Conversacion> agruparMensajesPorConversacion(String id)
	{
		Query query = entityManager.createQuery("SELECT m.conversacion FROM "+getEntityClass().getSimpleName()+" m WHERE m.contacto.idContacto ='"+id+"' GROUP BY m.conversacion ", getEntityClass());

		return query.getResultList();
	}

}
