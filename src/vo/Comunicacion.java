package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the comunicacion database table.
 * 
 */
@Entity
@PrimaryKeyJoinColumn(name = "idComunicacion")
@Inheritance(strategy = InheritanceType.JOINED)
public class Comunicacion extends Documento implements Serializable {
	private static final long serialVersionUID = 1L;

	//	@Id
	//	private String idComunicacion;

	private String asunto;

	private String tipo;
	
	private String destinatariosCom;

	@Lob
	private String contenidoCom;


	//bi-directional one-to-one association to Circular
	@OneToOne(mappedBy="comunicacion")
	private Circular circular;


	//	//bi-directional one-to-one association to Circular
	//	@OneToOne(mappedBy="comunicacion")
	//	private ComunicacionInterna comunicacionInterna;

	//bi-directional many-to-one association to Contacto
	@ManyToOne
	@JoinColumn(name="remitente")
	private Contacto contacto;

	//bi-directional many-to-one association to Estadocomunicacion
	@ManyToOne
	@JoinColumn(name="estado")
	private Estadocomunicacion estadocomunicacion;

	//bi-directional many-to-one association to Fecha
	@ManyToOne
	@JoinColumn(name="fecha")
	private Fecha fechaBean;

	//bi-directional many-to-one association to Comunicaciondestinatario
	@OneToMany(mappedBy="comunicacionBean")
	private List<Comunicaciondestinatario> comunicaciondestinatarios;
	
	//bi-directional many-to-one association to Expedientedocumento
	@OneToMany(mappedBy="comunicacion")
	private List<Conversacion> conversacionBean;

	//bi-directional one-to-one association to Memorando
	@OneToOne(mappedBy="comunicacion")
	private Memorando memorando;

	private String leido;

	private String unidadOrganizacional;


	public Comunicacion() 
	{
		
	}

	//	public String getIdComunicacion() {
	//		return this.idComunicacion;
	//	}
	//
	//	public void setIdComunicacion(String idComunicacion) {
	//		this.idComunicacion = idComunicacion;
	//	}

	public String getAsunto() {
		return this.asunto;
	}

	public void setAsunto(String asunto) {
		this.asunto = asunto;
	}

	public String getContenidoCom() {
		return this.contenidoCom;
	}

	public void setContenidoCom(String contenidoCom) {
		this.contenidoCom = contenidoCom;
	}

	public Circular getCircular() {
		return this.circular;
	}

	public void setCircular(Circular circular) {
		this.circular = circular;
	}

	public Contacto getContacto() {
		return this.contacto;
	}

	public void setContacto(Contacto contacto) {
		this.contacto = contacto;
	}

	public Estadocomunicacion getEstadocomunicacion() {
		return this.estadocomunicacion;
	}

	public void setEstadocomunicacion(Estadocomunicacion estadocomunicacion) {
		this.estadocomunicacion = estadocomunicacion;
	}

	public Fecha getFechaBean() {
		return this.fechaBean;
	}

	public void setFechaBean(Fecha fechaBean) {
		this.fechaBean = fechaBean;
	}

	public List<Comunicaciondestinatario> getComunicaciondestinatarios() {
		return this.comunicaciondestinatarios;
	}

	public void setComunicaciondestinatarios(List<Comunicaciondestinatario> comunicaciondestinatarios) {
		this.comunicaciondestinatarios = comunicaciondestinatarios;
	}

	public Memorando getMemorando() {
		return this.memorando;
	}

	public void setMemorando(Memorando memorando) {
		this.memorando = memorando;
	}

	public String getLeido() {
		return leido;
	}

	public void setLeido(String leido) {
		this.leido = leido;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getUnidadOrganizacional() {
		return unidadOrganizacional;
	}

	public void setUnidadOrganizacional(String unidadOrganizacional) {
		this.unidadOrganizacional = unidadOrganizacional;
	}

	public String getDestinatariosCom() {
		return destinatariosCom;
	}

	public void setDestinatariosCom(String destinatariosCom) {
		this.destinatariosCom = destinatariosCom;
	}


}