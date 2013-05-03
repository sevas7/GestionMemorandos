package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the producto database table.
 * 
 */
@Entity
public class Producto implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idProducto;

	private String descripcion;

	private String nombre;

	private String ubicacionEnSistema;

	//bi-directional many-to-one association to Copia
	@OneToMany(mappedBy="productoBean")
	private List<Copia> copias;

	//bi-directional many-to-one association to Documento
	@ManyToOne
	@JoinColumn(name="documento")
	private Documento documentoBean;

	public Producto() {
	}

	public String getIdProducto() {
		return this.idProducto;
	}

	public void setIdProducto(String idProducto) {
		this.idProducto = idProducto;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getUbicacionEnSistema() {
		return this.ubicacionEnSistema;
	}

	public void setUbicacionEnSistema(String ubicacionEnSistema) {
		this.ubicacionEnSistema = ubicacionEnSistema;
	}

	public List<Copia> getCopias() {
		return this.copias;
	}

	public void setCopias(List<Copia> copias) {
		this.copias = copias;
	}

	public Documento getDocumentoBean() {
		return this.documentoBean;
	}

	public void setDocumentoBean(Documento documentoBean) {
		this.documentoBean = documentoBean;
	}

}