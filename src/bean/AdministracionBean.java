package bean;

import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;
import vo.Actor;
import vo.Contacto;
import vo.Contactoquien;
import vo.Estadocomunicacion;
import vo.Quien;
import vo.Rol;
import vo.Unidadorganizacional;
import negocio.GestionMemorandos;

@ManagedBean
public class AdministracionBean {

	@EJB
	GestionMemorandos gestionMemorandos;
	private Actor actor = new Actor();
	private Contacto contacto = new Contacto();
	private Rol rol = new Rol();
	private List<Rol> selectedRol;
	private List<Quien> selectedQuien;
	private Estadocomunicacion estadocomunicacion = new Estadocomunicacion();

	/**
	 * Registrar nuevo Actor en el sistema
	 */
	public void registrarActor()
	{
		gestionMemorandos.registrarActor(actor, selectedRol);

		//Mensaje registro
		FacesContext context = FacesContext.getCurrentInstance();  
		context.addMessage(null, new FacesMessage("Successful", actor.getNombre()));
	}

	/**
	 * Registrar nuevo Contacto en el sistema
	 */
	public String crearContacto()
	{
		try
		{
			contacto.setIdContacto(gestionMemorandos.obtenerID(gestionMemorandos.getContactos()));
			
			gestionMemorandos.registrarContacto(contacto);

			for (Quien quien : selectedQuien) 
			{
				Contactoquien cq = new Contactoquien();
				cq.setIdContactoQuien(gestionMemorandos.obtenerID(gestionMemorandos.getContactoquienes()));
				cq.setContactoBean(contacto);
				cq.setQuienBean(quien);
				gestionMemorandos.registrarContactoQuien(cq);
			}

		}catch(Exception e)
		{
			//Mensaje Fallido
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Error creando Contacto"));
		}

		//Mensaje registro
		FacesContext context = FacesContext.getCurrentInstance();  
		context.addMessage(null, new FacesMessage("Successful", ""+contacto.getNombre()));
		return "crearContacto";
	}

	/**
	 * Registrar nuevo rol en el sistema
	 */
	public String registrarRol()
	{
		try
		{
			rol.setIdQuien(gestionMemorandos.obtenerID(gestionMemorandos.getQuienes()));
			gestionMemorandos.registrarRol(rol);
			
		}catch(Exception e)
		{
			//Mensaje Fallido
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Error creando Rol"+e.getStackTrace()));
		}
		return "crearRol";
	}

	/**
	 * Eliminar un contacto 
	 */
	public void eliminarContacto()
	{
		/**
		 * COMPLETAR
		 */
	}

	/**
	 * Actualizar Actor
	 */
	public void actualizarActor()
	{
		//Mensaje Actualización 
		FacesContext context = FacesContext.getCurrentInstance();  
		context.addMessage(null, new FacesMessage("Successful", "Actualizado  "+actor.getNombre())); 
	}
	
	/**
	 * Actualizar Actor
	 */
	public void actualizarContacto()
	{
		gestionMemorandos.actualizarContacto(contacto);
		
		//Mensaje Actualización 
		FacesContext context = FacesContext.getCurrentInstance();  
		context.addMessage(null, new FacesMessage("Successful", "Actualizado  "+actor.getNombre())); 
	}

	/**
	 * Registrar un nuevo estado de una comunicación en el sistema
	 */
	public void registrarEstadoComunicacion()
	{
		estadocomunicacion.setIdEstadoComunicacion(gestionMemorandos.obtenerID(gestionMemorandos.getEstadosComunicacion()));
		gestionMemorandos.registrarEstadoComunicacion(estadocomunicacion);

		//Mensaje registro
		FacesContext context = FacesContext.getCurrentInstance();  
		context.addMessage(null, new FacesMessage("Successful"));
	}

	/**
	 * Obtener la lista de todos los Actores del sistema
	 * @return
	 */
	public List<Actor> getContactos()
	{
		return gestionMemorandos.getActores();
	}

	/**
	 * Obtener la lista de todos los Contactos del sistema
	 * @return
	 */
	public List<Contacto> getAllContactos()
	{
		return gestionMemorandos.getContactos();
	}

	
	/**
	 * Obtener la lista de "Quienes"
	 * @return
	 */
	public List<Quien> getQuienes()
	{
		return gestionMemorandos.getQuienes();
	}

	/**
	 * Obtener la lista de todas las Unidades Organizacionales del sistema
	 * @return
	 */
	public List<Unidadorganizacional> getUnidadesOrganizacionales()
	{
		return gestionMemorandos.getUnidadorganizacionales();
	}

	/**
	 * Obtener la lista de todos los Roles del sistema
	 * @return
	 */
	public List<Rol> getRoles()
	{
		return gestionMemorandos.getRoles();
	}

	public Actor getActor() {
		return actor;
	}

	public void setActor(Actor actor) {
		this.actor = actor;
	}

	public List<Rol> getSelectedRol() {
		return selectedRol;
	}

	public void setSelectedRol(List<Rol> selectedRol) {
		this.selectedRol = selectedRol;
	}

	public Estadocomunicacion getEstadocomunicacion() {
		return estadocomunicacion;
	}

	public void setEstadocomunicacion(Estadocomunicacion estadocomunicacion) {
		this.estadocomunicacion = estadocomunicacion;
	}

	public Rol getRol() {
		return rol;
	}

	public void setRol(Rol rol) {
		this.rol = rol;
	}

	public List<Quien> getSelectedQuien() {
		return selectedQuien;
	}

	public void setSelectedQuien(List<Quien> selectedQuien) {
		this.selectedQuien = selectedQuien;
	}

	public Contacto getContacto() {
		return contacto;
	}

	public void setContacto(Contacto contacto) {
		this.contacto = contacto;
	}

}