package vo;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the contactoquien database table.
 * 
 */
@Entity
public class Contactoquien implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idContactoQuien;

	//bi-directional many-to-one association to Contacto
	@ManyToOne
	@JoinColumn(name="contacto")
	private Contacto contactoBean;

	//bi-directional many-to-one association to Quien
	@ManyToOne
	@JoinColumn(name="quien")
	private Quien quienBean;

	public Contactoquien() {
	}

	public String getIdContactoQuien() {
		return this.idContactoQuien;
	}

	public void setIdContactoQuien(String idContactoQuien) {
		this.idContactoQuien = idContactoQuien;
	}

	public Contacto getContactoBean() {
		return this.contactoBean;
	}

	public void setContactoBean(Contacto contactoBean) {
		this.contactoBean = contactoBean;
	}

	public Quien getQuienBean() {
		return this.quienBean;
	}

	public void setQuienBean(Quien quienBean) {
		this.quienBean = quienBean;
	}

}