package vo;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the actividad database table.
 * 
 */
@Entity
public class Actividad implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idActividad;

	private String descripcion;

	private String nombre;

	//bi-directional many-to-one association to Estadoactividad
	@ManyToOne
	@JoinColumn(name="estado")
	private Estadoactividad estadoactividad;

	//bi-directional many-to-one association to Memorando
	@ManyToOne
	@JoinColumn(name="memorando")
	private Memorando memorandoBean;

	public Actividad() {
	}

	public String getIdActividad() {
		return this.idActividad;
	}

	public void setIdActividad(String idActividad) {
		this.idActividad = idActividad;
	}

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

	public Estadoactividad getEstadoactividad() {
		return this.estadoactividad;
	}

	public void setEstadoactividad(Estadoactividad estadoactividad) {
		this.estadoactividad = estadoactividad;
	}

	public Memorando getMemorandoBean() {
		return this.memorandoBean;
	}

	public void setMemorandoBean(Memorando memorandoBean) {
		this.memorandoBean = memorandoBean;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((idActividad == null) ? 0 : idActividad.hashCode());
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
		Actividad other = (Actividad) obj;
		if (idActividad == null) {
			if (other.idActividad != null)
				return false;
		} else if (!idActividad.equals(other.idActividad))
			return false;
		return true;
	}
	
	

}