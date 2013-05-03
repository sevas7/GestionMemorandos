package dao;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.Query;
import vo.Contacto;

/**
 * Session Bean implementation class Contacto
 */
@Stateless
@LocalBean
public class ContactoDAO extends DAO<Contacto, String> {

	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor. 
	 */
	public ContactoDAO() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Class<Contacto> getEntityClass() 
	{
		return Contacto.class;
	}

	/**
	 * Comprobar si el contacto existe en la base de datos
	 * @param username
	 * @param password
	 * @return
	 */
	public Contacto verificarContacto(String username, String password) 
	{	
		try{

			Query query = entityManager.createQuery("SELECT entidad FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.username = '"+username+"' AND entidad.password = '"+password+"'", getEntityClass());
			return (Contacto) query.getSingleResult();

		}
		catch(Exception e)
		{
			//e.printStackTrace();
		}

		return null;
	}

	/**
	 * Obtener el rol de un contacto
	 * @param id
	 * @return
	 */
	public Object definirRolContacto(String id)
	{
		Query tipo = entityManager.createNativeQuery("SELECT quien.tipo FROM contacto c INNER JOIN contactoquien cq ON c.idContacto=cq.contacto INNER JOIN quien quien ON cq.quien=quien.idQuien WHERE c.idContacto='"+id+"'");
		Query query=null;

		if(tipo.getSingleResult().toString().equals("Rol"))
		{
			query = entityManager.createNativeQuery("SELECT rol.nombre FROM contacto c INNER JOIN contactoquien cq ON c.idContacto=cq.contacto INNER JOIN quien quien ON cq.quien=quien.idQuien INNER JOIN rol rol ON quien.idQuien=rol.idRol WHERE c.idContacto = '"+id+"'");
		}

		if(tipo.getSingleResult().toString().equals("Actor"))
		{
			query = entityManager.createNativeQuery("SELECT rol.nombre FROM contacto c INNER JOIN contactoquien cq ON c.idContacto=cq.contacto INNER JOIN quien quien ON cq.quien=quien.idQuien INNER JOIN actor a ON quien.idQuien=a.idActor INNER JOIN actorrol ar ON a.idActor=ar.actor INNER JOIN rol rol ON ar.rol=rol.idRol WHERE c.idContacto = '"+id+"'");
		}

		if(query!=null)
		{
			return query.getSingleResult();
		}
		
		return null;

	}
	
	/**
	 * Listar los contactos que representan a alguna unidad organizacional
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Object> getListaUnidadesOrganizacionales()
	{
		Query tipo = entityManager.createNativeQuery("SELECT c.idContacto FROM contacto c INNER JOIN contactoquien cq ON c.idContacto=cq.contacto INNER JOIN quien quien ON cq.quien=quien.idQuien WHERE quien.tipo='Unidadorganizacional'");

		return tipo.getResultList();
	}

	/**
	 * Identificar al usuario para recuperar su contraseña
	 * @param username
	 * @return
	 */
	public Contacto buscarContacto(String username)
	{
		Query query = entityManager.createQuery("SELECT entidad FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.username = '"+username+"'", getEntityClass());
		return (Contacto) query.getSingleResult();
	}

	/**
	 * Nos permite obtener la unidad organizacional a la que pertenece un contacto
	 * @param id
	 * @return
	 */
	public Object obtenerUnidadOrganizacionalContacto(String id)
	{
		Query tipo = entityManager.createNativeQuery("SELECT quien.tipo FROM contacto c INNER JOIN contactoquien cq ON c.idContacto=cq.contacto INNER JOIN quien quien ON cq.quien=quien.idQuien WHERE c.idContacto='"+id+"'");
		Query query=null;

		if(tipo.getSingleResult().toString().equals("Rol"))
		{
			query = entityManager.createNativeQuery("SELECT r.unidadOrganizacional FROM contacto contacto INNER JOIN contactoquien cq ON contacto.idContacto=cq.contacto INNER JOIN quien q ON cq.quien=q.idQuien INNER JOIN rol r ON q.idQuien=r.idRol WHERE contacto.idContacto='"+id+"'");
		}

		if(tipo.getSingleResult().toString().equals("Actor"))
		{
			query = entityManager.createNativeQuery("SELECT r.unidadOrganizacional FROM contacto contacto INNER JOIN contactoquien cq ON contacto.idContacto=cq.contacto INNER JOIN quien q ON cq.quien=q.idQuien INNER JOIN actor a ON q.idQuien=a.idActor INNER JOIN actorrol ar ON a.idActor=ar.actor INNER JOIN rol r ON ar.rol=r.idRol WHERE contacto.idContacto='"+id+"'");
		}
		
		if(query!=null)
		{
			return query.getSingleResult();
		}

		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> listarContactosDeUnidadOrganizacional(String uo)
	{
		List<Object> lista = new ArrayList<Object>();
		
		Query query = entityManager.createNativeQuery("SELECT t.idContacto FROM contacto t INNER JOIN contactoquien c ON t.idContacto=c.contacto INNER JOIN quien q ON c.quien=q.idQuien INNER JOIN rol r ON q.idQuien=r.idRol WHERE r.unidadOrganizacional='"+uo+"'");
		
		Query query2 = entityManager.createNativeQuery("SELECT t.idContacto FROM contacto t INNER JOIN contactoquien c ON t.idContacto=c.contacto INNER JOIN quien q ON c.quien =q.idQuien INNER JOIN actor a ON q.idQuien=a.idActor INNER JOIN actorrol ar ON a.idActor=ar.actor INNER JOIN rol r ON ar.rol=r.idRol WHERE r.unidadOrganizacional='"+uo+"'");

		lista.addAll(query.getResultList());
		lista.addAll(query2.getResultList());
		
		return lista;	
		
	}
	

	/**
	 * ID Contacto correspondiente a un idQuien
	 * @param id
	 * @return
	 */
	public Object idContactoDeUnidadOrganizacional(String id)
	{
		try{
			Query query = entityManager.createNativeQuery("SELECT cq.contacto FROM quien q INNER JOIN contactoquien cq ON q.idQuien=cq.quien WHERE q.idQuien='"+id+"'");

			if(query!=null)
			{
				return query.getSingleResult();
			}
		}
		catch (Exception e){}

		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<String> getAllDirectores()
	{
		List<String> aux = new ArrayList<String>();
		
		Query query = entityManager.createNativeQuery("SELECT c.idContacto FROM rol r INNER JOIN quien q ON r.idRol=q.idQuien INNER JOIN contactoquien cq ON q.idQuien=cq.quien INNER JOIN contacto c ON cq.contacto=c.idContacto WHERE r.nombre='director' OR r.nombre='decano' OR r.nombre='vicerrector'");
		aux.addAll(query.getResultList());
		
		Query query2 = entityManager.createNativeQuery("SELECT c.idContacto FROM rol r INNER JOIN actorrol ar ON r.idRol=ar.rol INNER JOIN quien q ON ar.actor=q.idQuien INNER JOIN contactoquien cq ON q.idQuien=cq.quien INNER JOIN contacto c ON cq.contacto=c.idContacto WHERE r.nombre='director' OR r.nombre='decano' OR r.nombre='vicerrector'");
		aux.addAll(query2.getResultList());
		
		return aux;
	}
	
	public Contacto buscarContactoPorNombre(String nombre)
	{
		Query query = entityManager.createQuery("SELECT entidad FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.nombre = '"+nombre+"'", getEntityClass());
		
		if(query!=null)
		{
			return (Contacto) query.getSingleResult();
		}
		
		return null;
	}

}