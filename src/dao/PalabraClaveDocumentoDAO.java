package dao;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.Query;

import vo.Palabraclave;
import vo.Palabradocumento;

/**
 * Session Bean implementation class PalabraClaveDocumentoDAO
 */
@Stateless
@LocalBean
public class PalabraClaveDocumentoDAO extends DAO<Palabradocumento, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public PalabraClaveDocumentoDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Palabradocumento> getEntityClass() 
	{
		return Palabradocumento.class;
	}
	
	@SuppressWarnings("unchecked")
	public List<Palabraclave> listarPalabrasClavesDocumento(String id)
	{
		Query query = entityManager.createQuery("SELECT entidad.palabraclave FROM "+getEntityClass().getSimpleName()+" entidad WHERE entidad.documentoBean.idDocumento = '"+id+"' ", getEntityClass());
	
		return query.getResultList();
	
	}

}