package vo;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the comunciacioninterna database table.
 * 
 */
@Entity
@PrimaryKeyJoinColumn(name = "idComunicacionI")
public class Comunciacioninterna extends Comunicacion implements Serializable {
	private static final long serialVersionUID = 1L;

//	@Id
//	private String idComunicacionI;

	private String descripcion;

	public Comunciacioninterna() {
	}

//	public String getIdComunicacionI() {
//		return this.idComunicacionI;
//	}
//
//	public void setIdComunicacionI(String idComunicacionI) {
//		this.idComunicacionI = idComunicacionI;
//	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

}