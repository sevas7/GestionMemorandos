package bean;

import java.util.Comparator;

import vo.Comunicacion;

@SuppressWarnings("rawtypes")
public class ComunicacionComparator implements Comparator  {

	public int compare(Object o1, Object o2) 
	{
        Comunicacion comunicacion1 = (Comunicacion)o1;
        Comunicacion comunicacion2 = (Comunicacion)o2; 
       
        Integer id1 = Integer.parseInt(comunicacion1.getIdDocumento());
        Integer id2 = Integer.parseInt(comunicacion2.getIdDocumento());
               
        return id2.compareTo(id1);       
    }


}
