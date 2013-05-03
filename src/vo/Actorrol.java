package vo;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the actorrol database table.
 * 
 */
@Entity
public class Actorrol implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idRolActor;

	//bi-directional many-to-one association to Actor
	@ManyToOne
	@JoinColumn(name="actor")
	private Actor actorBean;

	//bi-directional many-to-one association to Rol
	@ManyToOne
	@JoinColumn(name="rol")
	private Rol rolBean;

	public Actorrol() {
	}

	public String getIdRolActor() {
		return this.idRolActor;
	}

	public void setIdRolActor(String idRolActor) {
		this.idRolActor = idRolActor;
	}

	public Actor getActorBean() {
		return this.actorBean;
	}

	public void setActorBean(Actor actorBean) {
		this.actorBean = actorBean;
	}

	public Rol getRolBean() {
		return this.rolBean;
	}

	public void setRolBean(Rol rolBean) {
		this.rolBean = rolBean;
	}

}