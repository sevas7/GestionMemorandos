package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the fecha database table.
 * 
 */
@Entity
public class Fecha implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String idFecha;

	private String anio;

	private String dia;

	private String mes;

	//bi-directional many-to-one association to Comunicacion
	@OneToMany(mappedBy="fechaBean")
	private List<Comunicacion> comunicacions;

	//bi-directional many-to-one association to Fechacalendario
	@OneToMany(mappedBy="fechaBean")
	private List<Fechacalendario> fechacalendarios;

	public Fecha() {
	}

	public String getIdFecha() {
		return this.idFecha;
	}

	public void setIdFecha(String idFecha) {
		this.idFecha = idFecha;
	}

	public String getAnio() {
		return this.anio;
	}

	public void setAnio(String anio) {
		this.anio = anio;
	}

	public String getDia() {
		return this.dia;
	}

	public void setDia(String dia) {
		this.dia = dia;
	}

	public String getMes() {
		return this.mes;
	}

	public void setMes(String mes) {
		this.mes = mes;
	}

	public List<Comunicacion> getComunicacions() {
		return this.comunicacions;
	}

	public void setComunicacions(List<Comunicacion> comunicacions) {
		this.comunicacions = comunicacions;
	}

	public List<Fechacalendario> getFechacalendarios() {
		return this.fechacalendarios;
	}

	public void setFechacalendarios(List<Fechacalendario> fechacalendarios) {
		this.fechacalendarios = fechacalendarios;
	}

}