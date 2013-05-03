package test;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import negocio.GestionMemorandosRemote;
import org.junit.Test;
import vo.Actividad;
import vo.Actor;
import vo.Comunciacioninterna;
import vo.Comunicacion;
import vo.Comunicaciondestinatario;
import vo.Contacto;
import vo.Contactoquien;
import vo.Directorio;
import vo.Edificio;
import vo.Estadoactividad;
import vo.Expediente;
import vo.Expedientedocumento;
import vo.Memorando;
import vo.Mensaje;
import vo.Observacion;
import vo.Rol;
import vo.Unidadorganizacional;

public class GestionMemorandosTest implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	List<Contacto> listaContactos;

	@Test
	public void testRegistrarMemorando() throws Exception 
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().lookup(
				"java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");

		Memorando memorando = new Memorando();
		Contacto remitente = new Contacto();
		remitente = listaContactos.get(1);
		String uo = miEjb.obtenerUnidadOrganizacionalContacto(listaContactos.get(1).getIdContacto());

		memorando.setAsunto("Asunto del memorando prueba");
		memorando.setTitulo("tituloMemorando");
		memorando.setContenidoCom("Contenido del memorando ");
		memorando.setFechaCreacion(obtenerFecha());
		memorando.setEstadocomunicacion(miEjb.getEstadosComunicacion().get(0)); //Estado: Registrado
		memorando.setContacto(remitente); // Remitente
		memorando.setLeido("NO"); // LEÍDO: NO
		memorando.setTipo("Memorando");
		memorando.setUnidadOrganizacional(uo); //Unidad Organizacional

		List<Contacto> destinatarios = new ArrayList<Contacto>();
		destinatarios.add( listaContactos.get(5) );

		miEjb.registrarMemorando(memorando, destinatarios);
	}

	@Test
	public void consultarComunicacion() throws NamingException 
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().lookup(
				"java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");

		Comunciacioninterna c = new Comunciacioninterna();
		Contacto remitente = new Contacto();
		remitente = miEjb.obtenerContacto("2");

		c.setIdDocumento( miEjb.obtenerID( miEjb.getComunicaciones() ) );  //Autogenerado
		c.setAsunto("Asunto del memorando prueba");
		c.setTitulo("tituloMemorando");
		c.setContenidoCom("Contenido ");
		c.setFechaCreacion(obtenerFecha());
		c.setContacto(remitente);
		c.setEstadocomunicacion(miEjb.getEstadosComunicacion().get(0));
		c.setLeido("NO"); // LEÍDO: NO
		c.setTipo("Comunicación Interna");

		miEjb.registrarComunicacionInterna(c, null, null);
	}

	@Test
	public void testListaEdificio() throws NamingException
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().lookup("java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");

		List<Expedientedocumento> e = miEjb.getExpedientesDeUnaComunicacion("6");

		if(e!=null)
		{
			System.out.println(e.size());
			for (Expedientedocumento expediente : e) 
			{
				System.out.println(expediente.getExpedienteBean().getAsunto());				
			}
		}
		else
			System.out.println("nulo");
	}

	@Test
	public void testListaDirectores() throws NamingException
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().lookup("java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");

		List<Contacto> c = miEjb.obtenerListaDeDirectores();

		for (Contacto contacto : c) 
		{
			System.out.println(contacto.getNombre());			
		}
	}

	@Test
	public void testRegistroExp() throws NamingException
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().lookup("java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");

		Expediente exp = new Expediente();

		exp.setAsunto("Registros 20131");
		exp.setFechaCreacion(obtenerFecha());
		miEjb.registrarExpediente(exp);
	}

	@Test
	public void testEnviarMensaje() throws NamingException 
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().lookup("java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");

		Mensaje mensaje = new Mensaje();
		Contacto remitente = new Contacto();
		remitente = listaContactos.get(1);
		String uo = miEjb.obtenerUnidadOrganizacionalContacto(listaContactos.get(1).getIdContacto());

		mensaje.setAsunto("Asunto");
		mensaje.setContenidoCom("Contenido del mensaje");
		mensaje.setFechaCreacion(obtenerFecha());
		mensaje.setEstadocomunicacion(miEjb.getEstadosComunicacion().get(3)); //Estado: Registrado

		mensaje.setContacto(remitente); // Remitente 
		mensaje.setUnidadOrganizacional(uo);
		mensaje.setLeido("NO"); 
		mensaje.setTipo("Mensaje");
		mensaje.setConversacion( miEjb.getConversaciones().get(0) );

		List<Contacto> destinatarios = new ArrayList<Contacto>();
		destinatarios.add( listaContactos.get(5) );
		destinatarios.add( listaContactos.get(4) );

		miEjb.registrarMensaje(mensaje, destinatarios);
	}


	@Test
	public void testRegistrarUnidadOrganizacional() throws NamingException
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().lookup("java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");

		Unidadorganizacional unidadorganizacional = new Unidadorganizacional();

		unidadorganizacional.setIdQuien(miEjb.obtenerID(miEjb.getQuienes()));
		unidadorganizacional.setNombre("Ingeniería Electrónica");
		unidadorganizacional.setDescripcion("Ingelec");
		unidadorganizacional.setEdificioBean(miEjb.getEdificios().get(0));
		unidadorganizacional.setUnidadorganizacionalBean(miEjb.getUnidadorganizacionales().get(0));

		miEjb.registrarUnidadOrganizacional(unidadorganizacional);

	}

	@Test
	public void testRegistrarEdificio() throws NamingException
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().lookup("java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");


		Edificio edificio = new Edificio();

		edificio.setIdPaquete("99");
		edificio.setNombre("Facultad Ingeniería");
		edificio.setDireccionBean(miEjb.getDirecciones().get(0));
		miEjb.registrarEdificio(edificio);

	}

	@Test
	public void testRegistrarEstado() throws NamingException
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().lookup("java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");

		Estadoactividad ea = new Estadoactividad();

		ea.setIdEstadoActividad( miEjb.obtenerID( miEjb.getEstadosActividad() ));
		ea.setEstado("Abierta");
		ea.setDescripcion("Abierta");

		miEjb.registrarEstadoActividad(ea);

	}

	@Test
	public void testRegistrarROL() throws NamingException
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().lookup("java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");

		Rol rol = new Rol();

		rol.setIdQuien(miEjb.obtenerID(miEjb.getQuienes()));
		rol.setNombre("Director");
		rol.setDescripcion("Director del Programa");
		rol.setUnidadorganizacional(miEjb.getUnidadorganizacionales().get(1));

		miEjb.registrarRol(rol);
	}

	@Test
	public void testRegistrarActor() throws NamingException
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().lookup("java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");

		Actor actor = new Actor();

		actor.setIdQuien(miEjb.obtenerID(miEjb.getQuienes()));
		actor.setNombre("Carlos Andrés");
		actor.setApellido("Florez");
		actor.setEmail("caflorezvi@gmail.com");

		List<Rol> roles = new ArrayList<Rol>();

		roles.add(miEjb.getRoles().get(0));

		miEjb.registrarActor(actor, roles);

	}

	@Test
	public void testRegistrarDirectorio() throws NamingException
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().lookup("java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");

		Directorio directorio = new Directorio();
		directorio.setIdPaquete(""+(miEjb.getPaquetes().size()+1));
		directorio.setNombre("DirectorioUQ");
		directorio.setDescripcion("Directorio Uniquindio");
		miEjb.registrarDirectorio(directorio);
	}

	@Test
	public void testRegistrarContacto() throws NamingException
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().lookup("java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");

		Contacto contacto = new Contacto();

		contacto.setIdContacto(miEjb.obtenerID(miEjb.getContactos()));
		contacto.setNombre("Director Inesis");
		contacto.setTelefono("3125342109");
		contacto.setEmail("lesepulveda@uniquindio.edu.co");
		//contacto.setUsername("ingesis");
		contacto.setDireccionBean(miEjb.getDirecciones().get(0));
		contacto.setDirectorioBean(miEjb.getDirectorios().get(0));

		miEjb.registrarContacto(contacto);

		//---------------------Tabla Inter---------------
		Contactoquien contactoquien = new Contactoquien();

		contactoquien.setIdContactoQuien("1");
		contactoquien.setContactoBean(contacto);
		contactoquien.setQuienBean(miEjb.getQuienes().get(5));

		miEjb.registrarContactoQuien(contactoquien);

	}


	@Test
	public void registrarActividadTest() throws NamingException
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().lookup("java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");

		Actividad actividad = new Actividad();
		actividad.setIdActividad(""+(miEjb.getActividades().size()+1));  //Autogenereado
		actividad.setNombre("Actividad2");
		actividad.setDescripcion("Asignar bla bla bla");
		actividad.setEstadoactividad(miEjb.getEstadosActividad().get(0));
		actividad.setMemorandoBean(miEjb.getMemorandos().get(0));
		miEjb.registrarActividad(actividad);
	}

	@Test
	public void obtenerRolTest() throws NamingException
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().lookup("java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");

		System.out.println(miEjb.getRolContacto("2").toString());

	}

	@Test
	public void testBandejaEntrada() throws Exception
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().
				lookup("java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");

		List<Comunicaciondestinatario> bandejaEntrada =	miEjb.obtenerListaComunicacionesEnviadasAUnContacto("2");

		for (Comunicaciondestinatario comunicacion : bandejaEntrada) 
		{
			System.out.println("Aunto: '"+comunicacion.getComunicacionBean().getAsunto()+
					"' De: '"+comunicacion.getComunicacionBean().getContacto().getNombre()+
					"' Fecha: '"+comunicacion.getComunicacionBean().getFechaCreacion()+
					"' Comunicación: '"+comunicacion.getComunicacionBean().getTipo()+
					"' Leído: '"+comunicacion.getComunicacionBean().getLeido()+"'" );
		}
	}

	@Test
	public void testBandejaRegistrados() throws Exception
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().
				lookup("java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");

		List<Comunicacion> bandejaUO = miEjb.obtenerTodasLasComunicacionesDeUnaUnidadOrganizacional("2");
		List<Comunicacion> bandejaUnidadOrganizacional = new ArrayList<Comunicacion>();


		for(Comunicacion c : bandejaUO)
		{
			if(!c.getTipo().equals("Mensaje") && !c.getEstadocomunicacion().getEstado().equals("Aprobado"))
			{
				bandejaUnidadOrganizacional.add(c);
			}
		}

		//		for (Comunicacion comunicacion : bandejaUnidadOrganizacional) 
		//		{
		//			System.out.println("Aunto: '"+comunicacion.getComunicacionBean().getAsunto()+
		//					         "' De: '"+comunicacion.getComunicacionBean().getContacto().getNombre()+
		//					         "' Fecha: '"+comunicacion.getComunicacionBean().getFechaCreacion()+
		//					         "' Comunicación: '"+comunicacion.getComunicacionBean().getTipo()+
		//					         "' Leído: '"+comunicacion.getComunicacionBean().getLeido()+"'" );
		//		}

	}

	@Test
	public void testBandejaSalida() throws Exception
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().
				lookup("java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");

		List<Comunicacion> bandejaSalida =	miEjb.obtenerListaComunicacionesEnviadasPorUnContacto("2");

		for (Comunicacion comunicacion : bandejaSalida) 
		{
			System.out.println("Aunto: '"+comunicacion.getAsunto()+
					"' De: '"+comunicacion.getContacto().getNombre()+
					"' Fecha: '"+comunicacion.getFechaCreacion()+
					"' Comunicación: '"+comunicacion.getTipo()+
					"' Leído: '"+comunicacion.getLeido()+"'" );
		}
	}

	@Test
	public void testEnviarComunicacion() throws Exception
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().
				lookup("java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");

		Comunicacion selectedComunicacion = miEjb.getComunicaciones().get(20); 

		selectedComunicacion.setFechaCreacion(obtenerFecha());

		selectedComunicacion.setEstado("NO");
		miEjb.actualizarComunicacion(selectedComunicacion);		
	}

	@Test
	public void testEditarComunicacion() throws Exception
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().
				lookup("java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");

		Comunicacion selectedComunicacion = miEjb.getComunicaciones().get(20); 

		selectedComunicacion.setContenidoCom("Contenido nuevo");
		selectedComunicacion.setAsunto("Asunto nuevo");

		selectedComunicacion.setFechaCreacion(obtenerFecha());

		selectedComunicacion.setEstado("NO");
		miEjb.actualizarComunicacion(selectedComunicacion);		
	}

	@Test
	public void testRegistrarObservaciones() throws Exception
	{
		GestionMemorandosRemote miEjb=(GestionMemorandosRemote) new InitialContext().
				lookup("java:global/gestionMemorandos/GestionMemorandos!negocio.GestionMemorandosRemote");

		Comunicacion selectedComunicacion = miEjb.getComunicaciones().get(20); 
		String comentario = "Observación";

		Observacion observacion = new Observacion();
		observacion.setObservacion(comentario);
		observacion.setDocumento(selectedComunicacion);
		miEjb.registrarObservacion(observacion);
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

}
