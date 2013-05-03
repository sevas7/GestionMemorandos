package vo;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the paquete database table.
 * 
 */
@Entity
@DiscriminatorColumn(name="tipo")
@Inheritance(strategy = InheritanceType.JOINED)
public class Paquete implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idPaquete;

	private String nombre;


	//bi-directional one-to-one association to Agenda
	@OneToOne(mappedBy="paquete")
	private Agenda agenda;

	public Paquete() {
	}

	public String getIdPaquete() {
		return this.idPaquete;
	}

	public void setIdPaquete(String idPaquete) {
		this.idPaquete = idPaquete;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

//	public String getTipo() {
//		return this.tipo;
//	}
//
//	public void setTipo(String tipo) {
//		this.tipo = tipo;
//	}

	public Agenda getAgenda() {
		return this.agenda;
	}

	public void setAgenda(Agenda agenda) {
		this.agenda = agenda;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((idPaquete == null) ? 0 : idPaquete.hashCode());
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
		Paquete other = (Paquete) obj;
		if (idPaquete == null) {
			if (other.idPaquete != null)
				return false;
		} else if (!idPaquete.equals(other.idPaquete))
			return false;
		return true;
	}
	
	

}