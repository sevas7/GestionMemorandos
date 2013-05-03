package vo;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the armario database table.
 * 
 */
@Entity
@PrimaryKeyJoinColumn(name = "idArmario")
public class Armario extends Deposito implements Serializable {
	private static final long serialVersionUID = 1L;

//	@Id
//	private String idArmario;

	private String descripcion;

	//bi-directional one-to-one association to Deposito
	@OneToOne
	@JoinColumn(name="idArmario")
	private Deposito deposito;

	public Armario() {
	}

//	public String getIdArmario() {
//		return this.idArmario;
//	}
//
//	public void setIdArmario(String idArmario) {
//		this.idArmario = idArmario;
//	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Deposito getDeposito() {
		return this.deposito;
	}

	public void setDeposito(Deposito deposito) {
		this.deposito = deposito;
	}

}