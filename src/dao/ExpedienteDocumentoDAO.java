package dao;

import java.util.List;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.Query;
import vo.Documento;
import vo.Expedientedocumento;

/**
 * Session Bean implementation class ExpedienteDocumentoDAO
 */
@Stateless
@LocalBean
public class ExpedienteDocumentoDAO extends DAO<Expedientedocumento, String> {

	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor. 
	 */
	public ExpedienteDocumentoDAO() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Class<Expedientedocumento> getEntityClass() 
	{
		return Expedientedocumento.class;
	}

	@SuppressWarnings("unchecked")
	public List<Expedientedocumento> getExpedientesDeUnaComunicacion(String id) 
	{
		Query query = entityManager.createQuery("SELECT ed FROM "+getEntityClass().getSimpleName()+" ed WHERE ed.documentoBean.idDocumento='"+id+"'", getEntityClass());
		
		if(query!=null)
		{
			return query.getResultList();
		}
		
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<Documento> listarComunicacionesDeExpediente(String id) 
	{
		Query query = entityManager.createQuery("SELECT ed.documentoBean FROM "+getEntityClass().getSimpleName()+" ed WHERE ed.expedienteBean.idExpediente='"+id+"'", getEntityClass());
		
		if(query!=null)
		{
			return query.getResultList();
		}
		
		return null;
	}

}
