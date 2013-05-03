package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Deposito;

/**
 * Session Bean implementation class DepositoDAO
 */
@Stateless
@LocalBean
public class DepositoDAO extends DAO<Deposito, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public DepositoDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Deposito> getEntityClass() {
		// TODO Auto-generated method stub
		return Deposito.class;
	}

}
