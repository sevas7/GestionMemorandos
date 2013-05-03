package negocio;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import bean.ComunicacionComparator;
import bean.ConversacionComparator;
import bean.FechaComparator;
import dao.ActividadDAO;
import dao.ActorDAO;
import dao.ActorRolDAO;
import dao.AnexoDAO;
import dao.AutorDocumentoDAO;
import dao.CalendarioDAO;
import dao.CircularDAO;
import dao.CiudadDAO;
import dao.ComunicacionDAO;
import dao.ComunicacionDestinatarioDAO;
import dao.ComunicacionInternaDAO;
import dao.ContactoDAO;
import dao.ContactoQuienDAO;
import dao.ConversacionDAO;
import dao.CopiaDAO;
import dao.DepositoDAO;
import dao.DireccionDAO;
import dao.DirectorioDAO;
import dao.DocumentoDAO;
import dao.EdificioDAO;
import dao.EstadoActividadDAO;
import dao.EstadoComunicacionDAO;
import dao.ExpedienteDAO;
import dao.ExpedienteDocumentoDAO;
import dao.FechaDAO;
import dao.MemorandoDAO;
import dao.MensajeDAO;
import dao.ObservacionDAO;
import dao.PalabraClaveDAO;
import dao.PalabraClaveDocumentoDAO;
import dao.PaqueteDAO;
import dao.PlantillaDAO;
import dao.ProductoDAO;
import dao.QuienDAO;
import dao.RolDAO;
import dao.SerieDocumentalDAO;
import dao.UnidadOrganizacionalDAO;
import dao.VersionDAO;
import vo.Actividad;
import vo.Actor;
import vo.Actorrol;
import vo.Anexo;
import vo.Autordocumento;
import vo.Circular;
import vo.Ciudad;
import vo.Comunciacioninterna;
import vo.Comunicacion;
import vo.Comunicaciondestinatario;
import vo.Contacto;
import vo.Contactoquien;
import vo.Conversacion;
import vo.Copia;
import vo.Deposito;
import vo.Direccion;
import vo.Directorio;
import vo.Documento;
import vo.Edificio;
import vo.Estadoactividad;
import vo.Estadocomunicacion;
import vo.Expediente;
import vo.Expedientedocumento;
import vo.Fecha;
import vo.Memorando;
import vo.Mensaje;
import vo.Observacion;
import vo.Palabraclave;
import vo.Palabradocumento;
import vo.Paquete;
import vo.Plantilla;
import vo.Producto;
import vo.Quien;
import vo.Rol;
import vo.Seriedocumental;
import vo.Unidadorganizacional;
import vo.Version;

/**
 * Session Bean implementation class GestionMemorandos
 */
@Stateless
@LocalBean
public class GestionMemorandos implements GestionMemorandosRemote {
	@EJB
	private AnexoDAO anexoDAO;
	@EJB
	private ComunicacionDAO comunicacionDAO;

	@EJB
	private MemorandoDAO memorandoDAO;

	@EJB
	private DirectorioDAO directorioDAO;

	@EJB
	private CircularDAO circularDAO;

	@EJB
	private ActividadDAO actividadDAO;

	@EJB
	private PalabraClaveDAO palabraClaveDAO;

	@EJB
	private PlantillaDAO plantillaDAO;

	@EJB
	private ComunicacionInternaDAO comunicacionInternaDAO;

	@EJB
	private ActorDAO actorDAO;

	@EJB
	private RolDAO rolDAO;

	@EJB
	private ObservacionDAO observacionDAO;

	@EJB
	private UnidadOrganizacionalDAO unidadOrganizacionalDAO;

	@EJB
	private EstadoActividadDAO estadoActividadDAO;

	@EJB
	private EstadoComunicacionDAO estadoComunicacionDAO;

	@EJB
	private VersionDAO versionDAO;

	@EJB
	private SerieDocumentalDAO serieDocumentalDAO;

	@EJB
	private ContactoDAO contactoDAO;

	@EJB
	private DocumentoDAO documentoDAO;

	@EJB
	private CiudadDAO ciudadDAO;

	@EJB
	private EdificioDAO edificioDAO;

