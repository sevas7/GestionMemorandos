package bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;
import vo.Comunicacion;
import vo.Comunicaciondestinatario;
import vo.Contacto;
import vo.Conversacion;
import vo.Mensaje;
import vo.Palabraclave;
import vo.Unidadorganizacional;
import negocio.GestionMemorandos;

@ManagedBean
@SessionScoped
public class LoginBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@EJB
	private GestionMemorandos gestionMemorandos;
	private String autenticado;
	private String rol, uo;
	private String busqueda;
	private Comunicacion comunicacionBuscada;
	private String username, pass;

	Contacto contacto = new Contacto();

	private List<Comunicacion> listaComunicaciones = new ArrayList<Comunicacion>();
	private List<Comunicacion> bandejaDeSalida;
	private List<Comunicacion> bandejaUnidadOrganizacional;
	private List<Comunicacion> bandejaConstruidos;
	private List<Comunicacion> bandejaRedactados;
	private List<Comunicacion> bandejaElaborados;
	private List<Comunicacion> bandejaAprobados;
	private List<Comunicacion> dominio;
	private List<Contacto> contactosUnidadOrganizacional;
	
	private int contMensajes;

	/**
	 * Valida si el username y password son correctos. Además comprueba qué rol tiene la persona. 
	 * @return
	 */
	public String verificarUsuario()
	{
		listaComunicaciones = new ArrayList<Comunicacion>();
		contacto = gestionMemorandos.verificarContacto(username, pass);

		if(contacto!=null)
		{
			rol = gestionMemorandos.getRolContacto(contacto.getIdContacto()).toString();

			if(rol.equals("Decano") || rol.equals("Director") || rol.equals("Vicerrector"))
			{
				bandejaDeEntrada(contacto.getIdContacto());
				System.out.println(listaComunicaciones.size());
				bandejaDeSalida(contacto.getIdContacto());
				bandejaRegistrados(contacto.getIdContacto());
				bandejaElaboracion(contacto.getIdContacto());
				bandejaConstruidos(contacto.getIdContacto());
				bandejaRedaccion(contacto.getIdContacto());
				bandejaAprobados(contacto.getIdContacto());
				
				listarContactosUnidadOrganizacional(contacto.getIdContacto());
				
				autenticado="correctoJefe";
				contMensajes=listaComunicaciones.size();
				return autenticado;
			}

			if(rol.equals("Administrador"))
			{
				autenticado="correctoAdmin";
				return autenticado;
			}

			if(rol.equals("Secretaria"))
			{
				bandejaDeEntrada(contacto.getIdContacto());
				System.out.println(listaComunicaciones.size());
				bandejaDeSalida(contacto.getIdContacto());
				bandejaRegistrados(contacto.getIdContacto());
				bandejaElaboracion(contacto.getIdContacto());
				bandejaConstruidos(contacto.getIdContacto());
				bandejaRedactadosSecre(contacto.getIdContacto());
				bandejaAprobados(contacto.getIdContacto());
				
				listarContactosUnidadOrganizacional(contacto.getIdContacto());
				
				autenticado="correctoSecretaria";
				contMensajes=listaComunicaciones.size();
				return autenticado;
			}

			//WORKER
			if(rol.equals("Profesor") || rol.equals("Auxiliar") || rol.equals("Worker") )
			{
				bandejaDeEntrada(contacto.getIdContacto());
				bandejaDeSalida(contacto.getIdContacto());
				autenticado="correctoAux";
				contMensajes=listaComunicaciones.size();
				return autenticado;

			}
		}

		autenticado="incorrecto";
		FacesContext.getCurrentInstance().addMessage("login", new FacesMessage("Datos incorrectos"));
		return autenticado;
	}

	/**
	 * Obtiene todas las comunicaciones enviadas a un contacto.
	 * @param id
	 */
	public void bandejaDeEntrada(String id)
	{
		List<Mensaje> listaMensajes = new ArrayList<Mensaje>();
		List<Comunicaciondestinatario> bandejaE = gestionMemorandos.obtenerListaComunicacionesEnviadasAUnContacto(id);

		for (Comunicaciondestinatario aux : bandejaE) 
		{
			if(aux.getComunicacionBean().getTipo().equals("Mensaje"))
			{
				listaMensajes.add( (Mensaje) aux.getComunicacionBean());
			}
			else
			{
				if(aux.getComunicacionBean().getEstadocomunicacion().getEstado().equals("Enviado"))
				{
					listaComunicaciones.add( aux.getComunicacionBean());
				}
			}
		}

		for (Mensaje mensaje : conversacion(listaMensajes, id)) 
		{
			listaComunicaciones.add(mensaje);
		}

		getComunicacionesUnidadOrganizacional(id, listaComunicaciones);

		gestionMemorandos.eliminarElementosRepetidos(listaComunicaciones);

		gestionMemorandos.ordenar(listaComunicaciones);

	}

	/**
	 * Obtiene la bandeja de salida del contacto
	 * @param id
	 */
	public void bandejaDeSalida(String id)
	{
		bandejaDeSalida = new ArrayList<Comunicacion>();
		List<Comunicacion> bandejaS = gestionMemorandos.obtenerListaComunicacionesEnviadasPorUnContacto(id);

		for (Comunicacion aux : bandejaS) 
		{
			if(aux.getEstadocomunicacion().getEstado().equals("Enviado") && !aux.getTipo().equals("Mensaje"))

				bandejaDeSalida.add(aux);
		}

		for (Mensaje mensaje : agruparMensajesPorConversacion(id)) 
		{
			bandejaDeSalida.add(mensaje);
		}

		gestionMemorandos.eliminarElementosRepetidos(bandejaDeSalida);

		gestionMemorandos.ordenar(bandejaDeSalida);
	}

	/**
	 * Comunicaciones en estado Registrado de una unidad organizacional
	 */
	public void bandejaRegistrados(String id)
	{
		bandejaUnidadOrganizacional = new ArrayList<Comunicacion>();
		uo = gestionMemorandos.obtenerUnidadOrganizacionalContacto(id);
		List<Comunicacion> bandejaUO = gestionMemorandos.obtenerTodasLasComunicacionesRegistradas(uo);

		for(Comunicacion c : bandejaUO)
		{
			if(!c.getTipo().equals("Mensaje"))
				bandejaUnidadOrganizacional.add(c);
		}

		gestionMemorandos.ordenar(bandejaUnidadOrganizacional);
	}

	public List<Comunicacion> allComunicaciones()
	{
		List<Comunicacion> aux = new ArrayList<Comunicacion>();

		uo = gestionMemorandos.obtenerUnidadOrganizacionalContacto(contacto.getIdContacto());
		List<Comunicacion> bandejaUO = gestionMemorandos.obtenerTodasLasComunicacionesDeUnaUnidadOrganizacional(uo);

		for(Comunicacion c : bandejaUO)
		{
			if(!c.getTipo().equals("Mensaje") && !c.getEstadocomunicacion().getEstado().equals("Enviado"))
			{
				aux.add(c);
			}
		}

		gestionMemorandos.ordenarPrueba(aux);

		return aux;
	}

	/**
	 * Lista de comunicaciones en estado "Construcción"
	 * @param id
	 */
	public void bandejaConstruidos(String id)
	{
		bandejaConstruidos = new ArrayList<Comunicacion>();
		uo = gestionMemorandos.obtenerUnidadOrganizacionalContacto(id);
		List<Comunicacion> bandejaUO = gestionMemorandos.obtenerTodasLasComunicacionesEnConstruccion(uo);

		for(Comunicacion c : bandejaUO)
		{
			bandejaConstruidos.add(c);
		}

		gestionMemorandos.ordenar(bandejaConstruidos);
	}

	/**
	 * Lista de comunicaciones en estado "Redacción"
	 * @param id
	 */
	public void bandejaRedaccion(String id)
	{
		bandejaRedactados = new ArrayList<Comunicacion>();
		uo = gestionMemorandos.obtenerUnidadOrganizacionalContacto(id);
		List<Comunicacion> bandejaUO = gestionMemorandos.obtenerTodasLasComunicacionesRedactadas(uo);

		for(Comunicacion c : bandejaUO)
		{
			bandejaRedactados.add(c);
		}

		gestionMemorandos.ordenar(bandejaRedactados);
	}

	/**
	 * Lista de comunicaciones en estado "Redacción"
	 * @param id
	 */
	public void bandejaRedactadosSecre(String id)
	{
		bandejaRedactados = new ArrayList<Comunicacion>();
		uo = gestionMemorandos.obtenerUnidadOrganizacionalContacto(id);
		List<Comunicacion> bandejaUO = gestionMemorandos.obtenerTodasLasComunicacionesEnRedaccion(uo);

		for(Comunicacion c : bandejaUO)
		{
			//if(!c.getEstadocomunicacion().getEstado().equals("Redactado"))
			//{
				bandejaRedactados.add(c);
			//}
		}

		gestionMemorandos.ordenar(bandejaRedactados);
	}

	/**
	 * Lista de comunicaciones en estado "Elaboración"
	 * @param id
	 */
	public void bandejaElaboracion(String id)
	{
		bandejaElaborados = new ArrayList<Comunicacion>();
		uo = gestionMemorandos.obtenerUnidadOrganizacionalContacto(id);
		List<Comunicacion> bandejaUO = gestionMemorandos.obtenerTodasLasComunicacionesDeUnaUnidadOrganizacional(uo);

		for(Comunicacion c : bandejaUO)
		{
			if(!c.getTipo().equals("Mensaje") && c.getEstadocomunicacion().getEstado().equals("Elaborado") || c.getEstadocomunicacion().getEstado().equals("En Elaboracion"))
			{
				bandejaElaborados.add(c);
			}
		}

		gestionMemorandos.ordenar(bandejaElaborados);
	}

	/**
	 * Lista de comunicaciones en estado "Aprobado"
	 * @param id
	 */
	public void bandejaAprobados(String id)
	{
		bandejaAprobados = new ArrayList<Comunicacion>();
		uo = gestionMemorandos.obtenerUnidadOrganizacionalContacto(id);
		List<Comunicacion> bandejaUO = gestionMemorandos.obtenerTodasLasComunicacionesDeUnaUnidadOrganizacional(uo);

		for(Comunicacion c : bandejaUO)
		{
			if(!c.getTipo().equals("Mensaje") && c.getEstadocomunicacion().getEstado().equals("Aprobado") )
			{
				bandejaAprobados.add(c);
			}
		}

		gestionMemorandos.ordenar(bandejaAprobados);
	}


	/**
	 * Comunicaciones enviadas a una unidad organizacional, estas deben ser visibles por todos
	 * los contactos de dicha unidad organizacional. EJ: Circulares.
	 * @param id
	 * @param lista
	 */
	public void getComunicacionesUnidadOrganizacional(String id, List<Comunicacion> lista)
	{
		List<Comunicaciondestinatario> aux = new ArrayList<Comunicaciondestinatario>();

		for (Unidadorganizacional quien : gestionMemorandos.getUnidadorganizacionales()) 
		{
			if(quien.getIdQuien().equals(gestionMemorandos.obtenerUnidadOrganizacionalContacto(id)))
			{
				//Es Null si no existe un Contacto que represente a la unidad organizacional
				Object idContacto = gestionMemorandos.idContactoDeUnidadOrganizacional(quien.getIdQuien());

				if(idContacto!=null)
				{
					aux.addAll(gestionMemorandos.obtenerListaComunicacionesEnviadasAUnContacto(idContacto.toString()));
				}
				break;
			}
		}

		if(aux!=null)
		{
			for (Comunicaciondestinatario comunicaciondestinatario : aux) 
			{
				if(comunicaciondestinatario.getComunicacionBean().getEstadocomunicacion().getEstado().equals("Enviado"))
				{
					lista.add(comunicaciondestinatario.getComunicacionBean());
				}
			}
		}
	}

	/**
	 * Agrupar mensajes por conversación y mostrar el más reciente en la bandeja de salida
	 * @param mensajes
	 * @return
	 */
	public List<Mensaje> agruparMensajesPorConversacion(String id)
	{
		List<Conversacion> conversaciones = gestionMemorandos.agruparMensajesPorConversacion(id);
		List<Mensaje> salida = new ArrayList<Mensaje>();

		for (Conversacion aux : conversaciones) 
		{
			List<Mensaje> msj = gestionMemorandos.obtenerMensajesConversacion(aux.getIdConversacion(), id);
			gestionMemorandos.ordenarPrueba(msj);
			salida.add(msj.get(0));
		}

		return salida;
	}

	/**
	 * Agrupar mensajes por conversación y mostrar el más reciente en la bandeja de entrada
	 * @param mensajes, id
	 * @return
	 */
	public List<Mensaje> conversacion(List<Mensaje> mensajes, String id)
	{
		List<Mensaje> listaAuxliar = new ArrayList<Mensaje>();
		List<String> aux = new ArrayList<String>();

		for (Mensaje mensaje : mensajes) 
		{
			aux.add(mensaje.getConversacion().getIdConversacion());
		}

		gestionMemorandos.eliminarElementosRepetidos(aux);

		for (String conversacion : aux) 
		{
			List<Object> lista = gestionMemorandos.obtenerMensajesConversacionContacto(conversacion, id);

			listaAuxliar.add( gestionMemorandos.buscarMensaje(lista.get(0).toString()) );
		}

		return listaAuxliar;
	}


	/**
	 * Cierra sesión y reinicia todos los objetos contenedores auxiliares.
	 * @return
	 */
	public void cerrarSesion()
	{
		HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(true);
		session.removeAttribute("LoginBean");

		//--- Borrar los auxiliares ---
		contacto = new Contacto();
		listaComunicaciones = new ArrayList<Comunicacion>();
		bandejaDeSalida = new ArrayList<Comunicacion>();
		bandejaUnidadOrganizacional = new ArrayList<Comunicacion>();
		bandejaConstruidos = new ArrayList<Comunicacion>();
		bandejaElaborados = new ArrayList<Comunicacion>();
		bandejaRedactados = new ArrayList<Comunicacion>();
		bandejaAprobados = new ArrayList<Comunicacion>();
		dominio = new ArrayList<Comunicacion>();
		contactosUnidadOrganizacional = new ArrayList<Contacto>();

		//return "cerrar";
	}

	/**
	 * Recuperar contraseña
	 */
	public String enviarContrasenia()
	{
		contacto = gestionMemorandos.buscarContacto(contacto.getUsername());

		CorreoBean correo = new CorreoBean();
		try {
			correo.enviarCorreo(contacto.getEmail(), "Hola "+contacto.getNombre()+", Su contraseña es: "+contacto.getPassword());
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage("La contraseña ha sido enviada a su correo electrónico"));
		} 
		catch (Exception e) 
		{
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo salió mal"));
		}
		return "olvidoContrasenia";
	}

	/**
	 * Cambiar contraseña de un contacto
	 * @return
	 */
	public String cambiarPassword()
	{
		contacto.setPassword(pass);
		gestionMemorandos.actualizarContacto(contacto);

		return "cambioPass";
	}

	/**
	 * Buscar una comunicación en su bandeja de entrada, salida y comunicaciones guardadas
	 * @return
	 */
	public String buscarComunicacion()
	{
		List<Comunicacion> lista = new ArrayList<Comunicacion>();
		dominio = new ArrayList<Comunicacion>();

		lista.addAll(bandejaDeSalida);
		lista.addAll(listaComunicaciones);

		if(!rol.equals("Worker"))
		{
			if(bandejaUnidadOrganizacional!=null)
			{
				lista.addAll(bandejaUnidadOrganizacional);
			}

			if(bandejaElaborados!=null)
			{
				lista.addAll(bandejaElaborados);
			}

			if(bandejaConstruidos!=null)
			{
				lista.addAll(bandejaConstruidos);
			}

			if(bandejaRedactados!=null)
			{
				lista.addAll(bandejaRedactados);
			}

			if(bandejaAprobados!=null)
			{
				lista.addAll(bandejaAprobados);	
			}
		}

		gestionMemorandos.eliminarElementosRepetidos(lista);

		for (Comunicacion comunicacion : lista) 
		{
			List<Contacto> destinatarios = gestionMemorandos.obtenerDestinatariosComunicacion(comunicacion.getIdDocumento());
			List<Palabraclave> palalabrasClaves = gestionMemorandos.listarPalabrasClavesDocumento(comunicacion.getIdDocumento());

			for (Contacto contacto : destinatarios) 
			{
				if(contacto.getNombre().toLowerCase().contains(busqueda.toLowerCase()) || contacto.getDescripcion().toLowerCase().contains(busqueda.toLowerCase()) )
				{
					dominio.add(comunicacion);
				}
			}

			for (Palabraclave pc : palalabrasClaves) 
			{
				if( pc.getPalabra().toLowerCase().equals(busqueda.toLowerCase()) )
				{
					dominio.add(comunicacion);
				}
			}

			if(comunicacion.getContacto().getNombre()!=null)
			{
				if(comunicacion.getContacto().getNombre().toLowerCase().contains(busqueda.toLowerCase()))
					dominio.add(comunicacion);
			}

			if(comunicacion.getContacto().getDescripcion()!=null)
			{
				if(comunicacion.getContacto().getDescripcion().toLowerCase().contains(busqueda.toLowerCase()))
					dominio.add(comunicacion);
			}

			if(comunicacion.getFechaCreacion()!=null)
			{
				if(comunicacion.getFechaCreacion().toString().toLowerCase().contains(busqueda.toLowerCase()))
					dominio.add(comunicacion);
			}

			if(comunicacion.getEstadocomunicacion().getEstado()!=null)
			{
				if(comunicacion.getEstadocomunicacion().getEstado().toLowerCase().contains(busqueda.toLowerCase()) || busqueda.toLowerCase().equals(comunicacion.getEstadocomunicacion().getEstado().toLowerCase()))
					dominio.add(comunicacion);
			}

			if(comunicacion.getAsunto()!=null)
			{
				if( comunicacion.getAsunto().toLowerCase().contains(busqueda.toLowerCase()) || busqueda.toLowerCase().contains(comunicacion.getAsunto().toLowerCase()) )
					dominio.add(comunicacion);
			}

			if(comunicacion.getTipo()!=null)
			{
				if(comunicacion.getTipo().toLowerCase().contains(busqueda.toLowerCase()) || comunicacion.getTipo().toLowerCase().equals(busqueda.toLowerCase()) )
					dominio.add(comunicacion);
			}

			if(comunicacion.getContenidoCom()!=null)
			{
				if(comunicacion.getContenidoCom().toLowerCase().contains(busqueda.toLowerCase()) || busqueda.toLowerCase().contains(comunicacion.getContenidoCom().toLowerCase()) )
					dominio.add(comunicacion);
			}

			if(comunicacion.getIdDocumento()!=null)
			{
				if( comunicacion.getIdDocumento().equals(busqueda) )
				{
					dominio.add(comunicacion);
				}
			}

		}

		gestionMemorandos.eliminarElementosRepetidos(dominio);
		gestionMemorandos.ordenar(dominio);
		busqueda="";

		return "busqueda";
	}

	/**
	 * COMPLETAR 
	 * @return
	 */
	public String buscarComunicacionAvanzada()
	{

		return "busquedaAvanzada";

	}

	/**
	 * Actualizar las bandejas (entrada, salida, registrados) de un contacto
	 */
	public void actualizar()
	{
		String id = contacto.getIdContacto();

		listaComunicaciones = new ArrayList<Comunicacion>();
		bandejaDeSalida = new ArrayList<Comunicacion>();
		bandejaUnidadOrganizacional = new ArrayList<Comunicacion>();
		bandejaConstruidos = new ArrayList<Comunicacion>();
		bandejaElaborados = new ArrayList<Comunicacion>();
		bandejaRedactados = new ArrayList<Comunicacion>();
		bandejaAprobados = new ArrayList<Comunicacion>();

		bandejaDeEntrada(id);
		bandejaDeSalida(id);
		bandejaRegistrados(id);

		bandejaConstruidos(id);
		bandejaElaboracion(id);
		bandejaAprobados(id);
		
		if(rol.equals("Decano") || rol.equals("Director") || rol.equals("Vicerrector"))
		{
			bandejaRedaccion(id);
		}

		if(rol.equals("Secretaria"))
		{
			bandejaRedactadosSecre(id);
		}

	}
	
	public void notificarComunicacion(){
		if (contMensajes<listaComunicaciones.size()&&autenticado!=null) {
			FacesContext context = FacesContext.getCurrentInstance();

			context.addMessage(null, new FacesMessage("Mensaje Nuevo",
					"Has Recibo un mensaje nuevo"));
			contMensajes=listaComunicaciones.size();
		}
	
	}

	/**
	 * Lista de contactos de una unidad organizacional
	 * @param id
	 * @return
	 */
	public List<Contacto> listarContactosUnidadOrganizacional(String id)
	{
		String uo = gestionMemorandos.obtenerUnidadOrganizacionalContacto(id);
		
		List<Object> lista = gestionMemorandos.listarContactosDeUnidadOrganizacional(uo);
		contactosUnidadOrganizacional = new ArrayList<Contacto>();
		
		for (Object object : lista) 
		{
			Contacto c = gestionMemorandos.buscarContactoID(object.toString());
			
			if(!c.getIdContacto().equals(contacto.getIdContacto()))
			{
				contactosUnidadOrganizacional.add(c);
			}
		}
		
		return contactosUnidadOrganizacional;
	}

	public List<Comunicacion> getListaComunicaciones() {
		return listaComunicaciones;
	}

	public void setListaComunicaciones(List<Comunicacion> listaComunicaciones) {
		this.listaComunicaciones = listaComunicaciones;
	}

	public Contacto getContacto() {
		return contacto;
	}

	public void setContacto(Contacto contacto) {
		this.contacto = contacto;
	}

	public List<Comunicacion> getBandejaDeSalida() {
		return bandejaDeSalida;
	}

	public void setBandejaDeSalida(List<Comunicacion> bandejaDeSalida) {
		this.bandejaDeSalida = bandejaDeSalida;
	}

	public List<Comunicacion> getBandejaUnidadOrganizacional() {
		return bandejaUnidadOrganizacional;
	}

	public void setBandejaUnidadOrganizacional(
			List<Comunicacion> bandejaUnidadOrganizacional) {
		this.bandejaUnidadOrganizacional = bandejaUnidadOrganizacional;
	}

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	public String getBusqueda() {
		return busqueda;
	}

	public void setBusqueda(String busqueda) {
		this.busqueda = busqueda;
	}

	public List<Comunicacion> getDominio() {
		return dominio;
	}

	public void setDominio(List<Comunicacion> dominio) {
		this.dominio = dominio;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public Comunicacion getComunicacionBuscada() {
		return comunicacionBuscada;
	}

	public void setComunicacionBuscada(Comunicacion comunicacionBuscada) {
		this.comunicacionBuscada = comunicacionBuscada;
	}

	public String getUo() 
	{
		return uo;
	}

	public void setUo(String uo) {
		this.uo = uo;
	}

	public List<Comunicacion> getBandejaConstruidos() {
		return bandejaConstruidos;
	}

	public void setBandejaConstruidos(List<Comunicacion> bandejaConstruidos) {
		this.bandejaConstruidos = bandejaConstruidos;
	}

	public List<Comunicacion> getBandejaRedactados() {
		return bandejaRedactados;
	}

	public void setBandejaRedactados(List<Comunicacion> bandejaRedactados) {
		this.bandejaRedactados = bandejaRedactados;
	}

	public List<Comunicacion> getBandejaElaborados() {
		return bandejaElaborados;
	}

	public void setBandejaElaborados(List<Comunicacion> bandejaElaborados) {
		this.bandejaElaborados = bandejaElaborados;
	}

	public List<Comunicacion> getBandejaAprobados() {
		return bandejaAprobados;
	}

	public void setBandejaAprobados(List<Comunicacion> bandejaAprobados) {
		this.bandejaAprobados = bandejaAprobados;
	}

	public List<Contacto> getContactosUnidadOrganizacional() {
		return contactosUnidadOrganizacional;
	}

	public void setContactosUnidadOrganizacional(
			List<Contacto> contactosUnidadOrganizacional) {
		this.contactosUnidadOrganizacional = contactosUnidadOrganizacional;
	}

}