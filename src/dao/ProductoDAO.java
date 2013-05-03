package dao;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import vo.Producto;

/**
 * Session Bean implementation class ProductoDAO
 */
@Stateless
@LocalBean
public class ProductoDAO extends DAO<Producto, String> {

	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public ProductoDAO() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Class<Producto> getEntityClass() {
		// TODO Auto-generated method stub
		return Producto.class;
	}

}
