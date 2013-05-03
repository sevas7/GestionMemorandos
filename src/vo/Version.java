package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the version database table.
 * 
 */
@Entity
public class Version implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idVersion;

	private String cuenta;

	private String descripcion;

	private String formato;

	//bi-directional many-to-one association to Documento
	@ManyToOne
	@JoinColumn(name="documento")
	private Documento documentoBean;

	//bi-directional many-to-one association to Version
	@ManyToOne
	@JoinColumn(name="version")
	private Version versionBean;

	//bi-directional many-to-one association to Version
	@OneToMany(mappedBy="versionBean")
	private List<Version> versions;

	public Version() {
	}

	public String getIdVersion() {
		return this.idVersion;
	}

	public void setIdVersion(String idVersion) {
		this.idVersion = idVersion;
	}

	public String getCuenta() {
		return this.cuenta;
	}

	public void setCuenta(String cuenta) {
		this.cuenta = cuenta;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getFormato() {
		return this.formato;
	}

	public void setFormato(String formato) {
		this.formato = formato;
	}

	public Documento getDocumentoBean() {
		return this.documentoBean;
	}

	public void setDocumentoBean(Documento documentoBean) {
		this.documentoBean = documentoBean;
	}

	public Version getVersionBean() {
		return this.versionBean;
	}

	public void setVersionBean(Version versionBean) {
		this.versionBean = versionBean;
	}

	public List<Version> getVersions() {
		return this.versions;
	}

	public void setVersions(List<Version> versions) {
		this.versions = versions;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((idVersion == null) ? 0 : idVersion.hashCode());
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
		Version other = (Version) obj;
		if (idVersion == null) {
			if (other.idVersion != null)
				return false;
		} else if (!idVersion.equals(other.idVersion))
			return false;
		return true;
	}

	
}