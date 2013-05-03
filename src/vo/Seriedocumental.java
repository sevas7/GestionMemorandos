package vo;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the seriedocumental database table.
 * 
 */
@Entity
public class Seriedocumental implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String codigo;

	private String disposicionFinal;

	private String nombre;

	private String procedimiento;

	private String retencionAnios;

	//bi-directional many-to-one association to Seriedocumental
	@ManyToOne
	@JoinColumn(name="subserie")
	private Seriedocumental seriedocumental;

	//bi-directional many-to-one association to Seriedocumental
	@OneToMany(mappedBy="seriedocumental")
	private List<Seriedocumental> seriedocumentals;

	//bi-directional many-to-one association to Tablaretenciondocumental
	@ManyToOne
	@JoinColumn(name="tabladeretencion")
	private Tablaretenciondocumental tablaretenciondocumental;

	public Seriedocumental() {
	}

	public String getCodigo() {
		return this.codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getDisposicionFinal() {
		return this.disposicionFinal;
	}

	public void setDisposicionFinal(String disposicionFinal) {
		this.disposicionFinal = disposicionFinal;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getProcedimiento() {
		return this.procedimiento;
	}

	public void setProcedimiento(String procedimiento) {
		this.procedimiento = procedimiento;
	}

	public String getRetencionAnios() {
		return this.retencionAnios;
	}

	public void setRetencionAnios(String retencionAnios) {
		this.retencionAnios = retencionAnios;
	}

	public Seriedocumental getSeriedocumental() {
		return this.seriedocumental;
	}

	public void setSeriedocumental(Seriedocumental seriedocumental) {
		this.seriedocumental = seriedocumental;
	}

	public List<Seriedocumental> getSeriedocumentals() {
		return this.seriedocumentals;
	}

	public void setSeriedocumentals(List<Seriedocumental> seriedocumentals) {
		this.seriedocumentals = seriedocumentals;
	}

	public Tablaretenciondocumental getTablaretenciondocumental() {
		return this.tablaretenciondocumental;
	}

	public void setTablaretenciondocumental(Tablaretenciondocumental tablaretenciondocumental) {
		this.tablaretenciondocumental = tablaretenciondocumental;
	}

}