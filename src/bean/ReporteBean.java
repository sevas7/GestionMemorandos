package bean;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.HashMap;
import java.util.Map;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;

public class ReporteBean {
	
	private String rutaCom;

	/**
	 * Genera el reporte de todos los contactos del sistema en un archivo PDF
	 * @throws Exception
	 */
	public void reporteContactos() throws Exception
	{
		//		Context ctx = new InitialContext();
		//		DataSource ds = (DataSource) ctx.lookup("jdbc/memoMS");
		//		Connection con = ds.getConnection();

		//Conexión a la base de datos   
		Class.forName("com.mysql.jdbc.Driver");
		Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/sysinfo", "root", "123456");

		//Cargar el archivo ".jasper" en el objeto JasperReport
		@SuppressWarnings("deprecation")
		JasperReport reporte = (JasperReport) JRLoader.loadObject("C:/Users/Carlos Andrés/workspace/gestionMemorandos/src/reportes/report1.jasper");

		//Llenamos el archivo .jasper con los datos que obtendrá de la base de datos.
		JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, null, conexion);

		//Guardamos el reporte en un archivo pdf
		JRPdfExporter exporter = new JRPdfExporter();

		exporter.setParameter(JRExporterParameter.JASPER_PRINT,jasperPrint); 
		exporter.setParameter(JRExporterParameter.OUTPUT_FILE,new java.io.File("C:/Users/Carlos Andrés/workspace/gestionMemorandos/src/reportes/reporteContactos.pdf"));
		exporter.exportReport();

		//Mostrar Reporte en pantalla
		JasperViewer jViewer = new JasperViewer(jasperPrint);
		//        //JasperViewer.viewReport(jasperPrint, false);
		jViewer.setTitle("Sistema Gestión Memorandos");
		jViewer.setVisible(true);
	}

	/**
	 * Generar reporte en PDF de un memorando
	 * @param id código de la comunicación
	 * @throws Exception
	 */
	public void reporteComunicacion(String id, String remitente, String destinatarios) throws Exception
	{
		String uq = "C:/logouq.jpg";

		//Conexión a la base de datos   
		Class.forName("com.mysql.jdbc.Driver");
		Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/sysinfo", "root", "123456");

		File file = new File("../applications/gestionMemorandos/resources/reportes/comunicacionMEMO.jasper");
		
		//Cargar el archivo ".jasper" en el objeto JasperReport
		JasperReport reporte = (JasperReport) JRLoader.loadObject(file);

		//Parámetros
		Map<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("comunicacion", ""+id);
		parametros.put("remitente", ""+remitente);
		parametros.put("destinatarios", ""+destinatarios);
		parametros.put("logouq", ""+uq);

		//Llenamos el archivo .jasper con los datos que obtendrá de la base de datos.
		JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, parametros, conexion);

		//Guardamos el reporte en un archivo pdf
		JRPdfExporter exporter = new JRPdfExporter();
		
		setRutaCom("cache/comunicacion"+id+".pdf");
		exporter.setParameter(JRExporterParameter.JASPER_PRINT,jasperPrint); 
		
		// iFrame requeire que el archivo pdf esté en el servidor de aplicaciones
		exporter.setParameter(JRExporterParameter.OUTPUT_FILE, new File("../applications/gestionMemorandos/"+rutaCom));
		exporter.exportReport();

	}

	/**
	 * Generar reporte en PDF de la comunicación interna seleccionada
	 * @param id código de la comunicación
	 * @throws Exception
	 */
	public void reporteComunicacionInterna(String id, String remitente, String destinatarios, String cc) throws Exception
	{
		String uq = "C:/logouq.jpg";

		//Conexión a la base de datos   
		Class.forName("com.mysql.jdbc.Driver");
		Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/sysinfo", "root", "123456");

		File file = new File("../applications/gestionMemorandos/resources/reportes/comunicacionINTERNA.jasper");
		
		//Cargar el archivo ".jasper" en el objeto JasperReport
		JasperReport reporte = (JasperReport) JRLoader.loadObject(file.getAbsoluteFile());

		//Parámetros
		Map<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("comunicacion", ""+id);
		parametros.put("remitente", ""+remitente);
		parametros.put("destinatarios", ""+destinatarios);
		parametros.put("concopia", ""+cc);
		parametros.put("logouq", ""+uq);

		//Llenamos el archivo .jasper con los datos que obtendrá de la base de datos.
		JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, parametros, conexion);

		//Guardamos el reporte en un archivo pdf
		JRPdfExporter exporter = new JRPdfExporter();
		
		setRutaCom("cache/comunicacion"+id+".pdf");
		exporter.setParameter(JRExporterParameter.JASPER_PRINT,jasperPrint); 
		
		// iFrame requeire que el archivo pdf esté en el servidor de aplicaciones
		exporter.setParameter(JRExporterParameter.OUTPUT_FILE, new File("../applications/gestionMemorandos/"+rutaCom));
		exporter.exportReport();

	}

	/**
	 * Genera el reporte de todos los contactos del sistema en el navegador web
	 * @throws Exception
	 */
	public void createPdf() throws Exception 
	{  
		//Conexión a la base de datos   
		Class.forName("com.mysql.jdbc.Driver");
		Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/sysinfo", "root", "123456");

		HttpServletResponse response =  (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();    
		
		File reportFile = new File("C:/Users/Carlos Andrés/workspace/gestionMemorandos/src/reportes/report1.jasper");

//		byte[] bytes = JasperRunManager.runReportToPdf (reportFile.getPath(), null, conexion); 

		JasperPrint jasperPrint = JasperFillManager.fillReport(reportFile.getPath(), null, conexion);
		
//		FacesContext facesContext = FacesContext.getCurrentInstance();  
//		ExternalContext externalContext = facesContext.getExternalContext(); 
		
		response.setContentType("application/pdf");   
		JRPdfExporter exporter = new JRPdfExporter();
		exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
		exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, response.getOutputStream());
		exporter.exportReport();
		//OutputStream output = response.getOutputStream();  
		//output.write(bytes);  
		//output.flush();
		//output.close();  

		FacesContext.getCurrentInstance().responseComplete();   
	}

	public String getRutaCom() {
		return rutaCom;
	}

	public void setRutaCom(String rutaCom) {
		this.rutaCom = rutaCom;
	}
	
}