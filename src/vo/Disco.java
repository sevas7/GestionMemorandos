package vo;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the disco database table.
 * 
 */
@Entity
@PrimaryKeyJoinColumn(name = "idDisco")
public class Disco extends Deposito implements Serializable {
	private static final long serialVersionUID = 1L;

//	@Id
//	private String idDisco;

	private String descripcion;

	private String referencia;

	//bi-directional one-to-one association to Deposito
	@OneToOne
	@JoinColumn(name="idDisco")
	private Deposito deposito;

	public Disco() {
	}

//	public String getIdDisco() {
//		return this.idDisco;
//	}
//
//	public void setIdDisco(String idDisco) {
//		this.idDisco = idDisco;
//	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getReferencia() {
		return this.referencia;
	}

	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}

	public Deposito getDeposito() {
		return this.deposito;
	}

	public void setDeposito(Deposito deposito) {
		this.deposito = deposito;
	}

}