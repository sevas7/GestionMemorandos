package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the tipodocumento database table.
 * 
 */
@Entity
public class Tipodocumento implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idTipoDoc;

	private String descripcion;

	private String nombre;

	//bi-directional many-to-one association to Documento
	@OneToMany(mappedBy="tipodocumento")
	private List<Documento> documentos;

	//bi-directional many-to-one association to Guia
	@ManyToOne
	@JoinColumn(name="guia")
	private Guia guiaBean;

	//bi-directional many-to-one association to Listachequeo
	@ManyToOne
	@JoinColumn(name="listachequeo")
	private Listachequeo listachequeoBean;

	//bi-directional many-to-one association to Orientacion
	@ManyToOne
	@JoinColumn(name="orientacion")
	private Orientacion orientacionBean;

	//bi-directional many-to-one association to Plantilla
	@ManyToOne
	@JoinColumn(name="plantilla")
	private Plantilla plantillaBean;

	public Tipodocumento() {
	}

	public String getIdTipoDoc() {
		return this.idTipoDoc;
	}

	public void setIdTipoDoc(String idTipoDoc) {
		this.idTipoDoc = idTipoDoc;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public List<Documento> getDocumentos() {
		return this.documentos;
	}

	public void setDocumentos(List<Documento> documentos) {
		this.documentos = documentos;
	}

	public Guia getGuiaBean() {
		return this.guiaBean;
	}

	public void setGuiaBean(Guia guiaBean) {
		this.guiaBean = guiaBean;
	}

	public Listachequeo getListachequeoBean() {
		return this.listachequeoBean;
	}

	public void setListachequeoBean(Listachequeo listachequeoBean) {
		this.listachequeoBean = listachequeoBean;
	}

	public Orientacion getOrientacionBean() {
		return this.orientacionBean;
	}

	public void setOrientacionBean(Orientacion orientacionBean) {
		this.orientacionBean = orientacionBean;
	}

	public Plantilla getPlantillaBean() {
		return this.plantillaBean;
	}

	public void setPlantillaBean(Plantilla plantillaBean) {
		this.plantillaBean = plantillaBean;
	}

}