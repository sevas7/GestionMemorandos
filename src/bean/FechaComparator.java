package bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;

import vo.Comunicacion;

@SuppressWarnings("rawtypes")
public class FechaComparator implements Comparator  
{

	public int compare(Object o1, Object o2) 
	{
        Comunicacion comunicacion1 = (Comunicacion)o1;
        Comunicacion comunicacion2 = (Comunicacion)o2; 
        int salida = 0;
        
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        try {
			Date fecha1 = sdf.parse(comunicacion1.getFechaCreacion());
			Date fecha2 = sdf.parse(comunicacion2.getFechaCreacion());
			
			salida = fecha2.compareTo(fecha1);
			
		} catch (ParseException e) 
		{
			e.printStackTrace();
		}
        
        return salida;
                
    }

}
