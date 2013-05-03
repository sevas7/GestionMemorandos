package vo;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the expedientedocumento database table.
 * 
 */
@Entity
public class Expedientedocumento implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idExpDoc;

	//bi-directional many-to-one association to Documento
	@ManyToOne
	@JoinColumn(name="documento")
	private Documento documentoBean;

	//bi-directional many-to-one association to Expediente
	@ManyToOne
	@JoinColumn(name="expediente")
	private Expediente expedienteBean;

	public Expedientedocumento() {
	}

	public String getIdExpDoc() {
		return this.idExpDoc;
	}

	public void setIdExpDoc(String idExpDoc) {
		this.idExpDoc = idExpDoc;
	}

	public Documento getDocumentoBean() {
		return this.documentoBean;
	}

	public void setDocumentoBean(Documento documentoBean) {
		this.documentoBean = documentoBean;
	}

	public Expediente getExpedienteBean() {
		return this.expedienteBean;
	}

	public void setExpedienteBean(Expediente expedienteBean) {
		this.expedienteBean = expedienteBean;
	}

}