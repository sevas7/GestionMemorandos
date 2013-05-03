package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the tablaretenciondocumental database table.
 * 
 */
@Entity
public class Tablaretenciondocumental implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idTabla;

	//bi-directional many-to-one association to Documento
	@OneToMany(mappedBy="tablaretenciondocumental")
	private List<Documento> documentos;

	//bi-directional many-to-one association to Seriedocumental
	@OneToMany(mappedBy="tablaretenciondocumental")
	private List<Seriedocumental> seriedocumentals;

	public Tablaretenciondocumental() {
	}

	public String getIdTabla() {
		return this.idTabla;
	}

	public void setIdTabla(String idTabla) {
		this.idTabla = idTabla;
	}

	public List<Documento> getDocumentos() {
		return this.documentos;
	}

	public void setDocumentos(List<Documento> documentos) {
		this.documentos = documentos;
	}

	public List<Seriedocumental> getSeriedocumentals() {
		return this.seriedocumentals;
	}

	public void setSeriedocumentals(List<Seriedocumental> seriedocumentals) {
		this.seriedocumentals = seriedocumentals;
	}

}