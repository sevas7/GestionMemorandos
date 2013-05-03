package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the calendario database table.
 * 
 */
@Entity
public class Calendario implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idCalendario;

	private String nombre;

	//bi-directional many-to-one association to Agenda
	@ManyToOne
	@JoinColumn(name="agenda")
	private Agenda agendaBean;

	//bi-directional many-to-one association to Calendario
	@ManyToOne
	@JoinColumn(name="calendario")
	private Calendario calendarioBean;

	//bi-directional many-to-one association to Calendario
	@OneToMany(mappedBy="calendarioBean")
	private List<Calendario> calendarios;

	//bi-directional many-to-one association to Fechacalendario
	@OneToMany(mappedBy="calendarioBean")
	private List<Fechacalendario> fechacalendarios;

	public Calendario() {
	}

	public String getIdCalendario() {
		return this.idCalendario;
	}

	public void setIdCalendario(String idCalendario) {
		this.idCalendario = idCalendario;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Agenda getAgendaBean() {
		return this.agendaBean;
	}

	public void setAgendaBean(Agenda agendaBean) {
		this.agendaBean = agendaBean;
	}

	public Calendario getCalendarioBean() {
		return this.calendarioBean;
	}

	public void setCalendarioBean(Calendario calendarioBean) {
		this.calendarioBean = calendarioBean;
	}

	public List<Calendario> getCalendarios() {
		return this.calendarios;
	}

	public void setCalendarios(List<Calendario> calendarios) {
		this.calendarios = calendarios;
	}

	public List<Fechacalendario> getFechacalendarios() {
		return this.fechacalendarios;
	}

	public void setFechacalendarios(List<Fechacalendario> fechacalendarios) {
		this.fechacalendarios = fechacalendarios;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((idCalendario == null) ? 0 : idCalendario.hashCode());
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
		Calendario other = (Calendario) obj;
		if (idCalendario == null) {
			if (other.idCalendario != null)
				return false;
		} else if (!idCalendario.equals(other.idCalendario))
			return false;
		return true;
	}


}