package vo;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the palabradocumento database table.
 * 
 */
@Entity
public class Palabradocumento implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idPalabraClaveDocumento;

	//bi-directional many-to-one association to Documento
	@ManyToOne
	@JoinColumn(name="documento")
	private Documento documentoBean;

	//bi-directional many-to-one association to Palabraclave
	@ManyToOne
	@JoinColumn(name="palabraClave")
	private Palabraclave palabraclave;

	public Palabradocumento() {
	}

	public String getIdPalabraClaveDocumento() {
		return this.idPalabraClaveDocumento;
	}

	public void setIdPalabraClaveDocumento(String idPalabraClaveDocumento) {
		this.idPalabraClaveDocumento = idPalabraClaveDocumento;
	}

	public Documento getDocumentoBean() {
		return this.documentoBean;
	}

	public void setDocumentoBean(Documento documentoBean) {
		this.documentoBean = documentoBean;
	}

	public Palabraclave getPalabraclave() {
		return this.palabraclave;
	}

	public void setPalabraclave(Palabraclave palabraclave) {
		this.palabraclave = palabraclave;
	}

}