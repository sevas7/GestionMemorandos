package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the estadoactividad database table.
 * 
 */
@Entity
public class Estadoactividad implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idEstadoActividad;

	private String descripcion;

	private String estado;

	//bi-directional many-to-one association to Actividad
	@OneToMany(mappedBy="estadoactividad")
	private List<Actividad> actividads;

	public Estadoactividad() {
	}

	public String getIdEstadoActividad() {
		return this.idEstadoActividad;
	}

	public void setIdEstadoActividad(String idEstadoActividad) {
		this.idEstadoActividad = idEstadoActividad;
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

	public List<Actividad> getActividads() {
		return this.actividads;
	}

	public void setActividads(List<Actividad> actividads) {
		this.actividads = actividads;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime
				* result
				+ ((idEstadoActividad == null) ? 0 : idEstadoActividad
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
		Estadoactividad other = (Estadoactividad) obj;
		if (idEstadoActividad == null) {
			if (other.idEstadoActividad != null)
				return false;
		} else if (!idEstadoActividad.equals(other.idEstadoActividad))
			return false;
		return true;
	}

	
	
}