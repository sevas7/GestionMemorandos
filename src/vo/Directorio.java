package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the directorio database table.
 * 
 */
@Entity
@PrimaryKeyJoinColumn(name = "idDirectorio")
public class Directorio extends Paquete implements Serializable {
	private static final long serialVersionUID = 1L;

//	@Id
//	private String idDirectorio;

	private String descripcion;

	//bi-directional many-to-one association to Contacto
	@OneToMany(mappedBy="directorioBean")
	private List<Contacto> contactos;

	public Directorio() {
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public List<Contacto> getContactos() {
		return this.contactos;
	}

	public void setContactos(List<Contacto> contactos) {
		this.contactos = contactos;
	}

}