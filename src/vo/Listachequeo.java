package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the listachequeo database table.
 * 
 */
@Entity
@PrimaryKeyJoinColumn(name = "idListaChequeo")
public class Listachequeo extends Documento implements Serializable {
	private static final long serialVersionUID = 1L;

//	@Id
//	private String idListaChequeo;

	private String observacion;

	//bi-directional one-to-one association to Documento
	@OneToOne
	@JoinColumn(name="idListaChequeo")
	private Documento documento;

	//bi-directional many-to-one association to Tipodocumento
	@OneToMany(mappedBy="listachequeoBean")
	private List<Tipodocumento> tipodocumentos;

	public Listachequeo() {
	}

//	public String getIdListaChequeo() {
//		return this.idListaChequeo;
//	}
//
//	public void setIdListaChequeo(String idListaChequeo) {
//		this.idListaChequeo = idListaChequeo;
//	}

	public String getObservacion() {
		return this.observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}

	public Documento getDocumento() {
		return this.documento;
	}

	public void setDocumento(Documento documento) {
		this.documento = documento;
	}

	public List<Tipodocumento> getTipodocumentos() {
		return this.tipodocumentos;
	}

	public void setTipodocumentos(List<Tipodocumento> tipodocumentos) {
		this.tipodocumentos = tipodocumentos;
	}

}