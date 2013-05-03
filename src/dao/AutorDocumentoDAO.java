package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Autordocumento;

/**
 * Session Bean implementation class AutorDocumentoDAO
 */
@Stateless
@LocalBean
public class AutorDocumentoDAO extends DAO<Autordocumento, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public AutorDocumentoDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Autordocumento> getEntityClass() {
		// TODO Auto-generated method stub
		return Autordocumento.class;
	}

}
