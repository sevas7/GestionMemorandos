package vo;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the comunicaciondestinatario database table.
 * 
 */
@Entity
public class Comunicaciondestinatario implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idComunicacionDestinatario;

	//bi-directional many-to-one association to Comunicacion
	@ManyToOne
	@JoinColumn(name="comunicacion")
	private Comunicacion comunicacionBean;

	//bi-directional many-to-one association to Contacto
	@ManyToOne
	@JoinColumn(name="destinatario")
	private Contacto contacto;
	
	private String cc;

	public Comunicaciondestinatario() {
	}

	public String getIdComunicacionDestinatario() {
		return this.idComunicacionDestinatario;
	}

	public void setIdComunicacionDestinatario(String idComunicacionDestinatario) {
		this.idComunicacionDestinatario = idComunicacionDestinatario;
	}

	public Comunicacion getComunicacionBean() {
		return this.comunicacionBean;
	}

	public void setComunicacionBean(Comunicacion comunicacionBean) {
		this.comunicacionBean = comunicacionBean;
	}

	public Contacto getContacto() {
		return this.contacto;
	}

	public void setContacto(Contacto contacto) {
		this.contacto = contacto;
	}

	public String getCc() {
		return cc;
	}

	public void setCc(String cc) {
		this.cc = cc;
	}

}