	@EJB
	private DireccionDAO direccionDAO;

	@EJB
	private AutorDocumentoDAO autorDocumentoDAO;

	@EJB
	private ProductoDAO productoDAO;

	@EJB
	private CopiaDAO copiaDAO;

	@EJB
	private DepositoDAO depositoDAO;

	@EJB
	private ConversacionDAO conversacionDAO;

	@EJB
	private CalendarioDAO calendarioDAO;

	@EJB
	private FechaDAO fechaDAO;

	@EJB
	private PalabraClaveDocumentoDAO palabraClaveDocumentoDAO;

	@EJB
	private QuienDAO quienDAO;

	@EJB
	private ComunicacionDestinatarioDAO comunicacionDestinatarioDAO;

	@EJB
	private PaqueteDAO paqueteDAO;

	@EJB
	private MensajeDAO mensajeDAO;

	@EJB
	private ExpedienteDAO expedienteDAO;

	@EJB
	private ExpedienteDocumentoDAO expedienteDocumentoDAO;

	@EJB
	private ContactoQuienDAO contactoQuienDAO;

	public GestionMemorandos() {
	}

	/**
	 * Registra un nuevo memorando en el sistema
	 */
	@Override
	public void registrarMemorando(Memorando memorando,
			List<Contacto> selectedContactos) {
		memorando.setIdDocumento(obtenerID(getDocumentos()));
		String radicado = "";

		try {
			radicado = generarRadicado(memorando);
		} catch (Exception e) {
			e.printStackTrace();
		}
		memorando.setNumeroRadicado(radicado);
		memorandoDAO.insert(memorando);

		if (selectedContactos != null) {
			for (Contacto contacto : selectedContactos) {
				Comunicaciondestinatario comunicaciondestinatario = new Comunicaciondestinatario();
				comunicaciondestinatario
						.setIdComunicacionDestinatario(obtenerID(getComunicaciondestinatarios()));
				comunicaciondestinatario.setComunicacionBean(memorando);
				comunicaciondestinatario.setContacto(contacto);
				registrarComunicacionDestinatario(comunicaciondestinatario);
			}
		}
	}

	/**
	 * Registra una nueva circular en el sistema
	 */
	@Override
	public void registrarCircular(Circular circular,
			List<Contacto> selectedContactos) {
		circular.setIdDocumento(obtenerID(getDocumentos()));
		circularDAO.insert(circular);

		for (Contacto contacto : selectedContactos) {
			Comunicaciondestinatario comunicaciondestinatario = new Comunicaciondestinatario();
			comunicaciondestinatario
					.setIdComunicacionDestinatario(obtenerID(getComunicaciondestinatarios()));
			comunicaciondestinatario.setComunicacionBean(circular);
			comunicaciondestinatario.setContacto(contacto);
			registrarComunicacionDestinatario(comunicaciondestinatario);
		}
	}

	@Override
	public void registrarActor(Actor actor, List<Rol> roles) {
		// actor.setPassword(actor.getIdQuien());
		actorDAO.insert(actor);
		// -------------------- Tabla Intermedia -------------------
		for (Rol rol : roles) {
			Actorrol actorRol = new Actorrol();
			actorRol.setIdRolActor(obtenerID(getActorRoles()));
			actorRol.setActorBean(actor);
			actorRol.setRolBean(rol);

			registrarActor_Rol(actorRol);
		}
		// ---------------------------------------------------------
	}

	@Override
	public void registrarRol(Rol rol) {
		rolDAO.insert(rol);
	}

	/**
	 * Registra una nueva unidad organizacional en el sistema
	 */
	@Override
	public void registrarUnidadOrganizacional(
			Unidadorganizacional unidadorganizacional) {
		unidadOrganizacionalDAO.insert(unidadorganizacional);

	}

	@Override
	public void registrarActividad(Actividad actividad) {
		actividadDAO.insert(actividad);
	}

	@Override
	public void registrarEstadoActividad(Estadoactividad estadoactividad) {
		estadoActividadDAO.insert(estadoactividad);
	}

	@Override
	public void registrarPlantilla(Plantilla plantilla) {
		plantillaDAO.insert(plantilla);
	}

