package vo;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the item database table.
 * 
 */
@Entity
public class Item implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idItem;

	private String hlnt;

	@Lob
	private String texto;

	//bi-directional many-to-one association to Contenido
	@ManyToOne
	@JoinColumn(name="contenido")
	private Contenido contenidoBean;

	//bi-directional many-to-one association to Documento
	@ManyToOne
	@JoinColumn(name="documento")
	private Documento documentoBean;

	public Item() {
	}

	public String getIdItem() {
		return this.idItem;
	}

	public void setIdItem(String idItem) {
		this.idItem = idItem;
	}

	public String getHlnt() {
		return this.hlnt;
	}

	public void setHlnt(String hlnt) {
		this.hlnt = hlnt;
	}

	public String getTexto() {
		return this.texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

	public Contenido getContenidoBean() {
		return this.contenidoBean;
	}

	public void setContenidoBean(Contenido contenidoBean) {
		this.contenidoBean = contenidoBean;
	}

	public Documento getDocumentoBean() {
		return this.documentoBean;
	}

	public void setDocumentoBean(Documento documentoBean) {
		this.documentoBean = documentoBean;
	}

}