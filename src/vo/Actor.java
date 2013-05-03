package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the actor database table.
 * 
 */
@Entity
@PrimaryKeyJoinColumn(name = "idActor")
public class Actor extends Quien implements Serializable {
	private static final long serialVersionUID = 1L;

//	@Id
//	private String idActor;

	private String apellido;

	private String nombre;
	
	private String email;

	private String descripcion;

	//bi-directional one-to-one association to Quien

	//bi-directional many-to-one association to Actorrol
	@OneToMany(mappedBy="actorBean")
	private List<Actorrol> actorrols;

	//bi-directional many-to-one association to Autordocumento
	@OneToMany(mappedBy="actorBean")
	private List<Autordocumento> autordocumentos;

	public Actor() {
	}

	public String getApellido() {
		return this.apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
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

	public List<Autordocumento> getAutordocumentos() {
		return this.autordocumentos;
	}

	public void setAutordocumentos(List<Autordocumento> autordocumentos) {
		this.autordocumentos = autordocumentos;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}


}