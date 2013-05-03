package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Memorando;

/**
 * Session Bean implementation class MemorandoDAO
 */
@Stateless
@LocalBean
public class MemorandoDAO extends DAO<Memorando, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public MemorandoDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Memorando> getEntityClass() 
	{
		return Memorando.class;
	}

}
