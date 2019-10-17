package com.jugueteria.model;


import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "prcGestionaCotizacionElement")
@XmlAccessorType(XmlAccessType.FIELD)
public class PrcGestionaCotizacionElement {

	private int idcotizacion;
	private int idusuario;
	private int cantidad;
	private String descripcion;
	private Date fecha;
	private int vigencia;
	private Double totalimpuestos;
	private Double valortotal;
	private int idimpuesto;
	private Double subtotal;
	private int estado;
	private Map<String,String> otro = new HashMap<String, String>();
	
	public int getIdcotizacion() {
		return idcotizacion;
	}
	public void setIdcotizacion(int idcotizacion) {
		this.idcotizacion = idcotizacion;
	}
	public int getIdusuario() {
		return idusuario;
	}
	public void setIdusuario(int idusuario) {
		this.idusuario = idusuario;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public int getVigencia() {
		return vigencia;
	}
	public void setVigencia(int vigencia) {
		this.vigencia = vigencia;
	}
	public Double getTotalimpuestos() {
		return totalimpuestos;
	}
	public void setTotalimpuestos(Double totalimpuestos) {
		this.totalimpuestos = totalimpuestos;
	}
	public Double getValortotal() {
		return valortotal;
	}
	public void setValortotal(Double valortotal) {
		this.valortotal = valortotal;
	}
	public int getIdimpuesto() {
		return idimpuesto;
	}
	public void setIdimpuesto(int idimpuesto) {
		this.idimpuesto = idimpuesto;
	}
	public Double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public Map<String, String> getOtro() {
		return otro;
	}
	public void setOtro(Map<String, String> otro) {
		this.otro = otro;
	}
}
