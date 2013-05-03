package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the estadocomunicacion database table.
 * 
 */
@Entity
public class Estadocomunicacion implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idEstadoComunicacion;

	private String descripcion;

	private String estado;

	//bi-directional many-to-one association to Comunicacion
	@OneToMany(mappedBy="estadocomunicacion")
	private List<Comunicacion> comunicacions;

	public Estadocomunicacion() {
	}

	public String getIdEstadoComunicacion() {
		return this.idEstadoComunicacion;
	}

	public void setIdEstadoComunicacion(String idEstadoComunicacion) {
		this.idEstadoComunicacion = idEstadoComunicacion;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getEstado() {
		return this.estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public List<Comunicacion> getComunicacions() {
		return this.comunicacions;
	}

	public void setComunicacions(List<Comunicacion> comunicacions) {
		this.comunicacions = comunicacions;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime
				* result
				+ ((idEstadoComunicacion == null) ? 0 : idEstadoComunicacion
						.hashCode());
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
		Estadocomunicacion other = (Estadocomunicacion) obj;
		if (idEstadoComunicacion == null) {
			if (other.idEstadoComunicacion != null)
				return false;
		} else if (!idEstadoComunicacion.equals(other.idEstadoComunicacion))
			return false;
		return true;
	}

	
}