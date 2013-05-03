package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the ciudad database table.
 * 
 */
@Entity
public class Ciudad implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idCiudad;

	private String nombre;

	//bi-directional many-to-one association to Direccion
	@OneToMany(mappedBy="ciudadBean")
	private List<Direccion> direccions;

	public Ciudad() {
	}

	public String getIdCiudad() {
		return this.idCiudad;
	}

	public void setIdCiudad(String idCiudad) {
		this.idCiudad = idCiudad;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public List<Direccion> getDireccions() {
		return this.direccions;
	}

	public void setDireccions(List<Direccion> direccions) {
		this.direccions = direccions;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((idCiudad == null) ? 0 : idCiudad.hashCode());
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
		Ciudad other = (Ciudad) obj;
		if (idCiudad == null) {
			if (other.idCiudad != null)
				return false;
		} else if (!idCiudad.equals(other.idCiudad))
			return false;
		return true;
	}
	
	

}