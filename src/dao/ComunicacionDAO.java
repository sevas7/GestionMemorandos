package dao;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.Query;

import vo.Comunicacion;

/**
 * Session Bean implementation class Comunicacion
 */
@Stateless
@LocalBean
public class ComunicacionDAO extends DAO<Comunicacion, String> {

	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor. 
	 */
	public ComunicacionDAO() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Class<Comunicacion> getEntityClass() 
	{
		return Comunicacion.class;
	}

	/**
	 * Lista Comunicaciones enviadas por un contacto (Bandeja de salida)
	 * @return Lista de Comunicaciones 
	 */
	@SuppressWarnings("unchecked")
	public List<Comunicacion> obtenerListaComunicacionesDeContacto(String id)
	{
		Query query = entityManager.createQuery("SELECT entidad FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.contacto.idContacto='"+id+"'", getEntityClass());

		return query.getResultList();
	}

	/**
	 * Lista de comunicaciones de una unidad organizacional
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Comunicacion> obtenerTodasLasComunicacionesDeUnaUO(String id)
	{
		Query query = entityManager.createQuery("SELECT entidad FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.unidadOrganizacional='"+id+"'", getEntityClass());

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Comunicacion> obtenerTodasLasComunicacionesEnConstruccion(String id)
	{
		Query query = entityManager.createQuery("SELECT entidad FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.unidadOrganizacional='"+id+"' AND entidad.estadocomunicacion.estado='En construccion' OR entidad.estadocomunicacion.estado='Construido'", getEntityClass());

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Comunicacion> obtenerTodasLasComunicacionesEnRedaccion(String id)
	{
		Query query = entityManager.createQuery("SELECT entidad FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.unidadOrganizacional='"+id+"' AND entidad.estadocomunicacion.estado='En redaccion'", getEntityClass());

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Comunicacion> obtenerTodasLasComunicacionesRedactadas(String id)
	{
		Query query = entityManager.createQuery("SELECT entidad FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.unidadOrganizacional='"+id+"' AND entidad.estadocomunicacion.estado='Redactado' OR entidad.estadocomunicacion.estado='En redaccion' ", getEntityClass());

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Comunicacion> obtenerTodasLasComunicacionesRegistradas(String id)
	{
		Query query = entityManager.createQuery("SELECT entidad FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.unidadOrganizacional='"+id+"' AND entidad.estadocomunicacion.estado='Registrado'", getEntityClass());

		return query.getResultList();
	}

}