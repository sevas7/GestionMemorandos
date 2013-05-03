package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the orientacion database table.
 * 
 */
@Entity
public class Orientacion implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idOrientacion;

	private String descripcion;

	private String nombre;

	//bi-directional many-to-one association to Documento
	@OneToMany(mappedBy="orientacionBean")
	private List<Documento> documentos;

	//bi-directional many-to-one association to Tipodocumento
	@OneToMany(mappedBy="orientacionBean")
	private List<Tipodocumento> tipodocumentos;

	public Orientacion() {
	}

	public String getIdOrientacion() {
		return this.idOrientacion;
	}

	public void setIdOrientacion(String idOrientacion) {
		this.idOrientacion = idOrientacion;
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

	public List<Tipodocumento> getTipodocumentos() {
		return this.tipodocumentos;
	}

	public void setTipodocumentos(List<Tipodocumento> tipodocumentos) {
		this.tipodocumentos = tipodocumentos;
	}

}