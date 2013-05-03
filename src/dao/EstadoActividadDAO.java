package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import vo.Estadoactividad;

/**
 * Session Bean implementation class EstadoActividadDAO
 */
@Stateless
@LocalBean
public class EstadoActividadDAO extends DAO<Estadoactividad, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public EstadoActividadDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Estadoactividad> getEntityClass() 
	{
		return Estadoactividad.class;
	}

}
