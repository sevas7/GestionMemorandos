package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the palabraclave database table.
 * 
 */
@Entity
public class Palabraclave implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idPalabraClave;

	private String palabra;

	//bi-directional many-to-one association to Palabradocumento
	@OneToMany(mappedBy="palabraclave")
	private List<Palabradocumento> palabradocumentos;

	public Palabraclave() {
	}

	public String getIdPalabraClave() {
		return this.idPalabraClave;
	}

	public void setIdPalabraClave(String idPalabraClave) {
		this.idPalabraClave = idPalabraClave;
	}

	public String getPalabra() {
		return this.palabra;
	}

	public void setPalabra(String palabra) {
		this.palabra = palabra;
	}

	public List<Palabradocumento> getPalabradocumentos() {
		return this.palabradocumentos;
	}

	public void setPalabradocumentos(List<Palabradocumento> palabradocumentos) {
		this.palabradocumentos = palabradocumentos;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((idPalabraClave == null) ? 0 : idPalabraClave.hashCode());
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
		Palabraclave other = (Palabraclave) obj;
		if (idPalabraClave == null) {
			if (other.idPalabraClave != null)
				return false;
		} else if (!idPalabraClave.equals(other.idPalabraClave))
			return false;
		return true;
	}

}