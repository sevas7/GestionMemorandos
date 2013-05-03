package bean;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.activation.MimetypesFileTypeMap;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;

import vo.Anexo;
import vo.Circular;
import vo.Comunciacioninterna;
import vo.Comunicacion;
import vo.Comunicaciondestinatario;
import vo.Contacto;
import vo.Conversacion;
import vo.Documento;
import vo.Estadocomunicacion;
import vo.Expediente;
import vo.Expedientedocumento;
import vo.Memorando;
import vo.Mensaje;
import vo.Palabraclave;
import vo.Palabradocumento;
import negocio.GestionMemorandos;

@ManagedBean
@SessionScoped
public class ComunicacionBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@EJB
	GestionMemorandos gestionMemorandos;
	private Comunicacion comunicacion = new Comunicacion();

	//private List<Contacto> selectedContactos;
	private List<Mensaje> conversacion;
	private List<String> selectedPalabraClave;
	private List<String> destinatarios, cc;
	private String rutaComunicacion;
	private String comentario;
	private String expedientesCom;
	private Comunicacion selectedComunicacion, aux, comunicacionReenvio;
	private Conversacion selectedConversacion;
	private Expediente expediente = new Expediente();
	private Expediente expediente2 = new Expediente();
	private String tab = "0";
	private Contacto selectedContacto;

	private UploadedFile file;  
	private String destination="../../../temporal/"; //ruta para guardar anexos temporalmente
	private List<Anexo> rutaAnexo; 
	//	private boolean existeAnexo = true;

	@ManagedProperty(value="#{loginBean}") 
	LoginBean loginBean;
	
	private Anexo anexos;

	public void actualizar()
	{
		loginBean.actualizar();
		//		comunicacion = new Comunicacion();
		//		selectedComunicacion = null;
		//		selectedConversacion = new Conversacion();
		//		selectedContacto = new Contacto();

		limpiar();

		tab = "0";
	}

	
	public String reenviarComunicacion(){
		
		Contacto c = loginBean.getContacto();

		try
		{
			Comunciacioninterna comI =(Comunciacioninterna) comunicacionReenvio;
			comI.setFechaCreacion(obtenerFecha());
			comI.setAsunto(comunicacionReenvio.getAsunto());
			comI.setContenidoCom(comunicacionReenvio.getContenidoCom());
			comI.setContacto(c);
			comI.setLeido("NO");
			comI.setTipo("Comunicacion interna");
			comI.setAnexos(rutaAnexo);

			String uo = gestionMemorandos.obtenerUnidadOrganizacionalContacto(c.getIdContacto());
			comI.setUnidadOrganizacional(uo);

			//Estado: Aprobado
			Estadocomunicacion estado = gestionMemorandos.getEstado("Enviado");
			System.out.println("aqui");
			comI.setDestinatariosCom( destinatariosParaLaComunicacion() );

			comI.setEstadocomunicacion( estado );
			comunicacion = comI;

			List<Contacto> lC = obtenerListaContactosParaComunicacion();

			gestionMemorandos.registrarComunicacionInterna(comI, lC, rutaAnexo);

			//--------------------------

			registrarPalabrasClaves(comunicacion);

			if(expediente!=null)
			{
				registrarComunicacionEnExpediente(comunicacion);
			}
			registrarDestinatariosConCopiaDeUnaComunicacion(comI); //REVISAR

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Comunicación enviada satisfactoriamente"));
			//------------------- ------- ---------------------

			limpiar();
			actualizar();
			return "comunicacionAprobada";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo salió mal :("));
			//------------------- ------- ---------------------
		}

		//limpiar();

		return "algoSalioMal";
	}
	
	/**
	 * Volver atrás en la lectura de una conversación asociada a una comunicación
	 */
	public void atras()
	{
		String estado = selectedComunicacion.getEstadocomunicacion().getEstado();
		FacesContext ctx = FacesContext.getCurrentInstance();
		ExternalContext extContext = ctx.getExternalContext();
		String url = "";
		tab = "1";
		String rol = loginBean.getRol();
		selectedConversacion = new Conversacion();

		String tipo = selectedComunicacion.getTipo();

		if(tipo.equals("Memorando"))
		{
			if(estado.equals("Registrado"))
			{
				if(rol.equals("Director") || rol.equals("Decano") || rol.equals("Vicerrector"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/edicionJ.xhtml")); 
				}

				if(rol.equals("Secretaria") )
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/edicionSecre.xhtml")); 
				}
			}

			if(estado.equals("Elaborado"))
			{

				if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/elaborarComunicacion.xhtml")); 
					//extContext.redirect(url);

				}
				if(loginBean.getRol().equals("Secretaria"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/construirComunicacionS.xhtml")); 
					//extContext.redirect(url);
				}
			}

			if(estado.equals("Construido"))
			{

				if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/construirComunicacionJ.xhtml")); 
					//extContext.redirect(url);

				}
				if(loginBean.getRol().equals("Secretaria"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/redactarComunicacionS.xhtml")); 
					//extContext.redirect(url);
				}
			}

			if(estado.equals("En Construccion"))
			{

				if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/construirComunicacion.xhtml")); 
					//extContext.redirect(url);

				}
				if(loginBean.getRol().equals("Secretaria"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/construirComunicacionS.xhtml")); 
					//extContext.redirect(url);
				}
			}

			if(estado.equals("Redactado"))
			{

				if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/aprobarComunicacion.xhtml")); 
					//extContext.redirect(url);
				}

			}

			if(estado.equals("En Redaccion"))
			{

				if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/redactarComunicacion.xhtml")); 
					//extContext.redirect(url);

				}
				if(loginBean.getRol().equals("Secretaria"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/redactarComunicacionS.xhtml")); 
					//extContext.redirect(url);
				}
			}

			if(estado.equals("Aprobado"))
			{

				if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/enviarComunicacion.xhtml")); 
					//extContext.redirect(url);

				}
				if(loginBean.getRol().equals("Secretaria"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/enviarComunicacionS.xhtml")); 
					//extContext.redirect(url);
				}
			}
		}

		if(tipo.equals("Comunicacion interna"))
		{

			if(estado.equals("Registrado"))
			{
				if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/edicionJ1.xhtml")); 
					//extContext.redirect(url);

				}
				if(loginBean.getRol().equals("Secretaria"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/edicionSecre1.xhtml")); 
					//extContext.redirect(url);
				}
			}

			if(estado.equals("Elaborado"))
			{
				if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/construirCom1.xhtml")); 
					//extContext.redirect(url);

				}
				if(loginBean.getRol().equals("Secretaria"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/construirCom1S.xhtml")); 
					//extContext.redirect(url);
				}
			}

			if(estado.equals("Construido"))
			{
				if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/redactarCom1.xhtml")); 
					//extContext.redirect(url);

				}
				if(loginBean.getRol().equals("Secretaria"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/redactarCom1S.xhtml")); 
					//extContext.redirect(url);
				}
			}

			if(estado.equals("En Redaccion"))
			{
				if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/redactarCom1.xhtml")); 
					//extContext.redirect(url);

				}
				if(loginBean.getRol().equals("Secretaria"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/redactarCom1S.xhtml")); 
					//extContext.redirect(url);
				}
			}

		}

		try 
		{
			extContext.redirect(url);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

	/**
	 * Registrar Circular
	 * @return
	 */
	public String registrarCircular()
	{
		Contacto c = loginBean.getContacto();

		try
		{
			Circular circular = new Circular();
			circular.setFechaCreacion(obtenerFecha());
			circular.setAsunto(comunicacion.getAsunto());
			circular.setContenidoCom(comunicacion.getContenidoCom());
			circular.setContacto(c);
			circular.setLeido("NO");
			circular.setTipo("Circular");
			circular.setAnexos(rutaAnexo);

			String uo = gestionMemorandos.obtenerUnidadOrganizacionalContacto(c.getIdContacto());
			circular.setUnidadOrganizacional(uo);

			//Estado registrado
			circular.setEstadocomunicacion(gestionMemorandos.getEstadosComunicacion().get(0));
			circular.setDestinatariosCom( destinatariosParaLaComunicacion() );
			comunicacion = circular;

			List<Contacto> lC = obtenerListaContactosParaComunicacion();

			gestionMemorandos.registrarCircular(circular, lC);

			registrarPalabrasClaves(comunicacion);


			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Successful"));
			//------------------- ------- ---------------------

			limpiar();
			loginBean.actualizar();
			return "correctoCom";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo salió mal"));
			//------------------- ------- ---------------------
		}

		limpiar();

		return "algoSalioMal";
	}

	/**
	 * Enviar Circular
	 * @return
	 */
	public String enviarCircular()
	{
		Contacto c = loginBean.getContacto();

		try
		{
			Circular circular = new Circular();
			circular.setFechaCreacion(obtenerFecha());
			circular.setAsunto(comunicacion.getAsunto());
			circular.setContenidoCom(comunicacion.getContenidoCom());
			circular.setContacto(c);
			circular.setLeido("NO");
			circular.setTipo("Circular");
			circular.setAnexos(rutaAnexo);

			String uo = gestionMemorandos.obtenerUnidadOrganizacionalContacto(c.getIdContacto());
			circular.setUnidadOrganizacional(uo);

			//Estado: Enviado
			Estadocomunicacion estado = gestionMemorandos.getEstado("Enviado");
			circular.setEstadocomunicacion(estado);
			circular.setDestinatariosCom( destinatariosParaLaComunicacion() );
			comunicacion = circular;

			List<Contacto> lC = obtenerListaContactosParaComunicacion();

			gestionMemorandos.registrarCircular(circular, lC);

			registrarPalabrasClaves(comunicacion);


			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Successful"));
			//------------------- ------- ---------------------

			limpiar();
			loginBean.actualizar();
			return "circularEnviada";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo salió mal"));
			//------------------- ------- ---------------------
		}

		limpiar();
		return "algoSalioMal";
	}

	/**
	 * Registrar Memorando
	 * @return
	 */
	public String registrarMemorando()
	{
		try
		{
			Contacto c = loginBean.getContacto();
			Memorando memorando = new Memorando();
			memorando.setFechaCreacion(obtenerFecha());
			memorando.setAsunto(comunicacion.getAsunto());
			memorando.setContenidoCom(comunicacion.getContenidoCom());
			memorando.setContacto(c);
			memorando.setLeido("NO");
			memorando.setTipo("Memorando");
			memorando.setAnexos(rutaAnexo);

			String uo = gestionMemorandos.obtenerUnidadOrganizacionalContacto(c.getIdContacto());
			memorando.setUnidadOrganizacional(uo);

			//Estado: Registrado
			memorando.setEstadocomunicacion(gestionMemorandos.getEstadosComunicacion().get(0));
			memorando.setDestinatariosCom( destinatariosParaLaComunicacion() );

			comunicacion = memorando;

			List<Contacto> lC = obtenerListaContactosParaComunicacion();

			gestionMemorandos.registrarMemorando(memorando, lC);

			registrarPalabrasClaves(comunicacion);

			if(expediente!=null)
			{
				registrarComunicacionEnExpediente(comunicacion);
			}

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Memorando registrado satisfactoriamente"));
			//------------------- ------- ---------------------

			actualizar();
			limpiar();
			return "correctoCom";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo salió mal :("));
			//------------------- ------- ---------------------
		}
		comunicacion = new Comunicacion();
		limpiar();
		return "algoSalioMal";
	}

	/**
	 * Asignarle un expediente a la comunicación que se está construyendo
	 * @param c
	 */
	public void registrarComunicacionEnExpediente(Comunicacion c)
	{
		try
		{
			if(!expediente.getAsunto().equals("Seleccionar expediente"))
			{
				Expedientedocumento ed = new Expedientedocumento();
				ed.setDocumentoBean(c);
				ed.setExpedienteBean(expediente);

				gestionMemorandos.registrarExpedienteDocumento(ed);
			}
		}catch(Exception e){}
	}

	private List<Conversacion> listaConversaciones = new ArrayList<Conversacion>();

	/**
	 * Listar todas las conversaciones de una comunicación
	 */
	public void listarConversaciones()
	{
		listaConversaciones = gestionMemorandos.listaConversacionesDeUnaComunicacion(selectedComunicacion.getIdDocumento());

		gestionMemorandos.ordenarConversacion(listaConversaciones);
	}

	public List<Conversacion> getListaConversaciones() {
		return listaConversaciones;
	}

	public void setListaConversaciones(List<Conversacion> listaConversaciones) {
		this.listaConversaciones = listaConversaciones;
	}

	/**
	 * Crear Comunicacion 1 - Comunicación Interna
	 * @return
	 */
	public String crearComunicacion1()
	{
		Contacto c = loginBean.getContacto();

		try
		{
			Comunciacioninterna comI = new Comunciacioninterna();
			comI.setFechaCreacion(obtenerFecha());
			comI.setAsunto(comunicacion.getAsunto());
			comI.setContenidoCom(comunicacion.getContenidoCom());
			comI.setContacto(c);
			comI.setLeido("NO");
			comI.setTipo("Comunicacion interna");
			comI.setAnexos(rutaAnexo);

			String uo = gestionMemorandos.obtenerUnidadOrganizacionalContacto(c.getIdContacto());
			comI.setUnidadOrganizacional(uo);

			//Estado: Registrado
			Estadocomunicacion estado = gestionMemorandos.getEstado("Registrado");	

			comI.setEstadocomunicacion( estado );
			comI.setDestinatariosCom( destinatariosParaLaComunicacion() );	

			comunicacion = comI;

			List<Contacto> lC = obtenerListaContactosParaComunicacion();

			gestionMemorandos.registrarComunicacionInterna(comI, lC, rutaAnexo);

			registrarDestinatariosConCopiaDeUnaComunicacion(comI); //REVISAR

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Comunicación registrada satisfactoriamente"));
			//------------------- ------- ---------------------

			registrarPalabrasClaves(comunicacion);

			if(expediente!=null)
			{
				registrarComunicacionEnExpediente(comunicacion);
			}

			limpiar();
			actualizar();
			return "correctoCom1";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo salió mal :("));
			//------------------- ------- ---------------------
		}

		limpiar();

		return "algoSalioMal";
	}

	/**
	 * Registrar los destinatarios que tienen copia de la comunicación
	 * @param comunicacion
	 */
	public void registrarDestinatariosConCopiaDeUnaComunicacion(Comunicacion comunicacion)
	{
		if(obtenerListaContactosParaComunicacionConCopia()!=null)
		{
			for (Contacto contacto : obtenerListaContactosParaComunicacionConCopia()) 
			{
				Comunicaciondestinatario comunicaciondestinatario = new Comunicaciondestinatario();
				comunicaciondestinatario.setIdComunicacionDestinatario(gestionMemorandos.obtenerID( gestionMemorandos.getComunicaciondestinatarios() ));
				comunicaciondestinatario.setComunicacionBean(comunicacion);
				comunicaciondestinatario.setContacto(contacto);
				comunicaciondestinatario.setCc("SI");
				gestionMemorandos.registrarComunicacionDestinatario(comunicaciondestinatario);					
			}
		}
	}

	/**
	 * Enviar una comunicación interna
	 * @return
	 */
	public String enviarComunicacion1()
	{
		Contacto c = loginBean.getContacto();

		try
		{
			Comunciacioninterna comI = new Comunciacioninterna();
			comI.setFechaCreacion(obtenerFecha());
			comI.setAsunto(comunicacion.getAsunto());
			comI.setContenidoCom(comunicacion.getContenidoCom());
			comI.setContacto(c);
			comI.setLeido("NO");
			comI.setTipo("Comunicacion interna");
			comI.setAnexos(rutaAnexo);

			String uo = gestionMemorandos.obtenerUnidadOrganizacionalContacto(c.getIdContacto());
			comI.setUnidadOrganizacional(uo);

			//---------------------- Estado: Aprobado --------------------------
			Estadocomunicacion estado = gestionMemorandos.getEstado("Enviado");
			//---------------------- ---------------- --------------------------

			comI.setDestinatariosCom( destinatariosParaLaComunicacion() );

			comI.setEstadocomunicacion( estado );
			comunicacion = comI;

			List<Contacto> lC = obtenerListaContactosParaComunicacion();

			gestionMemorandos.registrarComunicacionInterna(comI, lC, rutaAnexo);

			registrarPalabrasClaves(comunicacion);

			if(expediente!=null)
			{
				registrarComunicacionEnExpediente(comunicacion);
			}
			registrarDestinatariosConCopiaDeUnaComunicacion(comI); //REVISAR

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Comunicación enviada satisfactoriamente"));
			//------------------- ------- ---------------------

			limpiar();
			actualizar();
			return "comunicacionAprobada";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo salió mal :("));
			//------------------- ------- ---------------------
		}

		limpiar();
		actualizar();
		return "algoSalioMal";
	}

	/**
	 * Enviar Memorando (Jefe)
	 * @return
	 */
	public String enviarMemorandoJefe()
	{
		Contacto c = loginBean.getContacto();

		try
		{
			Memorando memorando = new Memorando();
			memorando.setFechaCreacion(obtenerFecha());
			memorando.setAsunto(comunicacion.getAsunto());
			memorando.setContenidoCom(comunicacion.getContenidoCom());
			memorando.setContacto(c);
			memorando.setLeido("NO");
			memorando.setTipo("Memorando");
			memorando.setAnexos(rutaAnexo);

			String uo = gestionMemorandos.obtenerUnidadOrganizacionalContacto(c.getIdContacto());
			memorando.setUnidadOrganizacional(uo);

			//------------------ Estado: Aprobado ------------------
			Estadocomunicacion estado = new Estadocomunicacion();
			estado = gestionMemorandos.getEstado("Enviado");
			//------------------------------------------------------

			memorando.setEstadocomunicacion(estado);
			memorando.setDestinatariosCom( destinatariosParaLaComunicacion() );

			comunicacion = memorando;
			List<Contacto> lC = obtenerListaContactosParaComunicacion();
			gestionMemorandos.registrarMemorando(memorando, lC);

			registrarPalabrasClaves(comunicacion);

			if(expediente!=null)
			{
				registrarComunicacionEnExpediente(comunicacion);
			}

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Memorando enviado satisfactoriamente"));
			//------------------- ------- ---------------------

			actualizar();
			limpiar();
			return "correctoCom";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo salió mal"));
			//------------------- ------- ---------------------
		}
		limpiar();
		return "algoSalioMal";
	}

	/**
	 * Registrar las observaciones y ediciones hechas por un Jefe a una comunicación
	 */
	public String construirComunicacion()
	{
		try
		{
			if(comentario!=null)
			{
				selectedComunicacion.setComentarios(comentario);
			}

			selectedComunicacion.setLeido("NO");

			if(selectedComunicacion.getAnexo()==null)
			{
				selectedComunicacion.setAnexos(rutaAnexo);
			}

			//-------------- Estado: En Construccion ---------------
			Estadocomunicacion estado = new Estadocomunicacion();
			estado = gestionMemorandos.getEstado("En Construccion");
			//------------------------------------------------------

			selectedComunicacion.setEstadocomunicacion( estado );
			gestionMemorandos.actualizarComunicacion(selectedComunicacion);

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Successful"));
			//------------------- ------- ---------------------

			actualizar();
			limpiar();
			comentario="";
			return "construccionGuardada";

		}catch(Exception e)
		{
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo salió mal"));
			//------------------- ------- ---------------------
		}
		return "algoSalioMal";
	}

	/**
	 * Comunicación en elaboración
	 */
	public String elaborarComunicacion()
	{
		try
		{
			selectedComunicacion.setLeido("NO");

			//-------------- Estado: Elaborado ---------------------
			Estadocomunicacion estado = new Estadocomunicacion();
			estado = gestionMemorandos.getEstado("Elaborado");
			//------------------------------------------------------

			selectedComunicacion.setEstadocomunicacion( estado );
			gestionMemorandos.actualizarComunicacion(selectedComunicacion);

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Successful"));
			//------------------- ------- ---------------------
			actualizar();
			limpiar();

			return "elaboracionGuardada";

		}catch(Exception e)
		{
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo Salió Mal"));
			//------------------- ------- ---------------------
		}

		return "algoSalioMal";
	}

	/**
	 * Comunicación en redacción
	 */
	public String redactarComunicacion()
	{
		try
		{
			if(comentario!=null)
			{
				selectedComunicacion.setComentarios(comentario);
			}

			selectedComunicacion.setLeido("NO");

			//-------------- Estado: en redacción ---------------------
			Estadocomunicacion estado = new Estadocomunicacion();
			estado = gestionMemorandos.getEstado("En Redaccion");
			//------------------------------------------------------

			selectedComunicacion.setEstadocomunicacion( estado );
			gestionMemorandos.actualizarComunicacion(selectedComunicacion);
			//gestionMemorandos.registrarObservacion(observacion);

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Successful"));
			//------------------- ------- ---------------------
			actualizar();
			limpiar();
			comentario="";
			return "redaccionGuardada";
		}
		catch(Exception e)
		{
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo Salió Mal"));
			//------------------- ------- ---------------------
		}

		return "algoSalioMal";
	}

	/**
	 * Aprobar Comunicación - Cambiar estado a "Aprobado" (Redacción)
	 */
	public String aprobarComunicacion()
	{
		try
		{
			selectedComunicacion.setContacto(loginBean.contacto);

			//-------------- Estado: Aprobado ---------------------
			Estadocomunicacion estado = new Estadocomunicacion();
			estado = gestionMemorandos.getEstado("Aprobado");
			//------------------------------------------------------
			selectedComunicacion.setEstadocomunicacion( estado );	
			selectedComunicacion.setFechaCreacion(obtenerFecha());

			selectedComunicacion.setEstado("NO");
			gestionMemorandos.actualizarComunicacion(selectedComunicacion);		

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Comunicación aprobada satisfactoriamente"));

			actualizar();
			limpiar();
			return "comunicacionAprobada";

		}catch(Exception e)
		{
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo Salió Mal"));
			//------------------- ------ ----------------------
		}

		return "algoSalioMal";
	}

	/**
	 * Rechazar la Construcción de la comunicación - Cambiar estado a "Elaborado"
	 */
	public String rechazarConstruccion()
	{
		try
		{
			selectedComunicacion.setContacto(loginBean.contacto);

			if(comentario!=null)
			{
				selectedComunicacion.setComentarios(comentario);
			}
			
			/**
			 * Actualizar la ruta del archivo adjunto.
			 */

			//-------------- Estado: En Construcción --------------------
			Estadocomunicacion estado = new Estadocomunicacion();
			estado = gestionMemorandos.getEstado("En Construccion");
			//------------------------------------------------------

			selectedComunicacion.setEstadocomunicacion( estado );	
			selectedComunicacion.setFechaCreacion(obtenerFecha());
			selectedComunicacion.setEstado("NO");
			gestionMemorandos.actualizarComunicacion(selectedComunicacion);		

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Successful"));

			actualizar();
			limpiar();

			return "construccionRechazada";

		}catch(Exception e)
		{
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo Salió Mal"));
			//------------------- ------ ----------------------
		}

		return "algoSalioMal";
	}

	/**
	 * Rechazar la Redacción de la comunicación - Cambiar estado a "Construido"
	 */
	public String rechazarRedaccion()
	{
		try
		{
			selectedComunicacion.setContacto(loginBean.contacto);

			if(comentario!=null)
			{
				selectedComunicacion.setComentarios(comentario);
			}

			//-------------- Estado: Construido --------------------
			Estadocomunicacion estado = new Estadocomunicacion();
			estado = gestionMemorandos.getEstado("En Redaccion");
			//------------------------------------------------------

			selectedComunicacion.setEstadocomunicacion( estado );	
			selectedComunicacion.setFechaCreacion(obtenerFecha());
			selectedComunicacion.setEstado("NO");
			gestionMemorandos.actualizarComunicacion(selectedComunicacion);		

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Successful"));

			actualizar();
			limpiar();
			return "redaccionRechazada";

		}catch(Exception e)
		{
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo Salió Mal"));
			//------------------- ------ ----------------------
		}

		return "algoSalioMal";
	}

	/**
	 * Rechazar la Redacción de la comunicación - Cambiar estado a "Construido"
	 */
	public String aprobarRedaccion()
	{
		try
		{
			selectedComunicacion.setContacto(loginBean.contacto);

			if(comentario!=null)
			{
				selectedComunicacion.setComentarios(comentario);
			}

			//-------------- Estado: Construido --------------------
			Estadocomunicacion estado = new Estadocomunicacion();
			estado = gestionMemorandos.getEstado("Redactado");
			//------------------------------------------------------

			selectedComunicacion.setEstadocomunicacion( estado );	
			selectedComunicacion.setFechaCreacion(obtenerFecha());
			selectedComunicacion.setEstado("NO");
			gestionMemorandos.actualizarComunicacion(selectedComunicacion);		

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Successful"));

			actualizar();
			limpiar();
			return "redaccionAprobada";

		}catch(Exception e)
		{
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo Salió Mal"));
			//------------------- ------ ----------------------
		}

		return "algoSalioMal";
	}

	/**
	 * Aprobar la Construcción de la comunicación - Cambiar estado a "Construido"
	 */
	public String aprobarConstruccion()
	{
		try
		{
			selectedComunicacion.setContacto(loginBean.contacto);

			if(comentario!=null)
			{
				selectedComunicacion.setComentarios(comentario);
			}

			//-------------- Estado: Construido --------------------
			Estadocomunicacion estado = new Estadocomunicacion();
			estado = gestionMemorandos.getEstado("Construido");
			//------------------------------------------------------

			selectedComunicacion.setEstadocomunicacion( estado );	
			selectedComunicacion.setFechaCreacion(obtenerFecha());
			selectedComunicacion.setEstado("NO");
			gestionMemorandos.actualizarComunicacion(selectedComunicacion);		

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Successful"));

			actualizar();
			limpiar();
			return "construccionAprobada";

		}catch(Exception e)
		{
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo Salió Mal"));
			//------------------- ------ ----------------------
		}

		return "algoSalioMal";
	}

	/**
	 * Responder mensaje en una conversación asociada a una comunicación
	 */
	public void responderMensajeDeUnaComunicacion()
	{
		Contacto c = loginBean.getContacto();

		try{

			//------------------------- Conversacion ----------------------------
			Conversacion conversacion = new Conversacion();
			conversacion = gestionMemorandos.getConversacion( selectedConversacion.getIdConversacion() );
			conversacion.setFechaConversacion(obtenerFecha());

			gestionMemorandos.actualizarConversacion(conversacion);
			//-------------------------------------------------------------------

			Mensaje mensaje = new Mensaje();

			mensaje.setIdDocumento(gestionMemorandos.obtenerID(gestionMemorandos.getDocumentos()));
			mensaje.setContacto(c);
			mensaje.setFechaCreacion(obtenerFecha());
			mensaje.setAsunto(((Mensaje) aux).getAsunto() );
			mensaje.setContenidoCom(comunicacion.getContenidoCom());
			mensaje.setLeido("NO");
			mensaje.setAnexos(rutaAnexo);

			//Asigna la unidad organizacional a la que pertenece el mensaje
			String uo = gestionMemorandos.obtenerUnidadOrganizacionalContacto(c.getIdContacto());
			mensaje.setUnidadOrganizacional(uo);

			mensaje.setConversacion( conversacion );
			mensaje.setTipo("Mensaje");
			mensaje.setRespuestaA( ((Mensaje) aux).getIdDocumento() );

			//----------------- Estado: Enviado -------------------
			Estadocomunicacion estado = new Estadocomunicacion();
			estado = gestionMemorandos.getEstado("Enviado");
			//------------------ -------------- -------------------

			mensaje.setEstadocomunicacion( estado );
			mensaje.setDestinatariosCom(aux.getContacto().getNombre());

			List<Contacto> lC = new ArrayList<Contacto>();
			lC.add(aux.getContacto());

			comunicacion = mensaje;	

			gestionMemorandos.registrarMensaje(mensaje, lC);	

			comunicacion = new Comunicacion();
			leerConversacion();
			//	aux = new Comunicacion();

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Mensaje enviado satisfactoriamente"));
			//------------------- ------- ---------------------

		}
		catch(Exception e)
		{
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo Salió Mal"));
			//------------------- ------- ---------------------
			e.printStackTrace();
		}
	}

	/**
	 * Responder un mensaje
	 * @return
	 */
	public String responderMensaje()
	{
		Contacto c = loginBean.getContacto();

		try{

			Mensaje mensaje = new Mensaje();

			mensaje.setIdDocumento(gestionMemorandos.obtenerID(gestionMemorandos.getDocumentos()));
			mensaje.setContacto(c);
			mensaje.setFechaCreacion(obtenerFecha());
			mensaje.setAsunto( ((Mensaje) aux).getAsunto() );
			mensaje.setContenidoCom(comunicacion.getContenidoCom());
			mensaje.setLeido("NO");
			mensaje.setAnexos(rutaAnexo);

			//Asigna la unidad organizacional a la que pertenece el mensaje
			String uo = gestionMemorandos.obtenerUnidadOrganizacionalContacto(c.getIdContacto());
			mensaje.setUnidadOrganizacional(uo);

			mensaje.setConversacion( ((Mensaje) aux).getConversacion() );
			mensaje.setTipo("Mensaje");
			mensaje.setRespuestaA( ((Mensaje) aux).getIdDocumento() );

			//--- Estado: Enviado ---
			Estadocomunicacion estado = new Estadocomunicacion();
			estado = gestionMemorandos.getEstado("Enviado");
			//-----------------------

			mensaje.setEstadocomunicacion( estado );

			List<Contacto> lC = obtenerListaContactosParaComunicacion();
			mensaje.setDestinatariosCom( destinatariosParaLaComunicacion() );

			comunicacion = mensaje;	

			gestionMemorandos.registrarMensaje(mensaje, lC);

			registrarPalabrasClaves(comunicacion);

			loginBean.actualizar();		
			limpiar();
			aux = new Comunicacion();

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Mensaje enviado satisfactoriamente"));
			//------------------- ------- ---------------------

			return "respuestaMensaje";
		}
		catch(Exception e)
		{
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo Salió Mal"));
			//------------------- ------- ---------------------
			e.printStackTrace();
		}

		loginBean.actualizar();		
		limpiar();
		aux = new Comunicacion();

		return "algoSalioMal";
	}

	/**
	 * Enviar un mensaje asociado a una comunicación (Conversación)
	 */
	public void sendMessage()
	{
		Contacto c = loginBean.getContacto();

		try{

			//-------------------------- Conversación ---------------------------------
			Conversacion conversacion = new Conversacion();
			conversacion.setIdConversacion(gestionMemorandos.obtenerID(gestionMemorandos.getConversaciones()));
			conversacion.setComunicacion(selectedComunicacion);
			conversacion.setFechaConversacion(obtenerFecha());
			conversacion.setAsunto(comunicacion.getAsunto());	

			List<Contacto> lC = obtenerListaContactosParaComunicacion();

			if(lC.size()==1)
			{
				conversacion.setNombreContacto(lC.get(0).getNombre()+" y "+c.getNombre());
			}
			if(lC.size()>1)
			{
				conversacion.setNombreContacto(c.getNombre()+" y otros ");
			}

			gestionMemorandos.registrarConversacion(conversacion);
			//-------------------------- ------------ ---------------------------------

			Mensaje mensaje = new Mensaje();

			mensaje.setContacto(c);
			mensaje.setFechaCreacion(obtenerFecha());
			mensaje.setAsunto(comunicacion.getAsunto());
			mensaje.setContenidoCom(comunicacion.getContenidoCom());
			mensaje.setLeido("NO");
			mensaje.setConversacion(conversacion);
			mensaje.setTipo("Mensaje");
			mensaje.setAnexos(rutaAnexo);

			String uo = gestionMemorandos.obtenerUnidadOrganizacionalContacto(c.getIdContacto());
			mensaje.setUnidadOrganizacional(uo);

			//-- Estado: Enviado --
			Estadocomunicacion estado = new Estadocomunicacion();
			estado = gestionMemorandos.getEstado("Enviado");
			//-----------------------

			mensaje.setEstadocomunicacion( estado );
			mensaje.setDestinatariosCom( destinatariosParaLaComunicacion() );
			comunicacion = mensaje;

			gestionMemorandos.registrarMensaje(mensaje, lC);

			tab = "1";

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Mensaje enviado satisfactoriamente"));
			//------------------- ------- ---------------------

		}
		catch(Exception e)
		{
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo salió mal"));
			//------------------- ------- ---------------------

			e.printStackTrace();
		}

		loginBean.actualizar();
		comunicacion = new Comunicacion();
		destinatarios = new ArrayList<String>();
		rutaAnexo = null;
		listarConversaciones();
	}

	/**
	 * Enviar mensaje
	 * @return
	 */
	public String enviarMensaje()
	{
		Contacto c = loginBean.getContacto();

		try{

			//-------------------------- Conversación ---------------------------------
			Conversacion conversacion = new Conversacion();
			conversacion.setIdConversacion(gestionMemorandos.obtenerID(gestionMemorandos.getConversaciones()));
			gestionMemorandos.registrarConversacion(conversacion);

			//-------------------------- ------------ ---------------------------------

			Mensaje mensaje = new Mensaje();

			mensaje.setContacto(c);
			mensaje.setFechaCreacion(obtenerFecha());
			mensaje.setAsunto(comunicacion.getAsunto());
			mensaje.setContenidoCom(comunicacion.getContenidoCom());
			mensaje.setLeido("NO");
			mensaje.setConversacion(conversacion);
			mensaje.setTipo("Mensaje");
			mensaje.setAnexos(rutaAnexo);

			String uo = gestionMemorandos.obtenerUnidadOrganizacionalContacto(c.getIdContacto());
			mensaje.setUnidadOrganizacional(uo);

			//-- Estado: Enviado --
			Estadocomunicacion estado = new Estadocomunicacion();
			estado = gestionMemorandos.getEstado("Enviado");
			//-----------------------

			mensaje.setEstadocomunicacion( estado );
			mensaje.setDestinatariosCom( destinatariosParaLaComunicacion() );
			comunicacion = mensaje;

			List<Contacto> lC = obtenerListaContactosParaComunicacion();

			gestionMemorandos.registrarMensaje(mensaje, lC);

			registrarPalabrasClaves(comunicacion);

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Mensaje enviado satisfactoriamente"));
			//------------------- ------- ---------------------

			loginBean.actualizar();
			limpiar();
			return "mensajeEnviado";
		}
		catch(Exception e)
		{
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo salió mal"));
			//------------------- ------- ---------------------
			e.printStackTrace();

		}
		loginBean.actualizar();
		limpiar();

		return "algoSalioMal";
	}

	/**
	 * Mostrar observaciones realizadas por un Jefe a la comunicación
	 */
	public void leerObservaciones()
	{
		comentario="";
		//List<Observacion> o = gestionMemorandos.obtenerObservaciones(selectedComunicacion.getIdDocumento());

		if(selectedComunicacion.getComentarios()!=null)
		{
			comentario = selectedComunicacion.getComentarios();
		}

	}

	/**
	 * Permite revisar la comunicación para editarla o hacerle observaciones 
	 */
	public void revisarComunicacion() throws Exception
	{
		FacesContext ctx = FacesContext.getCurrentInstance();
		ExternalContext extContext = ctx.getExternalContext();
		String url = "";
		listarDestinatarios(selectedComunicacion);
		getExpedientesComunicacion();

		tab = "0";

		listarConversaciones();

		//----------- Estado de la comunicación seleccionada --------------
		String estado = selectedComunicacion.getEstadocomunicacion().getEstado();
		//-----------------------------------------------------------------

		leerObservaciones();

		if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
		{
			if(selectedComunicacion.getTipo().toLowerCase().equals("comunicacion interna") )
			{
				if(estado.equals("En Construccion"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/construirCom1.xhtml")); 
				}

				if(estado.equals("Elaborado"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/construirCom1.xhtml")); 
				}

				if(estado.equals("Construido"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/redactarCom1.xhtml")); 
				}

				if(estado.equals("En Redaccion"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/redactarCom1.xhtml")); 
				}

				if(estado.equals("Registrado"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/edicionJ1.xhtml")); 
				}

			}

			if(selectedComunicacion.getTipo().toLowerCase().equals("memorando") || selectedComunicacion.getTipo().toLowerCase().equals("circular"))
			{
				if(estado.equals("En Construccion"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/construirComunicacion.xhtml")); 
				}

				if(estado.equals("Elaborado"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/elaborarComunicacion.xhtml")); 
				}

				if(estado.equals("Construido"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/construirComunicacionJ.xhtml")); 
				}

				if(estado.equals("En Redaccion"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/redactarComunicacion.xhtml")); 
				}

				if(estado.equals("Registrado"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/edicionJ.xhtml")); 
				}

				if(estado.equals("Redactado"))
				{
					leerComunicacionParaAprobar();
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/aprobarComunicacion.xhtml")); 
				}
			}

			//	url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/edicionJ.xhtml")); 
		}

		if(loginBean.getRol().equals("Secretaria"))
		{

			if(selectedComunicacion.getTipo().toLowerCase().equals("comunicacion interna") )
			{
				if(estado.equals("En Construccion"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/construirCom1S.xhtml")); 
				}

				if(estado.equals("Elaborado"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/construirCom1S.xhtml")); 
				}

				if(estado.equals("Construido"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/redactarCom1S.xhtml")); 
				}

				if(estado.equals("En Redaccion"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/redactarCom1S.xhtml")); 
				}

				if(estado.equals("Registrado"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/edicionSecre1.xhtml")); 
				}

			}

			if(selectedComunicacion.getTipo().toLowerCase().equals("memorando") || selectedComunicacion.getTipo().toLowerCase().equals("circular"))
			{

				if(estado.equals("En Construccion"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/construirComunicacionS.xhtml")); 
				}

				if(estado.equals("Elaborado"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/construirComunicacionS.xhtml")); 
				}

				if(estado.equals("Construido"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/redactarComunicacionS.xhtml")); 
				}

				if(estado.equals("En Redaccion"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/redactarComunicacionS.xhtml")); 
				}

				if(estado.equals("Registrado"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/edicionSecre.xhtml")); 
				}

			}

			//url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/edicionSecre.xhtml")); 
		}

		extContext.redirect(url);
	}

	/**
	 * Actualizar (Editar) una comunicación por parte de la Secretaria
	 */
	public String actualizarComunicacion()
	{
		try{
			selectedComunicacion.setEstado("NO");
			gestionMemorandos.actualizarComunicacion(selectedComunicacion);
			limpiar();

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Successful"));
			//------------------- ------- ---------------------

			return "actualizacionGuardada";
		}
		catch(Exception e)
		{
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo salió mal"));
			//------------------- ------- ---------------------
		}

		return "algoSalioMal";
	}

	/**
	 * Enviar una comunicación - Estado: Enviado
	 * @return
	 */
	public String enviarComunicacion()
	{
		try
		{

			//-------------- Estado: Aprobado ---------------------
			Estadocomunicacion estado = new Estadocomunicacion();
			estado = gestionMemorandos.getEstado("Enviado");
			//------------------------------------------------------
			selectedComunicacion.setEstadocomunicacion( estado );	
			selectedComunicacion.setFechaCreacion(obtenerFecha());
			selectedComunicacion.setComentarios(comentario);

			if(selectedComunicacion.getAnexo()==null)
			{
				selectedComunicacion.setAnexos(rutaAnexo);
			}

			selectedComunicacion.setEstado("NO");
			gestionMemorandos.actualizarComunicacion(selectedComunicacion);		

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Comunicación enviada satisfactoriamente"));

			actualizar();
			limpiar();
			return "comunicacionEnviada";

		}
		catch(Exception e)
		{
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo Salió Mal"));
			//------------------- ------- ----------------------
		}

		return "algoSalioMal";
	}

	/**
	 * Enviar una comunicación - Estado: Enviado
	 * @return
	 */
	public String enviarComunicacionAprobada()
	{
		try
		{
			//-------------- Estado: Aprobado ---------------------
			Estadocomunicacion estado = new Estadocomunicacion();
			estado = gestionMemorandos.getEstado("Enviado");
			//------------------------------------------------------
			selectedC.setEstadocomunicacion( estado );	
			selectedC.setFechaCreacion(obtenerFecha());
			selectedC.setComentarios(comentario);

			if(selectedC.getAnexo()==null)
			{
				selectedC.setAnexos(rutaAnexo);
			}

			selectedC.setEstado("NO");
			gestionMemorandos.actualizarComunicacion(selectedC);		

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Comunicación enviada satisfactoriamente"));

			actualizar();
			limpiar();
			return "comunicacionEnviada";

		}
		catch(Exception e)
		{
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo Salió Mal"));
			//------------------- ------- ----------------------
		}

		return "algoSalioMal";
	}

	/**
	 * Generar la comunicación seleccionada en archivo PDF
	 * @param id selected comunicación
	 */
	public void generarComunicacionPDF(String id)
	{

		try {
			ReporteBean reporteBean = new ReporteBean();

			String destinatarios = "";
			destinatarios = destinatarariosReporte(id);
			String remitente = "";
			remitente = remitenteReporte(id);
			String destinatariosCC = " ";

			if(destinatarariosCCReporte(id)!=null)
			{
				destinatariosCC = "CON COPIA: "+destinatarariosCCReporte(id);
			}

			if( gestionMemorandos.obtenerComunicacion(id).getTipo().equals("Memorando") || gestionMemorandos.obtenerComunicacion(id).getTipo().equals("Circular") )
			{
				reporteBean.reporteComunicacion(id,remitente, destinatarios);
			}

			if( gestionMemorandos.obtenerComunicacion(id).getTipo().equals("Comunicacion interna") )
			{
				reporteBean.reporteComunicacionInterna(id, remitente, destinatarios, destinatariosCC);
			}

			rutaComunicacion = ""+reporteBean.getRutaCom();

		} catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

	/**
	 * Generar el remitente de la comunicación para mostrarlo en el reporte PDF
	 * @param id
	 * @return
	 */
	public String remitenteReporte(String id)
	{
		Contacto remitente = gestionMemorandos.obtenerComunicacion(id).getContacto();

		if(gestionMemorandos.getRolContacto(remitente.getIdContacto())!=null && gestionMemorandos.nombreUnidadOrganizacional( gestionMemorandos.obtenerUnidadOrganizacionalContacto(remitente.getIdContacto()))!=null )
		{
			return remitente.getNombre()+" - "+gestionMemorandos.getRolContacto(remitente.getIdContacto()).toString()+" "+gestionMemorandos.nombreUnidadOrganizacional( gestionMemorandos.obtenerUnidadOrganizacionalContacto(remitente.getIdContacto()));
		}

		return remitente.getNombre();
	}

	/**
	 * Generar lista de destinatarios de la comunicación para mostrarlo en el reporte PDF
	 * @param id
	 * @return
	 */
	public String destinatarariosReporte(String id)
	{
		String destinatariosR = " ";
		List<Contacto> listaDestinatariosCom = gestionMemorandos.obtenerDestinatariosComunicacion(id);

		for (Contacto c : listaDestinatariosCom) 
		{
			if(listaDestinatariosCom.size()==1)
			{
				if(gestionMemorandos.getRolContacto(c.getIdContacto())!=null && gestionMemorandos.nombreUnidadOrganizacional( gestionMemorandos.obtenerUnidadOrganizacionalContacto(c.getIdContacto()))!=null )
				{
					return c.getNombre()+" - "+gestionMemorandos.getRolContacto(c.getIdContacto()).toString()+" "+gestionMemorandos.nombreUnidadOrganizacional( gestionMemorandos.obtenerUnidadOrganizacionalContacto(c.getIdContacto()) );
				}
				else
				{
					return c.getNombre();
				}
			}
			else
			{

				if(gestionMemorandos.getRolContacto(c.getIdContacto())!=null && gestionMemorandos.nombreUnidadOrganizacional( gestionMemorandos.obtenerUnidadOrganizacionalContacto(c.getIdContacto()))!=null )
				{
					destinatariosR+=c.getNombre()+" - "+gestionMemorandos.getRolContacto(c.getIdContacto()).toString()+" "+gestionMemorandos.nombreUnidadOrganizacional( gestionMemorandos.obtenerUnidadOrganizacionalContacto(c.getIdContacto()) )+", ";
				}
				else
				{
					destinatariosR+=c.getNombre()+" ";
				}
			}
		}

		return destinatariosR;
	}

	/**
	 * Generar lista de destinatarios de la comunicación para mostrarlo en el reporte PDF
	 * @param id
	 * @return
	 */
	public String destinatarariosCCReporte(String id)
	{
		String destinatariosR = null;
		List<Contacto> listaDestinatariosCom = gestionMemorandos.obtenerDestinatariosConCopiaComunicacion(id);

		if(listaDestinatariosCom!=null)
		{
			for (Contacto c : listaDestinatariosCom) 
			{
				if(listaDestinatariosCom.size()==1)
				{
					if(gestionMemorandos.getRolContacto(c.getIdContacto())!=null && gestionMemorandos.nombreUnidadOrganizacional( gestionMemorandos.obtenerUnidadOrganizacionalContacto(c.getIdContacto()))!=null )
					{
						return c.getNombre()+" - "+gestionMemorandos.getRolContacto(c.getIdContacto()).toString()+" "+gestionMemorandos.nombreUnidadOrganizacional( gestionMemorandos.obtenerUnidadOrganizacionalContacto(c.getIdContacto()) );
					}
					else
					{
						return c.getNombre();
					}
				}
				else
				{

					if(gestionMemorandos.getRolContacto(c.getIdContacto())!=null && gestionMemorandos.nombreUnidadOrganizacional( gestionMemorandos.obtenerUnidadOrganizacionalContacto(c.getIdContacto()))!=null )
					{
						destinatariosR+=c.getNombre()+" - "+gestionMemorandos.getRolContacto(c.getIdContacto()).toString()+" "+gestionMemorandos.nombreUnidadOrganizacional( gestionMemorandos.obtenerUnidadOrganizacionalContacto(c.getIdContacto()) )+", ";
					}
					else
					{
						destinatariosR+=c.getNombre()+" ";
					}
				}
			}
			return destinatariosR;
		}

		return destinatariosR;
	}

	//	public String actualizarComunicacion(Comunicacion comunicacion)
	//	{
	//		List<Contacto> c = gestionMemorandos.obtenerDestinatariosComunicacion(comunicacion.getIdDocumento());
	//		String aux = new String();
	//
	//		if(c.size()==1)
	//		{
	//			return c.get(0).getNombre();
	//		}
	//
	//		for (Contacto contacto : c) 
	//		{
	//			aux+=contacto.getNombre()+"; ";
	//		}
	//
	//		return aux;
	//
	//	}

	/**
	 * Leer una conversación
	 */
	public void leerMensaje(Comunicacion c) 
	{
		FacesContext ctx = FacesContext.getCurrentInstance();
		ExternalContext extContext = ctx.getExternalContext();
		String url = "";

		try{

			if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
			{
				url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacion.xhtml")); 
				//extContext.redirect(url);

			}
			if(loginBean.getRol().equals("Secretaria"))
			{
				url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionS.xhtml")); 
				//extContext.redirect(url);
			}
			if(loginBean.getRol().equals("Worker"))
			{
				url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionP.xhtml")); 
				//extContext.redirect(url);
			}

			extContext.redirect(url);

			conversacion = gestionMemorandos.obtenerMensajesConversacion( ((Mensaje) c).getConversacion().getIdConversacion() );
			gestionMemorandos.ordenarPrueba(conversacion);

			if(comprobarDestinatarios(c.getIdDocumento(), loginBean.getContacto().getIdContacto()))
			{
				c.setLeido("SI");
			}

			gestionMemorandos.actualizarComunicacion(c);

			aux = c;

		}catch(Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * Cambia el estado de la comunicación a leído, únicamente cuando el destinatario 
	 * abre la comunicación
	 * @param id
	 * @return
	 */
	public boolean comprobarDestinatarios(String id, String contactoA)
	{
		List<Contacto> destin = gestionMemorandos.obtenerDestinatariosComunicacion(id);

		for (Contacto contacto : destin) 
		{
			if(contacto.getIdContacto().equals(contactoA))
			{
				return true;
			}
		}
		return false;
	}

	String anexo;
	private String destinatariosC;

	/**
	 * Lista de destinatarios para mostrar en la interfaz de contrucción, elaboración y redacción
	 * @param c
	 */
	public void listarDestinatarios(Comunicacion c)
	{
		destinatariosC="";
		List<Contacto> destinatarios =gestionMemorandos.obtenerDestinatariosComunicacion(c.getIdDocumento());

		for (Contacto contacto : destinatarios) 
		{
			destinatariosC+=gestionMemorandos.getContactoRolUnidadOrganizacional(contacto)+" ";
		}

	}

	public String getDestinatariosC() {
		return destinatariosC;
	}

	public void setDestinatariosC(String destinatariosC) {
		this.destinatariosC = destinatariosC;
	}

	public String getAnexo() {
		return anexo;
	}

	public void setAnexo(String anexo) {
		this.anexo = anexo;
	}

	/**
	 * Este método indica la forma en que se debe leer una comunicación resultante de una búsqueda
	 * @throws Exception
	 */
	public void leerComunicacionResultadoBusqueda() throws Exception
	{
		if(selectedComunicacion.getEstadocomunicacion().getEstado().equals("Aprobado") || selectedComunicacion.getEstadocomunicacion().getEstado().equals("Enviado"))
		{
			leerComunicacion();
		}
		else
		{
			revisarComunicacion();
		}

	}

	private Comunicacion selectedC;

	public Comunicacion getSelectedC() {
		return selectedC;
	}

	public void setSelectedC(Comunicacion selectedC) {
		this.selectedC = selectedC;
	}

	/**
	 * Leer la comunicación seleccionada en la bandeja de entrada 
	 */
	public void leerComunicacion()
	{
		selectedC = new Comunicacion();
		selectedC = selectedComunicacion;
		tab = "0";

		try {

			if(!selectedC.getTipo().equals("Mensaje") )
			{
				generarComunicacionPDF(selectedC.getIdDocumento());
				FacesContext ctx = FacesContext.getCurrentInstance();
				ExternalContext extContext = ctx.getExternalContext();
				String url = "";

				expedientesCom = new String();
				expedientesCom = getExpedientesComunicacion();

				if(comprobarDestinatarios(selectedC.getIdDocumento(), loginBean.getContacto().getIdContacto()))
				{
					selectedC.setLeido("SI");
					gestionMemorandos.actualizarComunicacion(selectedC);
				}

				//				if(selectedC.getAnexo()!=null )
				//				{
				//					existeAnexo = false;
				//				}
				//				else
				//				{
				//					existeAnexo = true;
				//				}

				if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
				{

					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerComJ.xhtml")); 
					//extContext.redirect(url);
				}

				if(loginBean.getRol().equals("Secretaria"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerComS.xhtml")); 
					//extContext.redirect(url);
				}

				if(loginBean.getRol().equals("Profesor") || loginBean.getRol().equals("Worker"))
				{
					url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerComP.xhtml")); 
					//extContext.redirect(url);
				}

				extContext.redirect(url);

			}
			if(selectedC.getTipo().equals("Mensaje") )
			{
				leerMensaje(selectedC);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}

		limpiar();

	}

	/**
	 * Lectura de la comunicación en PDF para enviarla
	 */
	public void leerComunicacionParaEnviar()
	{
		selectedC = new Comunicacion();
		selectedC = selectedComunicacion;

		tab = "0";

		listarConversaciones();

		try {

			generarComunicacionPDF(selectedC.getIdDocumento());
			FacesContext ctx = FacesContext.getCurrentInstance();
			ExternalContext extContext = ctx.getExternalContext();
			String url = "";

			expedientesCom = new String();
			expedientesCom = getExpedientesComunicacion();

			selectedC.setLeido("NO");

			gestionMemorandos.actualizarComunicacion(selectedC);

			//			if(selectedC.getAnexo()!=null )
			//			{
			//				existeAnexo = false;
			//			}
			//			else
			//			{
			//				existeAnexo = true;
			//			}

			if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
			{

				url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/enviarComunicacion.xhtml")); 
				//extContext.redirect(url);
			}

			if(loginBean.getRol().equals("Secretaria"))
			{
				url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/enviarComunicacionS.xhtml")); 
				//extContext.redirect(url);
			}

			extContext.redirect(url);

		} catch (IOException e) {
			e.printStackTrace();
		}

		limpiarConversacion();
	}

	/**
	 * Lectura de la comunicación en PDF para enviarla
	 */
	public void leerComunicacionParaAprobar()
	{
		//selectedC = new Comunicacion();
		//selectedC = selectedComunicacion;

		try {

			generarComunicacionPDF(selectedComunicacion.getIdDocumento());
			selectedComunicacion.setLeido("NO");

			gestionMemorandos.actualizarComunicacion(selectedComunicacion);

		} catch (Exception e) {
			e.printStackTrace();
		}

		//limpiar();
	}


	/**
	 * Reiniciar estructuras de datos auxiliares
	 */
	public void limpiar()
	{
		comunicacion = new Comunicacion();
		//selectedContactos = new ArrayList<Contacto>();
		selectedComunicacion = null;
		selectedConversacion = new Conversacion();
		selectedPalabraClave = new ArrayList<String>();
		cc = new ArrayList<String>();
		destinatariosC="";
		destinatarios = new ArrayList<String>();
		expediente = new Expediente();
		expediente2 = new Expediente();
		//expedientesCom = "";
		rutaAnexo = null;

		selectedContacto = new Contacto();
	}

	/**
	 * Reiniciar estructuras de datos auxiliares
	 */
	public void limpiarConversacion()
	{
		comunicacion = new Comunicacion();
		selectedConversacion = new Conversacion();
		selectedPalabraClave = new ArrayList<String>();
		cc = new ArrayList<String>();
		destinatariosC="";
		destinatarios = new ArrayList<String>();
		expediente = new Expediente();
		expediente2 = new Expediente();
		rutaAnexo = null;

	}

	/**
	 * Obtener la lista de todos los contactos del sistema
	 * @return
	 */
	public List<Contacto> getContactos()
	{
		return gestionMemorandos.getContactos();
	}

	/**
	 * Obtener la fecha actual
	 * @return
	 */
	public String obtenerFecha()
	{
		Calendar currentDate = Calendar.getInstance(); 
		SimpleDateFormat formatter= new SimpleDateFormat("dd/MM/yyyy HH:mm:ss"); 
		String dateNow = formatter.format(currentDate.getTime());

		return dateNow;
	}

	/**
	 * Lista de las palabras claves
	 * @return
	 */
	public List<String> obtenerPalabrasClaves(String palabra)
	{
		List<String> aux = new ArrayList<String>();  

		for(Palabraclave p : gestionMemorandos.getPalabrasclaves()) 
		{  
			if(p.getPalabra().toLowerCase().startsWith(palabra.toLowerCase()))  
				aux.add(p.getPalabra());  
		}  

		return aux;
	}

	/**
	 * Lista de destinatarios que se muestra en el componente <p:autocomplete /> de la página
	 * @return
	 */
	public List<String> obtenerListaContactos(String contacto)
	{
		List<String> aux = new ArrayList<String>();  

		for(Contacto c : gestionMemorandos.getContactos()) 
		{  
			if( c.getDescripcion().toLowerCase().contains(contacto.toLowerCase()) || c.getNombre().toLowerCase().contains(contacto.toLowerCase()) || c.getUsername().toLowerCase().contains(contacto.toLowerCase()) )  
			{
				aux.add(gestionMemorandos.getContactoRolUnidadOrganizacional(c)+" ("+c.getUsername()+") ");  
			}
		}  

		return aux;
	}

	/**
	 * Lista de destinatarios que se muestra en el componente <p:autocomplete /> de la página
	 * @return
	 */
	public List<String> obtenerListaContactosUnidadOrganizacional(String contacto)
	{
		List<String> aux = new ArrayList<String>();  
		List<Object> lista = gestionMemorandos.getListaUnidadesOrganizacionales();

		for (Object object : lista) 
		{
			for (Contacto c : gestionMemorandos.getContactos()) 
			{
				if(object.toString().equals(c.getIdContacto()))
				{
					aux.add(c.getNombre()+" ("+c.getUsername()+")");  
				}
			}
		}

		return aux;
	}

	/**
	 * Registrar los destinatarios de una comunicación
	 * @param c
	 */
	public List<Contacto> obtenerListaContactosParaComunicacion()
	{
		List<Contacto> aux = new ArrayList<Contacto>();

		if(destinatarios!=null )
		{
			for (String d : destinatarios) 
			{
				for (Contacto c : gestionMemorandos.getContactos()) 
				{
					if(d.toString().contains(c.getUsername()))
					{
						aux.add( c );
					}
				}
			}

			return aux;
		}

		return null;
	}

	/**
	 * Registrar los destinatarios de una comunicación
	 * @param c
	 */
	public String destinatariosParaLaComunicacion()
	{
		List<Contacto> aux = new ArrayList<Contacto>();
		String salida = new String();

		if(destinatarios!=null )
		{
			for (String d : destinatarios) 
			{
				for (Contacto c : gestionMemorandos.getContactos()) 
				{
					if(d.toString().contains(c.getUsername()))
					{
						aux.add( c );
					}
				}
			}

			if(aux.size()==1)
			{
				return aux.get(0).getNombre();
			}

			if(aux.size()==2)
			{
				return aux.get(0).getNombre()+"; "+aux.get(1).getNombre();
			}

			if(aux.size()>2)
			{
				return aux.get(0).getNombre()+"; "+aux.get(1).getNombre()+" y otros";
			}
		}

		return salida;
	}

	/**
	 * Registrar los destinatarios con copia de una comunicación
	 * @param c
	 */
	public List<Contacto> obtenerListaContactosParaComunicacionConCopia()
	{
		List<Contacto> aux = new ArrayList<Contacto>();

		if(cc!=null )
		{
			for (String d : cc) 
			{
				for (Contacto c : gestionMemorandos.getContactos()) 
				{
					if(d.toString().contains(c.getUsername()))
					{
						aux.add( c );
					}
				}
			}

			return aux;
		}

		return null;
	}


	/**
	 * Registrar las palabras claves de una comunicación
	 * @param c
	 */
	public void registrarPalabrasClaves(Comunicacion c)
	{
		if(selectedPalabraClave!=null )
		{
			try
			{
				for (String p : selectedPalabraClave) 
				{
					Palabraclave palabra = gestionMemorandos.getPalabraClave(p);

					Palabradocumento pd = new Palabradocumento();
					pd.setPalabraclave(palabra);
					pd.setDocumentoBean( c );
					gestionMemorandos.registrarPalabraDocumento(pd);
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	}

	/**
	 * Adjuntar un archivo anexo a la comunicación
	 */
	public void upload(FileUploadEvent event) 
	{  
		if(event.getFile()!=null)
		{
			try
			{
				transferFile(event.getFile().getFileName(), event.getFile().getInputstream(), event);

			}catch(Exception e)
			{
				//Logger.getLogger(FileUploadBean.class).log(Level.SEVERE, null, e);
				FacesContext context = FacesContext.getCurrentInstance();
				context.addMessage(null, new FacesMessage("Error", "Error subiendo archivo") );
				e.printStackTrace();
			}
		}


		FacesContext context = FacesContext.getCurrentInstance();
		context.addMessage(null, new FacesMessage("Succesful", event.getFile().getFileName()));
	}  


	private static final int BUFFER_SIZE = 6124;

	/**
	 * Guardar archivo en el servidor
	 * @param filename
	 * @param in
	 */
	public void transferFile(String filename, InputStream in,FileUploadEvent event)
	{
		try {
			anexos= new Anexo();
			anexos.setRuta(destination+filename);

			File result = new File(destination+filename);
			FileOutputStream fileOutputStream = new FileOutputStream(result);

			byte[] buffer = new byte[ BUFFER_SIZE ];

			int bulk;
			InputStream inputStream = event.getFile().getInputstream();
			while (true) {
				bulk = inputStream.read(buffer);
				if (bulk < 0) {
					break;
				}
				fileOutputStream.write(buffer, 0, bulk);
				fileOutputStream.flush();
			}

			fileOutputStream.close();
			inputStream.close();

			//in.close();


		} catch (Exception e) 
		{

		} 
	}

	//private StreamedContent download; 

	/**
	 * Descargar el archivo anexo a la comunicación - REVISAR
	 * @throws IOException
	 */
	public void fileDownloader(String anexo) 
	{   

		String filepath = anexo;
		//String filepath = selectedComunicacion.getAnexo();

		try{
			File fichero = new File(filepath);
			FacesContext ctx = FacesContext.getCurrentInstance();
			@SuppressWarnings("resource")
			FileInputStream fis = new FileInputStream(fichero);
			byte[] bytes = new byte[1000];
			int read = 0;

			if (!ctx.getResponseComplete()) 
			{
				String fileName = fichero.getName();

				MimetypesFileTypeMap mimeTypesMap = new MimetypesFileTypeMap();
				String mimeType = mimeTypesMap.getContentType(filepath);
				mimeType = mimeTypesMap.getContentType(fichero);

				String contentType = mimeType;
				HttpServletResponse response =
						(HttpServletResponse) ctx.getExternalContext().getResponse();

				response.setContentType(contentType);

				response.setHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\"");

				ServletOutputStream out = response.getOutputStream();

				while ((read = fis.read(bytes)) != -1) {
					out.write(bytes, 0, read);
				}

				out.flush();
				out.close();
				ctx.responseComplete();
			}

		}catch(Exception e)
		{
			e.printStackTrace();
		}

	}


	/**
	 * Lista de comunicaciones relacionadas a un expediente
	 * @param idExpediente
	 * @return
	 */
	public List<Comunicacion> comunicacionesDeUnExpediente(String idExpediente)
	{
		List<Documento> lista = gestionMemorandos.listarComunicacionesDeExpediente(idExpediente);
		List<Comunicacion> aux = new ArrayList<Comunicacion>();

		for (Documento documento : lista) 
		{
			aux.add( (Comunicacion) documento);
		}

		return aux;
	}


	/**
	 * Registrar un nuevo expediente en el sistema
	 */
	public void registrarExpediente()
	{
		try
		{
			Expediente exp = new Expediente();
			exp.setFechaCreacion(obtenerFecha());
			exp.setAsunto(expediente.getAsunto());

			if(expediente2!=null)
			{
				if(!expediente2.getIdExpediente().equals("1"))
				{
					exp.setExpedienteBean(expediente2);
				}
			}

			gestionMemorandos.registrarExpediente(exp);	

			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Successful"));
			//------------------- ------- ---------------------
		}
		catch(Exception e)
		{
			//------------------- Mensaje ---------------------
			FacesContext context = FacesContext.getCurrentInstance();  
			context.addMessage(null, new FacesMessage("Algo Salió Mal"));
			//------------------- ------- ---------------------
		}

		limpiar();
	}

	public void leerConversacion()
	{
		FacesContext ctx = FacesContext.getCurrentInstance();
		ExternalContext extContext = ctx.getExternalContext();
		String url = "";

		String estado = selectedComunicacion.getEstadocomunicacion().getEstado();
		String tipo = selectedComunicacion.getTipo();

		try{

			if(tipo.equals("Memorando"))
			{

				if(estado.equals("Registrado"))
				{

					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacion.xhtml")); 
						//extContext.redirect(url);

					}
					if(loginBean.getRol().equals("Secretaria"))
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionS.xhtml")); 
						//extContext.redirect(url);
					}
				}

				if(estado.equals("Elaborado"))
				{

					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionElaboracion.xhtml")); 
						//extContext.redirect(url);

					}
					if(loginBean.getRol().equals("Secretaria"))
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionSElaboracion.xhtml")); 
						//extContext.redirect(url);
					}
				}

				if(estado.equals("Construido"))
				{

					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionConstruccion.xhtml")); 
						//extContext.redirect(url);

					}
					if(loginBean.getRol().equals("Secretaria"))
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionSConstruccion.xhtml")); 
						//extContext.redirect(url);
					}
				}

				if(estado.equals("En Construccion"))
				{

					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionEnConstruccion.xhtml")); 
						//extContext.redirect(url);

					}
					if(loginBean.getRol().equals("Secretaria"))
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionSEnConstruccion.xhtml")); 
						//extContext.redirect(url);
					}
				}

				if(estado.equals("Redactado"))
				{

					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionRedaccion.xhtml")); 
						//extContext.redirect(url);
					}
				}

				if(estado.equals("En Redaccion"))
				{

					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionEnRedaccion.xhtml")); 
						//extContext.redirect(url);

					}
					if(loginBean.getRol().equals("Secretaria"))
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionSEnRedaccion.xhtml")); 
						//extContext.redirect(url);
					}
				}

				if(estado.equals("Aprobado"))
				{

					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionAprobada.xhtml")); 
						//extContext.redirect(url);

					}
					if(loginBean.getRol().equals("Secretaria"))
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionSAprobada.xhtml")); 
						//extContext.redirect(url);
					}
				}
			}

			if(tipo.equals("Comunicacion interna"))
			{

				if(estado.equals("Registrado"))
				{
					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacion1.xhtml")); 
						//extContext.redirect(url);

					}
					if(loginBean.getRol().equals("Secretaria"))
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacion1S.xhtml")); 
						//extContext.redirect(url);
					}
				}

				if(estado.equals("Elaborado"))
				{
					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacion1Elaboracion.xhtml")); 
						//extContext.redirect(url);

					}
					if(loginBean.getRol().equals("Secretaria"))
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacion1SElaboracion.xhtml")); 
						//extContext.redirect(url);
					}
				}

				if(estado.equals("Construido"))
				{
					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacion1Construccion.xhtml")); 
						//extContext.redirect(url);

					}
					if(loginBean.getRol().equals("Secretaria"))
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacion1SConstruccion.xhtml")); 
						//extContext.redirect(url);
					}
				}

				if(estado.equals("En Redaccion"))
				{
					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacion1Construccion.xhtml")); 
						//extContext.redirect(url);

					}
					if(loginBean.getRol().equals("Secretaria"))
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacion1SConstruccion.xhtml")); 
						//extContext.redirect(url);
					}
				}

			}

			extContext.redirect(url);

			conversacion = gestionMemorandos.obtenerMensajesConversacion( selectedConversacion.getIdConversacion()  );

			List<Mensaje> mensajesAux = gestionMemorandos.obtenerMensajesConversacion(selectedConversacion.getIdConversacion()); 

			/**
			 * Aux: último mensaje de una conversación, tiene como finalidad indicar a qué mensaje se le dará repuesta
			 */
			aux = mensajesAux.get(mensajesAux.size()-1);

		}catch(Exception e){
			e.printStackTrace();
		}

	}

	public String getContactosConversacion(Conversacion conversacion)
	{
		List<Mensaje> lista = gestionMemorandos.obtenerMensajesConversacion(conversacion.getIdConversacion());
		String contactos = "";
		List<Contacto> contactosConversacion = new ArrayList<Contacto>();

		for (Mensaje mensaje : lista) 
		{
			Contacto c = gestionMemorandos.buscarContactoPorNombre(mensaje.getDestinatariosCom());

			if(c!=null)
			{
				contactosConversacion.add(c);
			}
		}

		gestionMemorandos.eliminarElementosRepetidos(contactosConversacion);

		return contactos;
	}


	public Comunicacion getComunicacion() {
		return comunicacion;
	}

	public void setComunicacion(Comunicacion comunicacion) {
		this.comunicacion = comunicacion;
	}

	public UploadedFile getFile() {
		return file;
	}

	public void setFile(UploadedFile file) {
		this.file = file;
	}

	//	public List<Contacto> getSelectedContactos() {
	//		return selectedContactos;
	//	}
	//
	//	public void setSelectedContactos(List<Contacto> selectedContactos) {
	//		this.selectedContactos = selectedContactos;
	//	}

	public LoginBean getLoginBean() {
		return loginBean;
	}

	public void setLoginBean(LoginBean loginBean) {
		this.loginBean = loginBean;
	}


	public Comunicacion getSelectedComunicacion() {
		return selectedComunicacion;
	}

	public void setSelectedComunicacion(Comunicacion selectedComunicacion) {
		this.selectedComunicacion = selectedComunicacion;
	}

	public String getRutaComunicacion() {
		return rutaComunicacion;
	}

	public void setRutaComunicacion(String rutaComunicacion) {
		this.rutaComunicacion = rutaComunicacion;
	}

	public List<Mensaje> getConversacion() {
		return conversacion;
	}

	public void setConversacion(List<Mensaje> conversacion) {
		this.conversacion = conversacion;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String observacion) {
		this.comentario = observacion;
	}

	public List<String> getSelectedPalabraClave() {
		return selectedPalabraClave;
	}

	public void setSelectedPalabraClave(List<String> selectedPalabraClave) {
		this.selectedPalabraClave = selectedPalabraClave;
	}

	public List<Contacto> getDirectores()
	{
		return gestionMemorandos.obtenerListaDeDirectores();
	}

	public List<String> getDestinatarios() {
		return destinatarios;
	}

	public void setDestinatarios(List<String> destinatarios) {
		this.destinatarios = destinatarios;
	}

	public List<Expediente> getExpedientes()
	{
		return gestionMemorandos.getExpedientes();		
	}

	/**
	 * Expedientes a los que pertenece una comunicación
	 * @return
	 */
	public String getExpedientesComunicacion()
	{
		List<Expedientedocumento> lista = gestionMemorandos.getExpedientesDeUnaComunicacion(selectedComunicacion.getIdDocumento());
		String aux = "";

		if(lista.size()==1)
		{
			return lista.get(0).getExpedienteBean().getAsunto();
		}
		else
		{
			for (Expedientedocumento expedientedocumento : lista) 
			{
				aux+=expedientedocumento.getExpedienteBean().getAsunto()+", ";
			}
		}

		return aux;
	}

	/**
	 * Seleccionar un contacto del mailbox para enviarle un nuevo mensaje
	 */
	public void seleccionarContactoMailbox()
	{
		FacesContext ctx = FacesContext.getCurrentInstance();
		ExternalContext extContext = ctx.getExternalContext();
		String url = "";
		conversacion = null;

		if(selectedComunicacion==null || selectedComunicacion.getEstadocomunicacion().getEstado().equals("Enviado"))
		{
			destinatarios = new ArrayList<String>();
			destinatarios.add(gestionMemorandos.getContactoRolUnidadOrganizacional(selectedContacto)+" ("+selectedContacto.getUsername()+") ");
			
			if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
			{

				url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/crearMensaje.xhtml")); 
				//extContext.redirect(url);
			}

			if(loginBean.getRol().equals("Secretaria"))
			{
				url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/crearMensajeS.xhtml")); 
				//extContext.redirect(url);
			}
		}
		else
		{
			System.out.println("ID "+selectedComunicacion.getIdDocumento());
			
			/**
			 * Seleccionar un contacto del mailbox para leer el historial de conversaciones asociadas
			 * a una comunicación
			 */
			for (Conversacion cvs : listaConversaciones) 
			{
				if( cvs.getNombreContacto().contains(selectedContacto.getNombre()) )
				{
					System.out.println("entro --> "+cvs.getNombreContacto() +" = "+ selectedContacto.getNombre());
					conversacion = gestionMemorandos.obtenerMensajesConversacion(cvs.getIdConversacion());
					break;
				}
			}
			
			if(conversacion==null)
			{
				return;
			}

			String estado = selectedComunicacion.getEstadocomunicacion().getEstado();
			String tipo = selectedComunicacion.getTipo();
			tab = "1";

			if(tipo.equals("Memorando"))
			{

				if(estado.equals("Registrado"))
				{

					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacion.xhtml")); 
						//extContext.redirect(url);

					}
					if(loginBean.getRol().equals("Secretaria"))
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionS.xhtml")); 
						//extContext.redirect(url);
					}
				}

				if(estado.equals("Elaborado"))
				{

					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionElaboracion.xhtml")); 
						//extContext.redirect(url);

					}
					if(loginBean.getRol().equals("Secretaria"))
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionSElaboracion.xhtml")); 
						//extContext.redirect(url);
					}
				}

				if(estado.equals("Construido"))
				{

					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionConstruccion.xhtml")); 
						//extContext.redirect(url);

					}
					if(loginBean.getRol().equals("Secretaria"))
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionSConstruccion.xhtml")); 
						//extContext.redirect(url);
					}
				}

				if(estado.equals("En Construccion"))
				{

					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionEnConstruccion.xhtml")); 
						//extContext.redirect(url);

					}
					if(loginBean.getRol().equals("Secretaria"))
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionSEnConstruccion.xhtml")); 
						//extContext.redirect(url);
					}
				}

				if(estado.equals("Redactado"))
				{

					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionRedaccion.xhtml")); 
						//extContext.redirect(url);
					}
				}

				if(estado.equals("En Redaccion"))
				{

					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionEnRedaccion.xhtml")); 
						//extContext.redirect(url);

					}
					if(loginBean.getRol().equals("Secretaria"))
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionSEnRedaccion.xhtml")); 
						//extContext.redirect(url);
					}
				}

				if(estado.equals("Aprobado"))
				{

					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionAprobada.xhtml")); 
						//extContext.redirect(url);

					}
					if(loginBean.getRol().equals("Secretaria"))
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacionSAprobada.xhtml")); 
						//extContext.redirect(url);
					}
				}
			}

			if(tipo.equals("Comunicacion interna"))
			{

				if(estado.equals("Registrado"))
				{
					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacion1.xhtml")); 
						//extContext.redirect(url);

					}
					if(loginBean.getRol().equals("Secretaria"))
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacion1S.xhtml")); 
						//extContext.redirect(url);
					}
				}

				if(estado.equals("Elaborado"))
				{
					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacion1Elaboracion.xhtml")); 
						//extContext.redirect(url);

					}
					if(loginBean.getRol().equals("Secretaria"))
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacion1SElaboracion.xhtml")); 
						//extContext.redirect(url);
					}
				}

				if(estado.equals("Construido"))
				{
					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacion1Construccion.xhtml")); 
						//extContext.redirect(url);

					}
					if(loginBean.getRol().equals("Secretaria"))
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacion1SConstruccion.xhtml")); 
						//extContext.redirect(url);
					}
				}

				if(estado.equals("En Redaccion"))
				{
					if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacion1Construccion.xhtml")); 
						//extContext.redirect(url);

					}
					if(loginBean.getRol().equals("Secretaria"))
					{
						url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/leerConversacionComunicacion1SConstruccion.xhtml")); 
						//extContext.redirect(url);
					}
				}
			}
		}

		try {
			extContext.redirect(url);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean verificarPertenenciaContactoAUnaComunicacion(String id)
	{
		List<Mensaje> msj = new ArrayList<Mensaje>();
		List<Contacto> c = new ArrayList<Contacto>();

		if(selectedComunicacion!=null)
		{
			for (Conversacion cvs : listaConversaciones ) 
			{
				msj = gestionMemorandos.obtenerMensajesConversacion(cvs.getIdConversacion());	

				for (Mensaje mensaje : msj) 
				{
					c = gestionMemorandos.obtenerDestinatariosComunicacion(mensaje.getIdDocumento());

					for (Contacto contacto : c) 
					{
						if(contacto.getIdContacto().equals(id))
						{
							return true;
						}
					}
				}
			}
		}

		return false;
	}

	/**
	 * Regresar a la bandeja de entrada de un contacto
	 */
	public void volverBandejaRecibidos()
	{
		FacesContext ctx = FacesContext.getCurrentInstance();
		ExternalContext extContext = ctx.getExternalContext();
		String url = "";

		limpiar();
		
		if(loginBean.getRol().equals("Director") || loginBean.getRol().equals("Decano") || loginBean.getRol().equals("Vicerrector") )
		{
			url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/inicioJefe.xhtml")); 
		}
		
		if(loginBean.getRol().equals("Secretaria"))
		{
			url = extContext.encodeActionURL(ctx.getApplication().getViewHandler().getActionURL(ctx, "/inicioSecre.xhtml")); 
		}

		try {
			extContext.redirect(url);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Expediente getExpediente() {
		return expediente;
	}

	public void setExpediente(Expediente expediente) {
		this.expediente = expediente;
	}

	public List<String> getCc() {
		return cc;
	}

	public void setCc(List<String> cc) {
		this.cc = cc;
	}

	//	public StreamedContent getDownload() {
	//		return download;
	//	}
	//
	//	public void setDownload(StreamedContent download) {
	//		this.download = download;
	//	}

	public String getExpedientesCom() {
		return expedientesCom;
	}

	public void setExpedientesCom(String expedientesCom) {
		this.expedientesCom = expedientesCom;
	}

	public Expediente getExpediente2() {
		return expediente2;
	}

	public void setExpediente2(Expediente expediente2) {
		this.expediente2 = expediente2;
	}

	//	public boolean isExisteAnexo() {
	//		return existeAnexo;
	//	}
	//
	//	public void setExisteAnexo(boolean existeAnexo) {
	//		this.existeAnexo = existeAnexo;
	//	}

	public Conversacion getSelectedConversacion() {
		return selectedConversacion;
	}

	public void setSelectedConversacion(Conversacion selectedConversacion) {
		this.selectedConversacion = selectedConversacion;
	}

	public String getTab() {
		return tab;
	}

	public void setTab(String tab) {
		this.tab = tab;
	}

	public Contacto getSelectedContacto() {
		return selectedContacto;
	}

	public void setSelectedContacto(Contacto selectedContacto) {
		this.selectedContacto = selectedContacto;
	}
	
	/**
	 * Cerrar sesión
	 * @return
	 */
	public String cerrarSesion()
	{
		loginBean.cerrarSesion();
		limpiar();
		
		return "cerrar";
	}


}