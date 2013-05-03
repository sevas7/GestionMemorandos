package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the agenda database table.
 * 
 */
@Entity
@PrimaryKeyJoinColumn(name = "idAgenda")
public class Agenda extends Paquete implements Serializable {
	private static final long serialVersionUID = 1L;

//	@Id
//	private String idAgenda;

	private String descripcion;

	//bi-directional one-to-one association to Paquete
	@OneToOne
	@JoinColumn(name="idAgenda")
	private Paquete paquete;

	//bi-directional many-to-one association to Calendario
	@OneToMany(mappedBy="agendaBean")
	private List<Calendario> calendarios;

	public Agenda() {
	}

//	public String getIdAgenda() {
//		return this.idAgenda;
//	}
//
//	public void setIdAgenda(String idAgenda) {
//		this.idAgenda = idAgenda;
//	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Paquete getPaquete() {
		return this.paquete;
	}

	public void setPaquete(Paquete paquete) {
		this.paquete = paquete;
	}

	public List<Calendario> getCalendarios() {
		return this.calendarios;
	}

	public void setCalendarios(List<Calendario> calendarios) {
		this.calendarios = calendarios;
	}

}