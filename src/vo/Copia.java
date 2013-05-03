package vo;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the copia database table.
 * 
 */
@Entity
public class Copia implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idCopia;

	private String formato;

	//bi-directional many-to-one association to Deposito
	@ManyToOne
	@JoinColumn(name="deposito")
	private Deposito depositoBean;

	//bi-directional many-to-one association to Producto
	@ManyToOne
	@JoinColumn(name="producto")
	private Producto productoBean;

	public Copia() {
	}

	public String getIdCopia() {
		return this.idCopia;
	}

	public void setIdCopia(String idCopia) {
		this.idCopia = idCopia;
	}

	public String getFormato() {
		return this.formato;
	}

	public void setFormato(String formato) {
		this.formato = formato;
	}

	public Deposito getDepositoBean() {
		return this.depositoBean;
	}

	public void setDepositoBean(Deposito depositoBean) {
		this.depositoBean = depositoBean;
	}

	public Producto getProductoBean() {
		return this.productoBean;
	}

	public void setProductoBean(Producto productoBean) {
		this.productoBean = productoBean;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((idCopia == null) ? 0 : idCopia.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Copia other = (Copia) obj;
		if (idCopia == null) {
			if (other.idCopia != null)
				return false;
		} else if (!idCopia.equals(other.idCopia))
			return false;
		return true;
	}
	

}