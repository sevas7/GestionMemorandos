package vo;

import java.io.Serializable;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: Observacion
 *
 */
@Entity
public class Observacion implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	private String idObservacion;

	private String observacion;

	@ManyToOne
	@JoinColumn(name="documento")
	private Documento documento;
	
	public Observacion() {
		super();
	}

	public String getIdObservacion() {
		return idObservacion;
	}

	public void setIdObservacion(String idObservacion) {
		this.idObservacion = idObservacion;
	}

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}

	public Documento getDocumento() {
		return documento;
	}

	public void setDocumento(Documento documento) {
		this.documento = documento;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((idObservacion == null) ? 0 : idObservacion.hashCode());
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
		Observacion other = (Observacion) obj;
		if (idObservacion == null) {
			if (other.idObservacion != null)
				return false;
		} else if (!idObservacion.equals(other.idObservacion))
			return false;
		return true;
	}


}