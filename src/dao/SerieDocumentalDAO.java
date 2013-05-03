package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Seriedocumental;

/**
 * Session Bean implementation class SerieDocumentalDAO
 */
@Stateless
@LocalBean
public class SerieDocumentalDAO extends DAO<Seriedocumental, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public SerieDocumentalDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Seriedocumental> getEntityClass()
	{
		return Seriedocumental.class;
	}

}
