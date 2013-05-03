package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the unidadorganizacional database table.
 * 
 */
@Entity
@PrimaryKeyJoinColumn(name = "idUnidadOrganizacional")
public class Unidadorganizacional extends Quien implements Serializable {
	private static final long serialVersionUID = 1L;

//	@Id
//	private String idUnidadOrganizacional;

	private String descripcion;

	private String nombre;

	//bi-directional many-to-one association to Deposito
	@OneToMany(mappedBy="unidadorganizacional")
	private List<Deposito> depositos;

	//bi-directional many-to-one association to Rol
	@OneToMany(mappedBy="unidadorganizacional")
	private List<Rol> rols;

	//bi-directional many-to-one association to Edificio
	@ManyToOne
	@JoinColumn(name="edificio")
	private Edificio edificioBean;

	//bi-directional one-to-one association to Quien
//	@OneToOne
//	@JoinColumn(name="idUnidadOrganizacional")
//	private Quien quien;

	//bi-directional many-to-one association to Unidadorganizacional
	@ManyToOne
	@JoinColumn(name="unidadorganizacional")
	private Unidadorganizacional unidadorganizacionalBean;

	//bi-directional many-to-one association to Unidadorganizacional
	@OneToMany(mappedBy="unidadorganizacionalBean")
	private List<Unidadorganizacional> unidadorganizacionals;

	public Unidadorganizacional() {
	}

//	public String getIdUnidadOrganizacional() {
//		return this.idUnidadOrganizacional;
//	}
//
//	public void setIdUnidadOrganizacional(String idUnidadOrganizacional) {
//		this.idUnidadOrganizacional = idUnidadOrganizacional;
//	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public List<Deposito> getDepositos() {
		return this.depositos;
	}

	public void setDepositos(List<Deposito> depositos) {
		this.depositos = depositos;
	}

	public List<Rol> getRols() {
		return this.rols;
	}

	public void setRols(List<Rol> rols) {
		this.rols = rols;
	}

	public Edificio getEdificioBean() {
		return this.edificioBean;
	}

	public void setEdificioBean(Edificio edificioBean) {
		this.edificioBean = edificioBean;
	}

//	public Quien getQuien() {
//		return this.quien;
//	}
//
//	public void setQuien(Quien quien) {
//		this.quien = quien;
//	}

	public Unidadorganizacional getUnidadorganizacionalBean() {
		return this.unidadorganizacionalBean;
	}

	public void setUnidadorganizacionalBean(Unidadorganizacional unidadorganizacionalBean) {
		this.unidadorganizacionalBean = unidadorganizacionalBean;
	}

	public List<Unidadorganizacional> getUnidadorganizacionals() {
		return this.unidadorganizacionals;
	}

	public void setUnidadorganizacionals(List<Unidadorganizacional> unidadorganizacionals) {
		this.unidadorganizacionals = unidadorganizacionals;
	}

}