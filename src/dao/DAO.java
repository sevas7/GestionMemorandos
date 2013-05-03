package dao;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

public abstract class DAO<Entidad, Llave> implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@PersistenceContext(unitName="gestionMemorandos")
	EntityManager entityManager;

	public void insert(Entidad entidad)
	{
		entityManager.persist(entidad);
	}
	
	public void update(Entidad entidad)
	{
		entityManager.merge(entidad);
	}

	public void remove(Entidad entidad) 
	{
		entityManager.remove(entityManager.merge(entidad));
	}
	
	public abstract Class<Entidad> getEntityClass();
	
	public Entidad findByKey(Llave llave)
	{
		return entityManager.find(getEntityClass(), llave);
	}
	
	public List<Entidad> getAll() 
	{
		return entityManager.createQuery("select entidad from " + getEntityClass().getSimpleName()+ " entidad ", getEntityClass()).getResultList();
	}
	
	public List<Entidad> select(String condicion) 
	{
		return entityManager.createQuery("select entidad from " + getEntityClass().getSimpleName()+ " entidad "+ ("".equals(condicion) ? "" : (condicion == null ? "": " where " + condicion)), getEntityClass()).getResultList();
	}
	
//	public Object buscarporNombre(String nombre)
//	{
//		Query query = entityManager.createQuery("select entidad from "+getEntityClass().getSimpleName()+" entidad where entidad.nombre = ?1", getEntityClass() );
//		query.setParameter(1, nombre);
//		
//		return query.getSingleResult();
//
//	}

	@SuppressWarnings("unchecked")
	public List<Entidad> obtener(int numero)
	{
		Query query = entityManager.createQuery("select entidad from " + getEntityClass().getSimpleName()+ " entidad ", getEntityClass() );
		query = query.setMaxResults(numero);
		
		return query.getResultList();
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Entidad> obtenerAPartirDe(int numero)
	{
		Query query = entityManager.createQuery("select entidad from " + getEntityClass().getSimpleName()+ " entidad ", getEntityClass() );
		query = query.setFirstResult(numero);
		
		return query.getResultList();
	}
	
}