package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import vo.Documento;

/**
 * Session Bean implementation class DocumentoDAO
 */
@Stateless
@LocalBean
public class DocumentoDAO extends DAO<Documento, String>{

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public DocumentoDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Documento> getEntityClass() 
	{
		return Documento.class;
	}

}