	@Override
	public void registrarPalabraClave(Palabraclave palabraclave) {
		palabraclave.setIdPalabraClave(obtenerID(getPalabrasclaves()));
		palabraClaveDAO.insert(palabraclave);
	}

	@Override
	public void registrarVersion(Version version) {
		versionDAO.insert(version);
	}

	@Override
	public void registrarSerieDocumental(Seriedocumental seriedocumental) {
		serieDocumentalDAO.insert(seriedocumental);
	}

	@Override
	public List<Memorando> getMemorandos() {
		return memorandoDAO.getAll();
	}

	@Override
	public List<Comunicacion> getComunicaciones() {
		return comunicacionDAO.getAll();
	}

	@Override
	public List<Actividad> getActividades() {
		return actividadDAO.getAll();
	}

	@Override
	public List<Palabraclave> getPalabrasclaves() {
		return palabraClaveDAO.getAll();
	}

	@Override
	public void eliminarComunicacion(Comunicacion comunicacion) {
		comunicacionDAO.remove(comunicacion);
	}

	@Override
	public void actualizarContacto(Contacto contacto) {
		contactoDAO.update(contacto);
	}

	@Override
	public void actualizarComunicacion(Comunicacion comunicacion) {
		comunicacionDAO.update(comunicacion);
	}

	public Actor buscarActor(String username) {
		return actorDAO.buscarActor(username);
	}

	@Override
	public List<Unidadorganizacional> getUnidadorganizacionales() {
		return unidadOrganizacionalDAO.getAll();
	}

	// -----------------------------------------------------------------------------
	@EJB
	private ActorRolDAO actorRolDAO;

	@Override
	public void registrarActor_Rol(Actorrol actorRol) {
		actorRolDAO.insert(actorRol);
	}

	// -----------------------------------------------------------------------------

	@Override
	public List<Rol> getRoles() {
		return rolDAO.getAll();
	}

	@Override
	public List<Actor> getActores() {
		return actorDAO.getAll();
	}

	/**
	 * Obtener un contacto a partir de su ID
	 */
	@Override
	public Contacto obtenerContacto(String id) {
		return contactoDAO.findByKey(id);
	}

	/**
	 * Registra los destinatarios de una comunicación
	 */
	@Override
	public void registrarComunicacionDestinatario(
			Comunicaciondestinatario comunicacionD) {
		comunicacionDestinatarioDAO.insert(comunicacionD);
	}

	/**
	 * Lista de estados de una actividad
	 */
	@Override
	public List<Estadoactividad> getEstadosActividad() {
		return estadoActividadDAO.getAll();
	}

	/**
	 * Lista de estados de comunicación
	 */
	@Override
	public List<Estadocomunicacion> getEstadosComunicacion() {
		return estadoComunicacionDAO.getAll();
	}

	/**
	 * Define el rol del usuario para mostrar su página de inicio
	 */
	@Override
	public Object definirRolDelUsuario(String username, String password) {
		return actorDAO.definirRolUsuario(username, password);
	}

	@Override
	public List<Contacto> getContactos() {
		return contactoDAO.getAll();
	}

	@Override
	public List<Documento> getDocumentos() {
		return documentoDAO.getAll();
	}

	/**
	 * Definir ID consecutivo a los registros de las tablas
	 */
	@SuppressWarnings("rawtypes")
	public String obtenerID(List lista) {
		if (lista.size() > 0) {
			return "" + (lista.size() + 1);

		}
		return "1";
	}

	@Override
	public List<Comunicaciondestinatario> getComunicaciondestinatarios() {
		return comunicacionDestinatarioDAO.getAll();
	}

	@Override
	public List<Actorrol> getActorRoles() {
		return actorRolDAO.getAll();
	}

	@Override
	public void eliminarContacto(Contacto contacto) {
		contactoDAO.remove(contacto);
	}

	@Override
	public void registrarEstadoComunicacion(
			Estadocomunicacion estadocomunicacion) {
		estadoComunicacionDAO.insert(estadocomunicacion);
	}

	@Override
	public List<Comunicacion> obtenerListaComunicacionesEnviadasPorUnContacto(
			String id) {
		return comunicacionDAO.obtenerListaComunicacionesDeContacto(id);
	}

