package bean;

import java.util.List;
import javax.annotation.ManagedBean;
import javax.ejb.EJB;
import vo.Actividad;
import negocio.GestionMemorandos;

@ManagedBean
public class ActividadBean {
	
	@EJB
	GestionMemorandos gestionMemorandos;
	
	Actividad actividad = new Actividad();
	
	public void registrarActividad()
	{
		gestionMemorandos.registrarActividad(actividad);
	}

	public List<Actividad> getActividades()
	{
		return gestionMemorandos.getActividades();
	}
	
	public Actividad getActividad() {
		return actividad;
	}

	public void setActividad(Actividad actividad) {
		this.actividad = actividad;
	}
	
	

}
