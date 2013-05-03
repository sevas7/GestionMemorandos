package vo;

import java.io.Serializable;
import javax.persistence.*;

import java.util.List;


/**
 * The persistent class for the expediente database table.
 * 
 */
@Entity
public class Expediente implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idExpediente;

	private String asunto;

	private String fechaCreacion;
	
	@ManyToOne
	@JoinColumn(name="expediente")
	private Expediente expedienteBean;

	//bi-directional many-to-one association to Expedientedocumento
	@OneToMany(mappedBy="expedienteBean")
	private List<Expedientedocumento> expedientedocumentos;

	public Expediente() {
	}

	public String getIdExpediente() {
		return this.idExpediente;
	}

	public void setIdExpediente(String idExpediente) {
		this.idExpediente = idExpediente;
	}

	public String getAsunto() {
		return this.asunto;
	}

	public void setAsunto(String asunto) {
		this.asunto = asunto;
	}

	public String getFechaCreacion() {
		return this.fechaCreacion;
	}

	public void setFechaCreacion(String fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	public List<Expedientedocumento> getExpedientedocumentos() {
		return this.expedientedocumentos;
	}

	public void setExpedientedocumentos(List<Expedientedocumento> expedientedocumentos) {
		this.expedientedocumentos = expedientedocumentos;
	}

	public Expediente getExpedienteBean() {
		return expedienteBean;
	}

	public void setExpedienteBean(Expediente expedienteBean) {
		this.expedienteBean = expedienteBean;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((idExpediente == null) ? 0 : idExpediente.hashCode());
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
		Expediente other = (Expediente) obj;
		if (idExpediente == null) {
			if (other.idExpediente != null)
				return false;
		} else if (!idExpediente.equals(other.idExpediente))
			return false;
		return true;
	}
	
	

}