	@Override
	public List<Comunicaciondestinatario> obtenerListaComunicacionesEnviadasAUnContacto(
			String id) {
		return comunicacionDestinatarioDAO.obtenerListaComunicaciones(id);
	}

	@Override
	public void registrarCiudad(Ciudad ciudad) {
		ciudadDAO.insert(ciudad);
	}

	@Override
	public List<Ciudad> getCiudades() {
		return ciudadDAO.getAll();
	}

	@Override
	public void registrarPalabraDocumento(Palabradocumento palabradocumento) {
		palabradocumento
				.setIdPalabraClaveDocumento(obtenerID(getPalabrasDocumento()));
		palabraClaveDocumentoDAO.insert(palabradocumento);
	}

	@Override
	public void registrarEdificio(Edificio edificio) {
		edificioDAO.insert(edificio);
	}

	@Override
	public void registrarDireccion(Direccion direccion) {
		direccionDAO.insert(direccion);
	}

	@Override
	public void registrarDeposito(Deposito deposito) {
		depositoDAO.insert(deposito);
	}

	@Override
	public void registrarCopia(Copia copia) {
		copiaDAO.insert(copia);
	}

	@Override
	public void registrarProducto(Producto producto) {
		productoDAO.insert(producto);
	}

	@Override
	public void registrarAutorDocumento(Autordocumento autordocumento) {
		autorDocumentoDAO.insert(autordocumento);
	}

	@Override
	public void registrarContactoQuien(Contactoquien contactoquien) {
		contactoQuienDAO.insert(contactoquien);
	}

	@Override
	public List<Edificio> getEdificios() {
		return edificioDAO.getAll();
	}

	@Override
	public List<Direccion> getDirecciones() {
		return direccionDAO.getAll();
	}

	@Override
	public List<Deposito> getDepositos() {
		return depositoDAO.getAll();
	}

	@Override
	public List<Quien> getQuienes() {
		return quienDAO.getAll();
	}

	@Override
	public List<Copia> getCopias() {
		return copiaDAO.getAll();
	}

	@Override
	public List<Producto> getProductos() {
		return productoDAO.getAll();
	}

	@Override
	public List<Paquete> getPaquetes() {
		return paqueteDAO.getAll();
	}

	@Override
	public void registrarDirectorio(Directorio directorio) {
		directorioDAO.insert(directorio);
	}

	@Override
	public List<Directorio> getDirectorios() {
		return directorioDAO.getAll();
	}

	@Override
	public void registrarContacto(Contacto contacto) {
		contactoDAO.insert(contacto);
	}

	@Override
	public List<Fecha> getFechas() {
		return fechaDAO.getAll();
	}

	/**
	 * Iniciar sesión
	 */
	@Override
	public Contacto verificarContacto(String username, String password) {
		if (username != null && password != null) {
			Contacto c = contactoDAO.verificarContacto(username, password);

			if (c != null) {
				return c;
			}

		}

		return null;
	}

	@Override
	public Object getRolContacto(String id) {
		return contactoDAO.definirRolContacto(id);
	}

	@Override
	public Contacto buscarContacto(String username) {
		return contactoDAO.buscarContacto(username);
	}

	@Override
	public void registrarMensaje(Mensaje mensaje,
			List<Contacto> selectedContactos) {
		mensaje.setIdDocumento(obtenerID(getDocumentos()));
		mensajeDAO.insert(mensaje);

		if (selectedContactos != null) {
			for (Contacto contacto : selectedContactos) {
				Comunicaciondestinatario comunicaciondestinatario = new Comunicaciondestinatario();
				comunicaciondestinatario
						.setIdComunicacionDestinatario(obtenerID(getComunicaciondestinatarios()));
				comunicaciondestinatario.setComunicacionBean(mensaje);
				comunicaciondestinatario.setContacto(contacto);
				registrarComunicacionDestinatario(comunicaciondestinatario);
			}
		}
	}

	@Override
	public void registrarConversacion(Conversacion conversacion) {
		conversacionDAO.insert(conversacion);
	}

