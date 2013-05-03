package vo;

import java.io.Serializable;
import java.lang.String;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: Mensaje
 *
 */
@Entity
@PrimaryKeyJoinColumn(name = "idMensaje")
public class Mensaje extends Comunicacion implements Serializable {

	private String respuestaA;
	
	@ManyToOne
	@JoinColumn(name="conversacion")
	private Conversacion conversacion;
	
	private static final long serialVersionUID = 1L;

	public Mensaje() {

	}   
	public String getRespuestaA() {
		return this.respuestaA;
	}

	public void setRespuestaA(String respuestaA) {
		this.respuestaA = respuestaA;
	}
	public Conversacion getConversacion() {
		return conversacion;
	}
	public void setConversacion(Conversacion conversacion) {
		this.conversacion = conversacion;
	}
   
	
}
