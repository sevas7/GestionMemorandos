package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the guia database table.
 * 
 */
@Entity
@PrimaryKeyJoinColumn(name = "idGuia")
public class Guia extends Documento implements Serializable {
	private static final long serialVersionUID = 1L;

//	@Id
//	private String idGuia;

	private String descripcion;

	//bi-directional one-to-one association to Documento
	@OneToOne
	@JoinColumn(name="idGuia")
	private Documento documento;

	//bi-directional many-to-one association to Tipodocumento
	@OneToMany(mappedBy="guiaBean")
	private List<Tipodocumento> tipodocumentos;

	public Guia() {
	}

//	public String getIdGuia() {
//		return this.idGuia;
//	}
//
//	public void setIdGuia(String idGuia) {
//		this.idGuia = idGuia;
//	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
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