package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the direccion database table.
 * 
 */
@Entity
public class Direccion implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_direccion")
	private String idDireccion;

	private String direccion;

	//bi-directional many-to-one association to Contacto
	@OneToMany(mappedBy="direccionBean")
	private List<Contacto> contactos;

	//bi-directional many-to-one association to Ciudad
	@ManyToOne
	@JoinColumn(name="ciudad")
	private Ciudad ciudadBean;

	//bi-directional many-to-one association to Edificio
	@OneToMany(mappedBy="direccionBean")
	private List<Edificio> edificios;

	public Direccion() {
	}

	public String getIdDireccion() {
		return this.idDireccion;
	}

	public void setIdDireccion(String idDireccion) {
		this.idDireccion = idDireccion;
	}

	public String getDireccion() {
		return this.direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public List<Contacto> getContactos() {
		return this.contactos;
	}

	public void setContactos(List<Contacto> contactos) {
		this.contactos = contactos;
	}

	public Ciudad getCiudadBean() {
		return this.ciudadBean;
	}

	public void setCiudadBean(Ciudad ciudadBean) {
		this.ciudadBean = ciudadBean;
	}

	public List<Edificio> getEdificios() {
		return this.edificios;
	}

	public void setEdificios(List<Edificio> edificios) {
		this.edificios = edificios;
	}

}