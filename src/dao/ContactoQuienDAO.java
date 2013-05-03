package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Contactoquien;

/**
 * Session Bean implementation class ContactoQuienDAO
 */
@Stateless
@LocalBean
public class ContactoQuienDAO extends DAO<Contactoquien, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public ContactoQuienDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Contactoquien> getEntityClass() {
		// TODO Auto-generated method stub
		return Contactoquien.class;
	}

}
