package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import vo.Anexo;

@Stateless
@LocalBean
public class AnexoDAO extends DAO<Anexo, String> {
	private static final long serialVersionUID = 1L;

	public AnexoDAO() {

	}

	@Override
	public Class<Anexo> getEntityClass() {
		// TODO Auto-generated method stub
		return Anexo.class;
	}

}
