package vo;

import java.io.Serializable;
import java.lang.String;
import java.util.List;

import javax.persistence.*;

/**
 * Entity implementation class for Entity: Conversacion
 *
 */
@Entity
public class Conversacion implements Serializable {

	   
	@Id
	private String idConversacion;
	
	@OneToMany(mappedBy="conversacion")
	private List<Mensaje> mensajes;
	
	@ManyToOne
	@JoinColumn(name="comunicacion")
	private Comunicacion comunicacion;
	
	private String nombreContacto;
	
	private String asunto;
	
	private String fechaConversacion; 
	
	private static final long serialVersionUID = 1L;

	public Conversacion() {
		super();
	}   
	public String getIdConversacion() {
		return this.idConversacion;
	}

	public void setIdConversacion(String idConversacion) {
		this.idConversacion = idConversacion;
	}
	
	public List<Mensaje> getMensajes() {
		return mensajes;
	}
	
	public void setMensajes(List<Mensaje> mensajes) {
		this.mensajes = mensajes;
	}
	
	public Comunicacion getComunicacion() {
		return comunicacion;
	}
	
	public void setComunicacion(Comunicacion comunicacion) {
		this.comunicacion = comunicacion;
	}
	
	public String getNombreContacto() {
		return nombreContacto;
	}
	
	public void setNombreContacto(String nombreContacto) {
		this.nombreContacto = nombreContacto;
	}
	
	public String getAsunto() {
		return asunto;
	}
	
	public void setAsunto(String asunto) {
		this.asunto = asunto;
	}
	
	public String getFechaConversacion() {
		return fechaConversacion;
	}
	
	public void setFechaConversacion(String fechaConversacion) {
		this.fechaConversacion = fechaConversacion;
	}
	
	
	
}
