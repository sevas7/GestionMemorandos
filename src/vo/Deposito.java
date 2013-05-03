package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the deposito database table.
 * 
 */
@Entity
@PrimaryKeyJoinColumn(name = "idDeposito")
@Inheritance(strategy = InheritanceType.JOINED)
public class Deposito extends Paquete implements Serializable {
	private static final long serialVersionUID = 1L;

//	@Id
//	private String idDeposito;

	//bi-directional one-to-one association to Armario
	@OneToOne(mappedBy="deposito")
	private Armario armario;

	//bi-directional many-to-one association to Copia
	@OneToMany(mappedBy="depositoBean")
	private List<Copia> copias;

	//bi-directional many-to-one association to Deposito
	@ManyToOne
	@JoinColumn(name="deposito")
	private Deposito depositoBean;

	//bi-directional many-to-one association to Deposito
	@OneToMany(mappedBy="depositoBean")
	private List<Deposito> depositos;

	//bi-directional many-to-one association to Unidadorganizacional
	@ManyToOne
	@JoinColumn(name="unidadOrganizacional")
	private Unidadorganizacional unidadorganizacional;

	//bi-directional one-to-one association to Disco
	@OneToOne(mappedBy="deposito")
	private Disco disco;

	public Deposito() {
	}

//	public String getIdDeposito() {
//		return this.idDeposito;
//	}
//
//	public void setIdDeposito(String idDeposito) {
//		this.idDeposito = idDeposito;
//	}

	public Armario getArmario() {
		return this.armario;
	}

	public void setArmario(Armario armario) {
		this.armario = armario;
	}

	public List<Copia> getCopias() {
		return this.copias;
	}

	public void setCopias(List<Copia> copias) {
		this.copias = copias;
	}

	public Deposito getDepositoBean() {
		return this.depositoBean;
	}

	public void setDepositoBean(Deposito depositoBean) {
		this.depositoBean = depositoBean;
	}

	public List<Deposito> getDepositos() {
		return this.depositos;
	}

	public void setDepositos(List<Deposito> depositos) {
		this.depositos = depositos;
	}

	public Unidadorganizacional getUnidadorganizacional() {
		return this.unidadorganizacional;
	}

	public void setUnidadorganizacional(Unidadorganizacional unidadorganizacional) {
		this.unidadorganizacional = unidadorganizacional;
	}

	public Disco getDisco() {
		return this.disco;
	}

	public void setDisco(Disco disco) {
		this.disco = disco;
	}

}