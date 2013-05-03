package vo;

import java.io.Serializable;
import javax.persistence.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the documento database table.
 * 
 */
@Entity
@DiscriminatorColumn(name="tipo")
@Inheritance(strategy = InheritanceType.JOINED)
public class Documento implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idDocumento;

	private String anexo;

	private String descripcion;

	private String edicion;

	private String estado;

	private String fechaCreacion;

	private String titulo;

	private String vigencia;
	
	private String comentarios;

	//bi-directional many-to-one association to Autordocumento
	@OneToMany(mappedBy="documentoBean")
	private List<Autordocumento> autordocumentos;

	//bi-directional many-to-one association to Contenido
	@OneToMany(mappedBy="documentoBean")
	private List<Contenido> contenidos;

	//bi-directional many-to-one association to Documento
	@ManyToOne
	@JoinColumn(name="documentobase")
	private Documento documento;

	//bi-directional many-to-one association to Documento
	@OneToMany(mappedBy="documento")
	private List<Documento> documentos;
	
	//bi-directional many-to-one association to Documento
	@OneToMany(mappedBy="documento")
	private List<Observacion> observaciones;

	//bi-directional many-to-one association to Orientacion
	@ManyToOne
	@JoinColumn(name="orientacion")
	private Orientacion orientacionBean;

	//bi-directional many-to-one association to Tablaretenciondocumental
	@ManyToOne
	@JoinColumn(name="tabladeretenciondocumental")
	private Tablaretenciondocumental tablaretenciondocumental;

	//bi-directional many-to-one association to Tipodocumento
	@ManyToOne
	@JoinColumn(name="tipoDocumento")
	private Tipodocumento tipodocumento;

	//bi-directional many-to-one association to Expedientedocumento
	@OneToMany(mappedBy="documentoBean")
	private List<Expedientedocumento> expedientedocumentos;

	//bi-directional one-to-one association to Guia
	@OneToOne(mappedBy="documento")
	private Guia guia;

	//bi-directional many-to-one association to Item
	@OneToMany(mappedBy="documentoBean")
	private List<Item> items;

	//bi-directional one-to-one association to Listachequeo
	@OneToOne(mappedBy="documento")
	private Listachequeo listachequeo;

	//bi-directional many-to-one association to Palabradocumento
	@OneToMany(mappedBy="documentoBean")
	private List<Palabradocumento> palabradocumentos;

	//bi-directional one-to-one association to Plantilla
	@OneToOne(mappedBy="documento")
	private Plantilla plantilla;

	//bi-directional many-to-one association to Producto
	@OneToMany(mappedBy="documentoBean")
	private List<Producto> productos;

	//bi-directional many-to-one association to Version
	@OneToMany(mappedBy="documentoBean")
	private List<Version> versions;
	
	@OneToMany(mappedBy="documento")
	private List<Anexo> anexos;

	public Documento() {
	}

	public String getIdDocumento() {
		return this.idDocumento;
	}

	public void setIdDocumento(String idDocumento) {
		this.idDocumento = idDocumento;
	}

	public String getAnexo() {
		return this.anexo;
	}

	public void setAnexo(String anexo) {
		this.anexo = anexo;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getEdicion() {
		return this.edicion;
	}

	public void setEdicion(String edicion) {
		this.edicion = edicion;
	}

	public String getEstado() {
		return this.estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getFechaCreacion() {
		return this.fechaCreacion;
	}

	public void setFechaCreacion(String fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	public String getTitulo() {
		return this.titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getVigencia() {
		return this.vigencia;
	}

	public void setVigencia(String vigencia) {
		this.vigencia = vigencia;
	}

	public List<Autordocumento> getAutordocumentos() {
		return this.autordocumentos;
	}

	public void setAutordocumentos(List<Autordocumento> autordocumentos) {
		this.autordocumentos = autordocumentos;
	}

	public List<Contenido> getContenidos() {
		return this.contenidos;
	}

	public void setContenidos(List<Contenido> contenidos) {
		this.contenidos = contenidos;
	}

	public Documento getDocumento() {
		return this.documento;
	}

	public void setDocumento(Documento documento) {
		this.documento = documento;
	}

	public List<Documento> getDocumentos() {
		return this.documentos;
	}

	public void setDocumentos(List<Documento> documentos) {
		this.documentos = documentos;
	}

	public Orientacion getOrientacionBean() {
		return this.orientacionBean;
	}

	public void setOrientacionBean(Orientacion orientacionBean) {
		this.orientacionBean = orientacionBean;
	}

	public Tablaretenciondocumental getTablaretenciondocumental() {
		return this.tablaretenciondocumental;
	}

	public void setTablaretenciondocumental(Tablaretenciondocumental tablaretenciondocumental) {
		this.tablaretenciondocumental = tablaretenciondocumental;
	}

	public Tipodocumento getTipodocumento() {
		return this.tipodocumento;
	}

	public void setTipodocumento(Tipodocumento tipodocumento) {
		this.tipodocumento = tipodocumento;
	}

	public List<Expedientedocumento> getExpedientedocumentos() {
		return this.expedientedocumentos;
	}

	public void setExpedientedocumentos(List<Expedientedocumento> expedientedocumentos) {
		this.expedientedocumentos = expedientedocumentos;
	}

	public Guia getGuia() {
		return this.guia;
	}

	public void setGuia(Guia guia) {
		this.guia = guia;
	}

	public List<Item> getItems() {
		return this.items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

	public Listachequeo getListachequeo() {
		return this.listachequeo;
	}

	public void setListachequeo(Listachequeo listachequeo) {
		this.listachequeo = listachequeo;
	}

	public List<Palabradocumento> getPalabradocumentos() {
		return this.palabradocumentos;
	}

	public void setPalabradocumentos(List<Palabradocumento> palabradocumentos) {
		this.palabradocumentos = palabradocumentos;
	}

	public Plantilla getPlantilla() {
		return this.plantilla;
	}

	public void setPlantilla(Plantilla plantilla) {
		this.plantilla = plantilla;
	}

	public List<Producto> getProductos() {
		return this.productos;
	}

	public void setProductos(List<Producto> productos) {
		this.productos = productos;
	}

	public List<Version> getVersions() {
		return this.versions;
	}

	public void setVersions(List<Version> versions) {
		this.versions = versions;
	}

	public List<Observacion> getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(List<Observacion> observaciones) {
		this.observaciones = observaciones;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((idDocumento == null) ? 0 : idDocumento.hashCode());
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
		Documento other = (Documento) obj;
		if (idDocumento == null) {
			if (other.idDocumento != null)
				return false;
		} else if (!idDocumento.equals(other.idDocumento))
			return false;
		return true;
	}
	
	public String getObservacionesDocumento()
	{
		if(observaciones!=null && observaciones.size()>=1 )
		{
			return observaciones.get(0).getObservacion();
		}
		
		return "Observacion";
	}
	
	public String getObservacion()
	{
		if(observaciones!=null && observaciones.size()>0 )
		{
			return "SI";
		}
		return "NO";
	}

	public String getComentarios() {
		return comentarios;
	}

	public void setComentarios(String comentarios) {
		this.comentarios = comentarios;
	}

	public List<Anexo> getAnexos() {
		return anexos;
	}

	public void setAnexos(List<Anexo> anexos) {
		this.anexos = anexos;
	}
	
	
	public String getFechaCorta() throws Exception
	{
		SimpleDateFormat format1 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		//SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yy HH:mm:ss");
		
		Date fecha = format1.parse(fechaCreacion);
		
		String hora = new SimpleDateFormat("HH").format(fecha);
		String minuto = new SimpleDateFormat("mm").format(fecha);
		String segundo = new SimpleDateFormat("ss").format(fecha);
		String dia = new SimpleDateFormat("dd").format(fecha);
		String diaSemana = new SimpleDateFormat("EEEE").format(fecha);
		String mes = new SimpleDateFormat("MMM").format(fecha);

		return diaSemana+" "+dia+"/"+mes+" "+hora+":"+minuto+":"+segundo;
	}
	

}