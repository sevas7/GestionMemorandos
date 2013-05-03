package vo;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the autordocumento database table.
 * 
 */
@Entity
public class Autordocumento implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idAutorDoc;

	private String descripcionModificacion;

	//bi-directional many-to-one association to Actor
	@ManyToOne
	@JoinColumn(name="actor")
	private Actor actorBean;

	//bi-directional many-to-one association to Documento
	@ManyToOne
	@JoinColumn(name="documento")
	private Documento documentoBean;

	public Autordocumento() {
	}

	public String getIdAutorDoc() {
		return this.idAutorDoc;
	}

	public void setIdAutorDoc(String idAutorDoc) {
		this.idAutorDoc = idAutorDoc;
	}

	public String getDescripcionModificacion() {
		return this.descripcionModificacion;
	}

	public void setDescripcionModificacion(String descripcionModificacion) {
		this.descripcionModificacion = descripcionModificacion;
	}

	public Actor getActorBean() {
		return this.actorBean;
	}

	public void setActorBean(Actor actorBean) {
		this.actorBean = actorBean;
	}

	public Documento getDocumentoBean() {
		return this.documentoBean;
	}

	public void setDocumentoBean(Documento documentoBean) {
		this.documentoBean = documentoBean;
	}

}