	@Override
	public List<Conversacion> getConversaciones() {
		return conversacionDAO.getAll();
	}

	@Override
	public List<Mensaje> obtenerMensajesConversacion(String conversacion,
			String contacto) {
		return mensajeDAO.obtenerMensajesConversacion(conversacion, contacto);
	}

	@Override
	public String obtenerUnidadOrganizacionalContacto(String id) {
		return contactoDAO.obtenerUnidadOrganizacionalContacto(id).toString();
	}

	@Override
	public List<Comunicacion> obtenerTodasLasComunicacionesDeUnaUnidadOrganizacional(
			String id) {
		return comunicacionDAO.obtenerTodasLasComunicacionesDeUnaUO(id);
	}

	@Override
	public void registrarObservacion(Observacion observacion) {
		observacion.setIdObservacion(obtenerID(getObservaciones()));
		observacionDAO.insert(observacion);
	}

	@Override
	public List<Observacion> getObservaciones() {
		return observacionDAO.getAll();
	}

	@Override
	public List<Contactoquien> getContactoquienes() {
		return contactoQuienDAO.getAll();
	}

	@Override
	public void actualizarComunicacionDestinatario(
			Comunicaciondestinatario comunicaciondestinatario) {
		comunicacionDestinatarioDAO.update(comunicaciondestinatario);
	}

	@Override
	public void actualizarActor(Actor actor) {
		actorDAO.update(actor);
	}

	@Override
	public void actualizarDocumento(Documento documento) {
		documentoDAO.update(documento);
	}

	@Override
	public Object idContactoDeUnidadOrganizacional(String id) {
		return contactoDAO.idContactoDeUnidadOrganizacional(id);
	}

	@Override
	public List<Observacion> obtenerObservaciones(String id) {
		return observacionDAO.obtenerObservaciones(id);
	}

	@Override
	public void log() {
		/**
		 * COMPLETAR
		 */
	}

	@Override
	public List<Palabradocumento> getPalabrasDocumento() {
		return palabraClaveDocumentoDAO.getAll();
	}

	@Override
	public Palabraclave getPalabraClave(String palabra) {
		return palabraClaveDAO.getPalabraClave(palabra);
	}

	@Override
	public List<Conversacion> agruparMensajesPorConversacion(String id) {
		return mensajeDAO.agruparMensajesPorConversacion(id);
	}

	@Override
	public List<Contacto> obtenerDestinatariosComunicacion(String id) {
		return comunicacionDestinatarioDAO.getDestinatariosComunicacion(id);
	}

	/**
	 * Ordenar lista de comunicaciones según la fecha
	 * 
	 * @param lista
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void ordenar(List lista) {
		Collections.sort(lista, new FechaComparator());

	}

	/**
	 * Ordenar lista de comunicaciones según su ID
	 * 
	 * @param lista
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void ordenarPrueba(List lista) {
		Collections.sort(lista, new ComunicacionComparator());

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void ordenarConversacion(List lista) {
		Collections.sort(lista, new ConversacionComparator());

	}

	@Override
	public List<Object> obtenerMensajesConversacionContacto(
			String conversacion, String contacto) {
		return mensajeDAO.obtenerMensajesConversacionContacto(conversacion,
				contacto);
	}

	@Override
	public Mensaje buscarMensaje(String id) {
		return mensajeDAO.findByKey(id);
	}

	@Override
	public List<Palabraclave> listarPalabrasClavesDocumento(String id) {
		return palabraClaveDocumentoDAO.listarPalabrasClavesDocumento(id);
	}

	@Override
	public List<Mensaje> obtenerMensajesConversacion(String conversacion) {
		return mensajeDAO.obtenerMensajesConversacion(conversacion);
	}

	@Override
	public void iniciarLog() throws Exception {
		// Logger logger=Logger.getLogger(GestionMemorandos.class);
		// LogManager.getLogManager().readConfiguration( new
		// FileInputStream("archivo.log"));
	}

	@Override
	public Estadocomunicacion getEstado(String estadoComunicacion) {
		return estadoComunicacionDAO
				.obtenerEstadoComunicacion(estadoComunicacion);
	}

	/**
	 * Obtiene la lista de directores de programas de la universidad del quindío
	 */
	@Override
	public List<Contacto> obtenerListaDeDirectores() {
		List<String> aux = contactoDAO.getAllDirectores();
		List<Contacto> directores = new ArrayList<Contacto>();

		for (String idContacto : aux) {
			Contacto c = contactoDAO.findByKey(idContacto);
			directores.add(c);
		}

		return directores;
	}

