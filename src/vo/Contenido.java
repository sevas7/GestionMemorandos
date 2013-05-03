package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the contenido database table.
 * 
 */
@Entity
public class Contenido implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idContenido;

	private String item;

	//bi-directional many-to-one association to Documento
	@ManyToOne
	@JoinColumn(name="documento")
	private Documento documentoBean;

	//bi-directional many-to-one association to Item
	@OneToMany(mappedBy="contenidoBean")
	private List<Item> items;

	public Contenido() {
	}

	public String getIdContenido() {
		return this.idContenido;
	}

	public void setIdContenido(String idContenido) {
		this.idContenido = idContenido;
	}

	public String getItem() {
		return this.item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public Documento getDocumentoBean() {
		return this.documentoBean;
	}

	public void setDocumentoBean(Documento documentoBean) {
		this.documentoBean = documentoBean;
	}

	public List<Item> getItems() {
		return this.items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

}