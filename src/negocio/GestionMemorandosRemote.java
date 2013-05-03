package negocio;

import java.util.List;
import javax.ejb.Remote;
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

@Remote
public interface GestionMemorandosRemote {
	
	//------ Registros -------
	
	/**
	 * Registrar un nuevo memorando en el sistema
	 * @param memorando
	 */
	public void registrarMemorando(Memorando memorando, List<Contacto> selectedContactos);
	
	public void registrarCircular(Circular circular, List<Contacto> selectedContactos);
	
	public void registrarActor(Actor actor, List<Rol> roles);
	
	public void registrarRol(Rol rol);
	
	public void registrarUnidadOrganizacional(Unidadorganizacional unidadorganizacional);
	
	public void registrarActividad(Actividad actividad);
	
	public void registrarEstadoActividad(Estadoactividad estadoactividad);
	
	public void registrarEstadoComunicacion(Estadocomunicacion estadocomunicacion);
	
	public void registrarPlantilla(Plantilla plantilla);
	
	public void registrarContacto(Contacto contacto);
	
	public void registrarPalabraClave(Palabraclave palabraclave);
	
	public void registrarPalabraDocumento(Palabradocumento palabradocumento);
	
	public void registrarVersion(Version version);
			
	public void registrarSerieDocumental(Seriedocumental seriedocumental);
	
	public void registrarActor_Rol(Actorrol actorRol);
	
	public void registrarComunicacionDestinatario(Comunicaciondestinatario comunicacionD);
	
	public void registrarCiudad(Ciudad ciudad);
	
	public void registrarEdificio(Edificio edificio);
	
	public void registrarDireccion(Direccion direccion);
	
	public void registrarDeposito(Deposito deposito);
	
	public void registrarCopia(Copia copia);
	
	public void registrarProducto(Producto producto);
	
	public void registrarAutorDocumento(Autordocumento autordocumento);
	
	public void registrarContactoQuien(Contactoquien contactoquien);
	
	public void registrarDirectorio(Directorio directorio);
	
	public void registrarMensaje(Mensaje mensaje, List<Contacto> selectedContactos );
	
	public void registrarConversacion(Conversacion conversacion);
	
	public void registrarObservacion(Observacion observacion);
	
	public void registrarAnexo(Anexo anexo);
	
	//--------- Listas -----
	public List<Anexo> getAnexos();
	
	public List<Memorando> getMemorandos();
	
	public List<Comunicacion> getComunicaciones();
	
	public List<Actividad> getActividades();
	
	public List<Palabraclave> getPalabrasclaves();
	
	public List<Unidadorganizacional> getUnidadorganizacionales();
	
	public List<Rol> getRoles();
	
	public List<Actor> getActores();
	
	public List<Estadoactividad> getEstadosActividad();
	
	public List<Estadocomunicacion> getEstadosComunicacion();
	
	public List<Contacto> getContactos();
	
	public List<Documento> getDocumentos();
	
	public List<Comunicaciondestinatario> getComunicaciondestinatarios();
	
	public List<Actorrol> getActorRoles();
	
	public List<Ciudad> getCiudades();
	
	public List<Edificio> getEdificios();
	
	public List<Direccion> getDirecciones();
	
	public List<Deposito> getDepositos();
	
	public List<Quien> getQuienes();
	
	public List<Copia> getCopias();
	
	public List<Producto> getProductos();
	
	public List<Paquete> getPaquetes();
	
	public List<Directorio> getDirectorios();
	
	public List<Fecha> getFechas();
	
	public List<Conversacion> getConversaciones();
	
	public Conversacion getConversacion(String id);
	
	public List<Observacion> getObservaciones();
	
	public List<Contactoquien> getContactoquienes();
	
	public List<Palabradocumento> getPalabrasDocumento();
	
	
	//--------- Eliminación --------
	
	public void eliminarComunicacion(Comunicacion comunicacion);
	
	public void eliminarContacto(Contacto contacto);
	
	
	//--------- Actualización ------
	
	public void actualizarContacto(Contacto contacto);
	
	public void actualizarConversacion(Conversacion conversacion);
	
	public void actualizarComunicacion(Comunicacion comunicacion);
	
