package vo;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the circular database table.
 * 
 */
@Entity
@PrimaryKeyJoinColumn(name = "idCircular")
public class Circular extends Comunicacion implements Serializable {
	private static final long serialVersionUID = 1L;

//	@Id
//	private String idCircular;

	private String numeroRadicado;
	
	//bi-directional one-to-one association to Comunicacion
	@OneToOne
	@JoinColumn(name="idCircular")
	private Comunicacion comunicacion;

	public Circular() {
	}

//	public String getIdCircular() {
//		return this.idCircular;
//	}
//
//	public void setIdCircular(String idCircular) {
//		this.idCircular = idCircular;
//	}

	public Comunicacion getComunicacion() {
		return this.comunicacion;
	}

	public void setComunicacion(Comunicacion comunicacion) {
		this.comunicacion = comunicacion;
	}

	public String getNumeroRadicado() {
		return numeroRadicado;
	}

	public void setNumeroRadicado(String numeroRadicado) {
		this.numeroRadicado = numeroRadicado;
	}

	
}