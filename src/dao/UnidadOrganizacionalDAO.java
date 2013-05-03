package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Unidadorganizacional;

/**
 * Session Bean implementation class UnidadOrganizacionalDAO
 */
@Stateless
@LocalBean
public class UnidadOrganizacionalDAO extends DAO<Unidadorganizacional, String>{

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public UnidadOrganizacionalDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Unidadorganizacional> getEntityClass() 
	{
		return Unidadorganizacional.class;
	}

}
