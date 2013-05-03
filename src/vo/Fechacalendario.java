package vo;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the fechacalendario database table.
 * 
 */
@Entity
public class Fechacalendario implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idFechaCalendario;

	//bi-directional many-to-one association to Calendario
	@ManyToOne
	@JoinColumn(name="calendario")
	private Calendario calendarioBean;

	//bi-directional many-to-one association to Fecha
	@ManyToOne
	@JoinColumn(name="fecha")
	private Fecha fechaBean;

	public Fechacalendario() {
	}

	public String getIdFechaCalendario() {
		return this.idFechaCalendario;
	}

	public void setIdFechaCalendario(String idFechaCalendario) {
		this.idFechaCalendario = idFechaCalendario;
	}

	public Calendario getCalendarioBean() {
		return this.calendarioBean;
	}

	public void setCalendarioBean(Calendario calendarioBean) {
		this.calendarioBean = calendarioBean;
	}

	public Fecha getFechaBean() {
		return this.fechaBean;
	}

	public void setFechaBean(Fecha fechaBean) {
		this.fechaBean = fechaBean;
	}

}