package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the rol database table.
 * 
 */
@Entity
@PrimaryKeyJoinColumn(name = "idRol")
public class Rol extends Quien implements Serializable {
	private static final long serialVersionUID = 1L;

//	@Id
//	private String idRol;

	private String descripcion;

	private String nombre;

	//bi-directional many-to-one association to Actorrol
	@OneToMany(mappedBy="rolBean")
	private List<Actorrol> actorrols;

	//bi-directional one-to-one association to Quien
	@OneToOne
	@JoinColumn(name="idRol")
	private Quien quien;

	//bi-directional many-to-one association to Unidadorganizacional
	@ManyToOne
	@JoinColumn(name="unidadOrganizacional")
	private Unidadorganizacional unidadorganizacional;

	public Rol() {
	}

//	public String getIdRol() {
//		return this.idRol;
//	}
//
//	public void setIdRol(String idRol) {
//		this.idRol = idRol;
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

	public List<Actorrol> getActorrols() {
		return this.actorrols;
	}

	public void setActorrols(List<Actorrol> actorrols) {
		this.actorrols = actorrols;
	}

	public Quien getQuien() {
		return this.quien;
	}

	public void setQuien(Quien quien) {
		this.quien = quien;
	}

	public Unidadorganizacional getUnidadorganizacional() {
		return this.unidadorganizacional;
	}

	public void setUnidadorganizacional(Unidadorganizacional unidadorganizacional) {
		this.unidadorganizacional = unidadorganizacional;
	}

}