	/**
	 * Registra una nueva comunicación interna en el sistema
	 */
	@Override
	public void registrarComunicacionInterna(
			Comunciacioninterna comunicacionInterna,
			List<Contacto> selectedContactos, List<Anexo> anexos) {
		comunicacionInterna.setIdDocumento(obtenerID(getDocumentos()));
		String id= comunicacionInterna.getIdDocumento();
		comunicacionInternaDAO.insert(comunicacionInterna);

		if (selectedContactos != null) {
			for (Contacto contacto : selectedContactos) {
				Comunicaciondestinatario comunicaciondestinatario = new Comunicaciondestinatario();
				comunicaciondestinatario
						.setIdComunicacionDestinatario(obtenerID(getComunicaciondestinatarios()));
				comunicaciondestinatario
						.setComunicacionBean(comunicacionInterna);
				comunicaciondestinatario.setContacto(contacto);
				registrarComunicacionDestinatario(comunicaciondestinatario);
			}
		}
		if (anexos!=null) {
			for (Anexo anexo : anexos) {
				
				anexo.setDocumento(buscarDocumento(id));
				anexo.setIdAnexo(obtenerID(getAnexos()));
				registrarAnexo(anexo);
			}
		}
		
		
	}

	@Override
	public Comunicacion obtenerComunicacion(String id) {
		return comunicacionDAO.findByKey(id);
	}

	/**
	 * Obtiene el nombre del contacto junto a su rol y la unidad organizacional
	 * a la que pertenece
	 */
	@Override
	public String getContactoRolUnidadOrganizacional(Contacto contacto) {
		String aux = "";

		if (getRolContacto(contacto.getIdContacto()) != null
				&& nombreUnidadOrganizacional(obtenerUnidadOrganizacionalContacto(contacto
						.getIdContacto())) != null) {
			aux += ""
					+ contacto.getNombre()
					+ " - "
					+ getRolContacto(contacto.getIdContacto()).toString()
					+ " "
					+ nombreUnidadOrganizacional(obtenerUnidadOrganizacionalContacto(contacto
							.getIdContacto())) + " ";

		} else {
			aux += contacto.getNombre();
		}

		return aux;
	}

	/**
	 * Obtener el nombre de una unidad organizacional
	 * 
	 * @param id
	 *            ID de la unidad organizacional
	 * @return
	 */
	public String nombreUnidadOrganizacional(String id) {
		for (Unidadorganizacional uo : getUnidadorganizacionales()) {
			if (uo.getIdQuien().equals(id))
				return uo.getNombre();
		}

		return "";
	}

	@Override
	public List<Expediente> getExpedientes() {
		return expedienteDAO.getAll();
	}

	@Override
	public void registrarExpediente(Expediente e) {
		e.setIdExpediente(obtenerID(getExpedientes()));
		expedienteDAO.insert(e);
	}

	@Override
	public List<Expedientedocumento> getExpedientesDocumento() {
		return expedienteDocumentoDAO.getAll();
	}

	@Override
	public void registrarExpedienteDocumento(Expedientedocumento e) {
		e.setIdExpDoc(obtenerID(getExpedientesDocumento()));
		expedienteDocumentoDAO.insert(e);
	}

	@Override
	public List<Expedientedocumento> getExpedientesDeUnaComunicacion(
			String idComunicacion) {
		return expedienteDocumentoDAO
				.getExpedientesDeUnaComunicacion(idComunicacion);
	}

	/**
	 * Lista en una cadeda String los expedientes a los que pertenece una
	 * comunicación
	 */
	public String expedientesComunicacion(String idComunicacion) {
		List<Expedientedocumento> ed = getExpedientesDeUnaComunicacion(idComunicacion);
		String exp = "";

		for (Expedientedocumento expedientedocumento : ed) {
			exp += expedientedocumento.getExpedienteBean().getIdExpediente()
					+ " - "
					+ expedientedocumento.getExpedienteBean().getAsunto();
		}

		return exp;
	}