	public void actualizarComunicacionDestinatario(Comunicaciondestinatario comunicaciondestinatario);
	
	public void actualizarActor(Actor actor);
	
	public void actualizarDocumento(Documento documento);

	//--------- Consultas ----------
	
	public Documento buscarDocumento(String id);
	
	public List<Comunicacion> obtenerListaComunicacionesEnviadasPorUnContacto(String id);
	
	public List<Comunicaciondestinatario> obtenerListaComunicacionesEnviadasAUnContacto(String id);

	public Contacto obtenerContacto(String id);
	
	public Contacto verificarContacto(String username, String password);
	
	public Object definirRolDelUsuario(String username, String password);
	
	public Object getRolContacto(String id);
	
	@SuppressWarnings("rawtypes")
	public String obtenerID(List lista);
	
	public Actor buscarActor(String username);
	
	public Contacto buscarContacto(String username);
	
	public Comunicaciondestinatario buscarComunicacionDestinatario(String id);
	
	public List<Mensaje> obtenerMensajesConversacion(String conversacion);
	
	public List<Mensaje> obtenerMensajesConversacion(String conversacion, String contacto);
	
	public String obtenerUnidadOrganizacionalContacto(String id);
	
	public List<Comunicacion> obtenerTodasLasComunicacionesDeUnaUnidadOrganizacional(String id);
	
	public Object idContactoDeUnidadOrganizacional(String id);
	
	public List<Observacion> obtenerObservaciones(String id);
	
	public Palabraclave getPalabraClave(String palabra);
	
	public void log();
	
	public List<Conversacion> agruparMensajesPorConversacion(String id);
	
	public List<Contacto> obtenerDestinatariosComunicacion(String id);
	
	public List<Contacto> obtenerDestinatariosConCopiaComunicacion(String id);
	
	@SuppressWarnings("rawtypes")
	public void ordenar(List lista);
	
	public List<Object> obtenerMensajesConversacionContacto(String conversacion, String contacto);
	
	public Mensaje buscarMensaje(String id);
	
	public List<Palabraclave> listarPalabrasClavesDocumento(String id);
	
	public void iniciarLog() throws Exception;
	
	public Estadocomunicacion getEstado(String estadoComunicacion);
	
	public List<Contacto> obtenerListaDeDirectores();
	
	public void registrarComunicacionInterna(Comunciacioninterna comunicacionInterna, List<Contacto> selectedComunicacion, List<Anexo> anexos);
	
	public Comunicacion obtenerComunicacion(String id);
	
	public String getContactoRolUnidadOrganizacional(Contacto contacto);
	
	public String nombreUnidadOrganizacional(String id);
	
	public List<Expediente> getExpedientes();
	
	public void registrarExpediente(Expediente e);
	
	public void crearConversacion(Conversacion conversacion);
	
	public List<Expedientedocumento> getExpedientesDocumento();
	
	public void registrarExpedienteDocumento(Expedientedocumento e);
	
	public List<Expedientedocumento> getExpedientesDeUnaComunicacion(String idComunicacion);
	
	public String expedientesComunicacion(String idComunicacion);
	
	public List<Comunicacion> obtenerTodasLasComunicacionesEnConstruccion(String idUnidadO);
	
	public List<Comunicacion> obtenerTodasLasComunicacionesEnRedaccion(String id);
	
	public List<Comunicacion> obtenerTodasLasComunicacionesRegistradas(String id);
	
	public List<Comunicacion> obtenerTodasLasComunicacionesRedactadas(String id);
	
	public List<Documento> listarComunicacionesDeExpediente(String id);
	
	public String generarRadicado(Comunicacion com) throws Exception;
	
	public List<Object> getListaUnidadesOrganizacionales();
	
	public List<Conversacion> listaConversacionesDeUnaComunicacion(String idComunicacion);
	
	public Contacto buscarContactoPorNombre(String nombre);
	
	@SuppressWarnings("rawtypes")
	public void eliminarElementosRepetidos(List lista);
	
	public List<Object> listarContactosDeUnidadOrganizacional(String uo);
	
	public Contacto buscarContactoID(String id);
	
}