package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the plantilla database table.
 * 
 */
@Entity
@PrimaryKeyJoinColumn(name = "idPlantilla")
public class Plantilla extends Documento implements Serializable {
	private static final long serialVersionUID = 1L;

//	@Id
//	private String idPlantilla;

	private String formato;

	//bi-directional one-to-one association to Documento
	@OneToOne
	@JoinColumn(name="idPlantilla")
	private Documento documento;

	//bi-directional many-to-one association to Tipodocumento
	@OneToMany(mappedBy="plantillaBean")
	private List<Tipodocumento> tipodocumentos;

	public Plantilla() {
	}

//	public String getIdPlantilla() {
//		return this.idPlantilla;
//	}
//
//	public void setIdPlantilla(String idPlantilla) {
//		this.idPlantilla = idPlantilla;
//	}

	public String getFormato() {
		return this.formato;
	}

	public void setFormato(String formato) {
		this.formato = formato;
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