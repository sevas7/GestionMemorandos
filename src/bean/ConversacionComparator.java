package bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;
import vo.Conversacion;

@SuppressWarnings("rawtypes")
public class ConversacionComparator implements Comparator {

	public int compare(Object o1, Object o2) 
	{
        Conversacion conversacion1 = (Conversacion)o1;
        Conversacion conversacion2 = (Conversacion)o2; 
        int salida = 0;
        
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        try {
			Date fecha1 = sdf.parse(conversacion1.getFechaConversacion());
			Date fecha2 = sdf.parse(conversacion2.getFechaConversacion());
			
			salida = fecha2.compareTo(fecha1);
			
		} catch (ParseException e) 
		{
			e.printStackTrace();
		}
        
        return salida;
                
    }


}
