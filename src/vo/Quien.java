package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the quien database table.
 * 
 */
@Entity
@DiscriminatorColumn(name="tipo")
@Inheritance(strategy = InheritanceType.JOINED)
public class Quien implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idQuien;

	//bi-directional many-to-one association to Contactoquien
	@OneToMany(mappedBy="quienBean")
	private List<Contactoquien> contactoquiens;

	//bi-directional one-to-one association to Rol
	@OneToOne(mappedBy="quien")
	private Rol rol;

	//bi-directional one-to-one association to Unidadorganizacional
//	@OneToOne(mappedBy="quien")
//	private Unidadorganizacional unidadorganizacional;

	public Quien() {
	}

	public String getIdQuien() {
		return this.idQuien;
	}

	public void setIdQuien(String idQuien) {
		this.idQuien = idQuien;
	}

	public List<Contactoquien> getContactoquiens() {
		return this.contactoquiens;
	}

	public void setContactoquiens(List<Contactoquien> contactoquiens) {
		this.contactoquiens = contactoquiens;
	}

	public Rol getRol() {
		return this.rol;
	}

	public void setRol(Rol rol) {
		this.rol = rol;
	}

//	public Unidadorganizacional getUnidadorganizacional() {
//		return this.unidadorganizacional;
//	}
//
//	public void setUnidadorganizacional(Unidadorganizacional unidadorganizacional) {
//		this.unidadorganizacional = unidadorganizacional;
//	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((idQuien == null) ? 0 : idQuien.hashCode());
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
		Quien other = (Quien) obj;
		if (idQuien == null) {
			if (other.idQuien != null)
				return false;
		} else if (!idQuien.equals(other.idQuien))
			return false;
		return true;
	}
	
}