	@Override
	public List<Comunicacion> obtenerTodasLasComunicacionesEnConstruccion(
			String idUnidadO) {
		return comunicacionDAO
				.obtenerTodasLasComunicacionesEnConstruccion(idUnidadO);
	}

	@Override
	public List<Contacto> obtenerDestinatariosConCopiaComunicacion(
			String idComunicacion) {
		return comunicacionDestinatarioDAO
				.getDestinatariosConCopiaComunicacion(idComunicacion);
	}

	/**
	 * Generar el número de radicado de una comunicación
	 * "R (consecutivo)- (año) "
	 */
	@Override
	public String generarRadicado(Comunicacion com) throws Exception {
		String id = com.getIdDocumento();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date fecha = sdf.parse(com.getFechaCreacion());
		String anio = new SimpleDateFormat("yy").format(fecha);

		return "R" + id + "-" + anio;
	}

	@Override
	public List<Comunicacion> obtenerTodasLasComunicacionesEnRedaccion(
			String idUnidadO) {
		return comunicacionDAO
				.obtenerTodasLasComunicacionesEnRedaccion(idUnidadO);
	}

	@Override
	public List<Comunicacion> obtenerTodasLasComunicacionesRegistradas(
			String idUnidadO) {
		return comunicacionDAO
				.obtenerTodasLasComunicacionesRegistradas(idUnidadO);
	}

	@Override
	public List<Comunicacion> obtenerTodasLasComunicacionesRedactadas(String id) {
		return comunicacionDAO.obtenerTodasLasComunicacionesRedactadas(id);
	}

	@Override
	public List<Documento> listarComunicacionesDeExpediente(String idExpediente) {
		return expedienteDocumentoDAO
				.listarComunicacionesDeExpediente(idExpediente);
	}

	@Override
	public Comunicaciondestinatario buscarComunicacionDestinatario(String id) {
		return comunicacionDestinatarioDAO.findByKey(id);
	}

	@Override
	public List<Object> getListaUnidadesOrganizacionales() {
		return contactoDAO.getListaUnidadesOrganizacionales();
	}

	@Override
	public List<Conversacion> listaConversacionesDeUnaComunicacion(
			String idComunicacion) {
		return conversacionDAO
				.listaConversacionesDeUnaComunicacion(idComunicacion);
	}

	@Override
	public void crearConversacion(Conversacion conversacion) {
		conversacionDAO.insert(conversacion);
	}

	@Override
	public Conversacion getConversacion(String id) {
		return conversacionDAO.findByKey(id);
	}

	@Override
	public void actualizarConversacion(Conversacion conversacion) {
		conversacionDAO.update(conversacion);
	}

	@Override
	public Contacto buscarContactoPorNombre(String nombre) {
		return buscarContactoPorNombre(nombre);
	}

	/**
	 * Eliminar comunicaciones repetidas de una lista
	 * 
	 * @param lista
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void eliminarElementosRepetidos(List lista) {
		// Creamos un objeto HashSet
		HashSet hs = new HashSet();

		// Lo cargamos con los valores del array, esto hace quite los repetidos
		hs.addAll(lista);

		// Limpiamos el array
		lista.clear();

		// Agregamos los valores sin repetir
		lista.addAll(hs);
	}

	@Override
	public List<Object> listarContactosDeUnidadOrganizacional(String uo) {
		return contactoDAO.listarContactosDeUnidadOrganizacional(uo);
	}

	@Override
	public Contacto buscarContactoID(String id) {
		return contactoDAO.findByKey(id);
	}

	@Override
	public void registrarAnexo(Anexo anexo) {

		anexoDAO.insert(anexo);
	}

	@Override
	public List<Anexo> getAnexos() {
		// TODO Auto-generated method stub
		return anexoDAO.getAll();
	}

	@Override
	public Documento buscarDocumento(String id) {
		// TODO Auto-generated method stub
		return documentoDAO.findByKey(id);
	}
}