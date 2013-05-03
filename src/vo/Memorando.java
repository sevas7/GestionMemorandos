package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the memorando database table.
 * 
 */
@Entity
@PrimaryKeyJoinColumn(name = "idMemorando")
public class Memorando extends Comunicacion implements Serializable {
	private static final long serialVersionUID = 1L;

//	@Id
//	private String idMemorando;
	
	private String numeroRadicado;

	//bi-directional many-to-one association to Actividad
	@OneToMany(mappedBy="memorandoBean")
	private List<Actividad> actividads;

	//bi-directional one-to-one association to Comunicacion
	@OneToOne
	@JoinColumn(name="idMemorando")
	private Comunicacion comunicacion;

	public Memorando() {
	}

//	public String getIdMemorando() {
//		return this.idMemorando;
//	}
//
//	public void setIdMemorando(String idMemorando) {
//		this.idMemorando = idMemorando;
//	}

	public List<Actividad> getActividads() {
		return this.actividads;
	}

	public void setActividads(List<Actividad> actividads) {
		this.actividads = actividads;
	}

	public Comunicacion getComunicacion() {
		return this.comunicacion;
	}

	public void setComunicacion(Comunicacion comunicacion) {
		this.comunicacion = comunicacion;
	}

	public String getNumeroRadicado() {
		return numeroRadicado;
	}

	public void setNumeroRadicado(String numeroRadicado) {
		this.numeroRadicado = numeroRadicado;
	}
	
	

}