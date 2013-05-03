package bean;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class CorreoBean {
	
	/**
	 * Envía un correo a la persona que ha olvidado su contraseña
	 * @param correo El Correo
	 * @param mensaje El Mensaje + La Contraseña
	 * @throws AddressException
	 * @throws MessagingException
	 */
	public void enviarCorreo(String correo, String mensaje) throws AddressException, MessagingException
	{
		Properties props = new Properties();

		// Nombre del host de correo, es smtp.gmail.com
		props.setProperty("mail.smtp.host", "smtp.gmail.com");

		// TLS si está disponible
		props.setProperty("mail.smtp.starttls.enable", "true");

		// Puerto de gmail para envio de correos
		props.setProperty("mail.smtp.port","587");

		// Nombre del usuario
		props.setProperty("mail.smtp.user", "losdesw3@gmail.com");

		// Si requiere o no usuario y password para conectarse.
		props.setProperty("mail.smtp.auth", "true");
		
		//Sesión 
		Session session = Session.getDefaultInstance(props);
		
		session.setDebug(true);
		
		//Mensaje 	
		MimeMessage message = new MimeMessage(session);
		
		// Quien envia el correo
		message.setFrom(new InternetAddress("sistemaacreditacionuq@gmail.com"));
		
		// A quien va dirigido
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(correo));
		
		message.setSubject("Olvido Contraseña");
		message.setText(mensaje);
		
		Transport t = session.getTransport("smtp");
		t.connect("sistemaacreditacionuq@gmail.com","acreditacionuq");
		t.sendMessage(message,message.getAllRecipients());
		
		t.close();
	}

}
