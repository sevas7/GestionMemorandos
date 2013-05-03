package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Tablaretenciondocumental;

/**
 * Session Bean implementation class TablaRetencionDocumentalDAO
 */
@Stateless
@LocalBean
public class TablaRetencionDocumentalDAO extends DAO<Tablaretenciondocumental, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public TablaRetencionDocumentalDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Tablaretenciondocumental> getEntityClass() 
	{
		return Tablaretenciondocumental.class;
	}

}
