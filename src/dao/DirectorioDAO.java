package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Directorio;

/**
 * Session Bean implementation class DirectorioDAO
 */
@Stateless
@LocalBean
public class DirectorioDAO extends DAO<Directorio, String> {

	private static final long serialVersionUID = 1L;

	public DirectorioDAO() {
        // TODO Auto-generated constructor stub
   }

	@Override
	public Class<Directorio> getEntityClass() {
		// TODO Auto-generated method stub
		return Directorio.class;
	}

}
