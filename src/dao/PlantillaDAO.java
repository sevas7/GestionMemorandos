package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Plantilla;

/**
 * Session Bean implementation class PlantillaDAO
 */
@Stateless
@LocalBean
public class PlantillaDAO extends DAO<Plantilla, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public PlantillaDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Plantilla> getEntityClass() 
	{
		return Plantilla.class;
	}

}
