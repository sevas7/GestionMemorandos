package vo;

import java.io.Serializable;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: GrupoContacto
 *
 */
@Entity
public class GrupoContacto implements Serializable {

	
	private static final long serialVersionUID = 1L;
	
	@Id
	private String idGrupoContacto;

	@ManyToOne
	@JoinColumn(name="contacto")
	private Contacto contacto;

	//bi-directional many-to-one association to Quien
	@ManyToOne
	@JoinColumn(name="grupo")
	private Grupo grupo;
	
	public GrupoContacto() {
		super();
	}

	public String getIdGrupoContacto() {
		return idGrupoContacto;
	}

	public void setIdGrupoContacto(String idGrupoContacto) {
		this.idGrupoContacto = idGrupoContacto;
	}

	public Contacto getContacto() {
		return contacto;
	}

	public void setContacto(Contacto contacto) {
		this.contacto = contacto;
	}

	public Grupo getGrupo() {
		return grupo;
	}

	public void setGrupo(Grupo grupo) {
		this.grupo = grupo;
	}
	
	
   
}
