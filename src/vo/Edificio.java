package vo;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the edificio database table.
 * 
 */
@Entity
@PrimaryKeyJoinColumn(name = "idEdificio")
public class Edificio extends Paquete implements Serializable {
	private static final long serialVersionUID = 1L;

//	@Id
//	private String idEdificio;

	@ManyToOne
	@JoinColumn(name="direccion")
	private Direccion direccionBean;

	public Edificio() {
	}

	public Direccion getDireccionBean() {
		return direccionBean;
	}

	public void setDireccionBean(Direccion direccionBean) {
		this.direccionBean = direccionBean;
	}

//	public String getIdEdificio() {
//		return this.idEdificio;
//	}
//
//	public void setIdEdificio(String idEdificio) {
//		this.idEdificio = idEdificio;
//	}
	
	

}