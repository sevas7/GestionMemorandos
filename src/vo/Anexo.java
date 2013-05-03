package vo;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the anexo database table.
 * 
 */
@Entity
public class Anexo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idAnexo;

	private String ruta;
	
	@ManyToOne
	@JoinColumn(name="documento")
	private Documento documento;

	public Anexo() {
	}

	public String getIdAnexo() {
		return this.idAnexo;
	}

	public void setIdAnexo(String idAnexo) {
		this.idAnexo = idAnexo;
	}

	public String getRuta() {
		return this.ruta;
	}

	public void setRuta(String ruta) {
		this.ruta = ruta;
	}

	public Documento getDocumento() {
		return documento;
	}

	public void setDocumento(Documento documento) {
		this.documento = documento;
	}

}