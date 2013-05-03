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

		//Conexi�n a la base de datos   
		Class.forName("com.mysql.jdbc.Driver");
		Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/sysinfo", "root", "123456");

		//Cargar el archivo ".jasper" en el objeto JasperReport
		@SuppressWarnings("deprecation")
		JasperReport reporte = (JasperReport) JRLoader.loadObject("C:/Users/Carlos Andr�s/workspace/gestionMemorandos/src/reportes/report1.jasper");

		//Llenamos el archivo .jasper con los datos que obtendr� de la base de datos.
		JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, null, conexion);

		//Guardamos el reporte en un archivo pdf
		JRPdfExporter exporter = new JRPdfExporter();

		exporter.setParameter(JRExporterParameter.JASPER_PRINT,jasperPrint); 
		exporter.setParameter(JRExporterParameter.OUTPUT_FILE,new java.io.File("C:/Users/Carlos Andr�s/workspace/gestionMemorandos/src/reportes/reporteContactos.pdf"));
		exporter.exportReport();

		//Mostrar Reporte en pantalla
		JasperViewer jViewer = new JasperViewer(jasperPrint);
		//        //JasperViewer.viewReport(jasperPrint, false);
		jViewer.setTitle("Sistema Gesti�n Memorandos");
		jViewer.setVisible(true);
	}

	/**
	 * Generar reporte en PDF de un memorando
	 * @param id c�digo de la comunicaci�n
	 * @throws Exception
	 */
	public void reporteComunicacion(String id, String remitente, String destinatarios) throws Exception
	{
		String uq = "C:/logouq.jpg";

		//Conexi�n a la base de datos   
		Class.forName("com.mysql.jdbc.Driver");
		Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/sysinfo", "root", "123456");

		File file = new File("../applications/gestionMemorandos/resources/reportes/comunicacionMEMO.jasper");
		
		//Cargar el archivo ".jasper" en el objeto JasperReport
		JasperReport reporte = (JasperReport) JRLoader.loadObject(file);

		//Par�metros
		Map<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("comunicacion", ""+id);
		parametros.put("remitente", ""+remitente);
		parametros.put("destinatarios", ""+destinatarios);
		parametros.put("logouq", ""+uq);

		//Llenamos el archivo .jasper con los datos que obtendr� de la base de datos.
		JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, parametros, conexion);

		//Guardamos el reporte en un archivo pdf
		JRPdfExporter exporter = new JRPdfExporter();
		
		setRutaCom("cache/comunicacion"+id+".pdf");
		exporter.setParameter(JRExporterParameter.JASPER_PRINT,jasperPrint); 
		
		// iFrame requeire que el archivo pdf est� en el servidor de aplicaciones
		exporter.setParameter(JRExporterParameter.OUTPUT_FILE, new File("../applications/gestionMemorandos/"+rutaCom));
		exporter.exportReport();

	}

	/**
	 * Generar reporte en PDF de la comunicaci�n interna seleccionada
	 * @param id c�digo de la comunicaci�n
	 * @throws Exception
	 */
	public void reporteComunicacionInterna(String id, String remitente, String destinatarios, String cc) throws Exception
	{
		String uq = "C:/logouq.jpg";

		//Conexi�n a la base de datos   
		Class.forName("com.mysql.jdbc.Driver");
		Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/sysinfo", "root", "123456");

		File file = new File("../applications/gestionMemorandos/resources/reportes/comunicacionINTERNA.jasper");
		
		//Cargar el archivo ".jasper" en el objeto JasperReport
		JasperReport reporte = (JasperReport) JRLoader.loadObject(file.getAbsoluteFile());

		//Par�metros
		Map<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("comunicacion", ""+id);
		parametros.put("remitente", ""+remitente);
		parametros.put("destinatarios", ""+destinatarios);
		parametros.put("concopia", ""+cc);
		parametros.put("logouq", ""+uq);

		//Llenamos el archivo .jasper con los datos que obtendr� de la base de datos.
		JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, parametros, conexion);

		//Guardamos el reporte en un archivo pdf
		JRPdfExporter exporter = new JRPdfExporter();
		
		setRutaCom("cache/comunicacion"+id+".pdf");
		exporter.setParameter(JRExporterParameter.JASPER_PRINT,jasperPrint); 
		
		// iFrame requeire que el archivo pdf est� en el servidor de aplicaciones
		exporter.setParameter(JRExporterParameter.OUTPUT_FILE, new File("../applications/gestionMemorandos/"+rutaCom));
		exporter.exportReport();

	}

	/**
	 * Genera el reporte de todos los contactos del sistema en el navegador web
	 * @throws Exception
	 */
	public void createPdf() throws Exception 
	{  
		//Conexi�n a la base de datos   
		Class.forName("com.mysql.jdbc.Driver");
		Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/sysinfo", "root", "123456");

		HttpServletResponse response =  (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();    
		
		File reportFile = new File("C:/Users/Carlos Andr�s/workspace/gestionMemorandos/src/reportes/report1.jasper");

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