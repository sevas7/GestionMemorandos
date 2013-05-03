package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the contacto database table.
 * 
 */
@Entity
public class Contacto implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idContacto;

	private String email;

	private String nombre;

	private String telefono;

	private String username;

	private String password;
	
	private String descripcion;
	
	//private String flag;

	//bi-directional many-to-one association to Comunicacion
	@OneToMany(mappedBy="contacto")
	private List<Comunicacion> comunicacions;

	//bi-directional many-to-one association to Comunicaciondestinatario
	@OneToMany(mappedBy="contacto")
	private List<Comunicaciondestinatario> comunicaciondestinatarios;

	//bi-directional many-to-one association to Direccion
	@ManyToOne
	@JoinColumn(name="direccion")
	private Direccion direccionBean;

	//bi-directional many-to-one association to Directorio
	@ManyToOne
	@JoinColumn(name="directorio")
	private Directorio directorioBean;

	//bi-directional many-to-one association to Contactoquien
	@OneToMany(mappedBy="contactoBean")
	private List<Contactoquien> contactoquiens;

	//bi-directional many-to-one association to Contactoquien
	@OneToMany(mappedBy="contacto")
	private List<GrupoContacto> grupocontactos;

	public Contacto() {
	}

	public String getIdContacto() {
		return this.idContacto;
	}

	public void setIdContacto(String idContacto) {
		this.idContacto = idContacto;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getTelefono() {
		return this.telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public List<Comunicacion> getComunicacions() {
		return this.comunicacions;
	}

	public void setComunicacions(List<Comunicacion> comunicacions) {
		this.comunicacions = comunicacions;
	}

	public List<Comunicaciondestinatario> getComunicaciondestinatarios() {
		return this.comunicaciondestinatarios;
	}

	public void setComunicaciondestinatarios(List<Comunicaciondestinatario> comunicaciondestinatarios) {
		this.comunicaciondestinatarios = comunicaciondestinatarios;
	}

	public Direccion getDireccionBean() {
		return this.direccionBean;
	}

	public void setDireccionBean(Direccion direccionBean) {
		this.direccionBean = direccionBean;
	}

	public Directorio getDirectorioBean() {
		return this.directorioBean;
	}

	public void setDirectorioBean(Directorio directorioBean) {
		this.directorioBean = directorioBean;
	}

	public List<Contactoquien> getContactoquiens() {
		return this.contactoquiens;
	}

	public void setContactoquiens(List<Contactoquien> contactoquiens) {
		this.contactoquiens = contactoquiens;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((idContacto == null) ? 0 : idContacto.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Contacto other = (Contacto) obj;
		if (idContacto == null) {
			if (other.idContacto != null)
				return false;
		} else if (!idContacto.equals(other.idContacto))
			return false;
		return true;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

//	public String getFlag() {
//		return flag;
//	}
//
//	public void setFlag(String flag) {
//		this.flag = flag;
//	}

}