package com.fiduprod.model;


import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "prcInsertaFdTmovimientoElement")
@XmlAccessorType(XmlAccessType.FIELD)
public class PrcInsertaFdTmovimientoElement {

	private String auxi;
	private String cias;
	private String ciasDest;
	private String descri;
	private Double encargo;
	private Double encargoDest;
	private Double entidad;
	private Date fecha;
	private String pFpago;
	private Double pOrpaVigencia;
	private String pOrpaNumero;
	private Double pValor;
	private Double pGravamen;
	private String pCuenta;
	private Double pMoviCtaDest;
	private String pMoviTpctDest;
	private String pMoviTpctPag;
	private String pFondo;
	private String pTipoReg;
	private Map<String,String> otro = new HashMap<String, String>();
	
	public String getAuxi() {
		return auxi;
	}
	public void setAuxi(String auxi) {
		this.auxi = auxi;
	}
	public String getCias() {
		return cias;
	}
	public void setCias(String cias) {
		this.cias = cias;
	}
	public String getCiasDest() {
		return ciasDest;
	}
	public void setCiasDest(String ciasDest) {
		this.ciasDest = ciasDest;
	}
	public String getDescri() {
		return descri;
	}
	public void setDescri(String descri) {
		this.descri = descri;
	}
	public Double getEncargo() {
		return encargo;
	}
	public void setEncargo(Double encargo) {
		this.encargo = encargo;
	}
	public Double getEncargoDest() {
		return encargoDest;
	}
	public void setEncargoDest(Double encargoDest) {
		this.encargoDest = encargoDest;
	}
	public Double getEntidad() {
		return entidad;
	}
	public void setEntidad(Double entidad) {
		this.entidad = entidad;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public String getpFpago() {
		return pFpago;
	}
	public void setpFpago(String pFpago) {
		this.pFpago = pFpago;
	}
	public Double getpOrpaVigencia() {
		return pOrpaVigencia;
	}
	public void setpOrpaVigencia(Double pOrpaVigencia) {
		this.pOrpaVigencia = pOrpaVigencia;
	}
	public String getpOrpaNumero() {
		return pOrpaNumero;
	}
	public void setpOrpaNumero(String pOrpaNumero) {
		this.pOrpaNumero = pOrpaNumero;
	}
	public Double getpValor() {
		return pValor;
	}
	public void setpValor(Double pValor) {
		this.pValor = pValor;
	}
	public Double getpGravamen() {
		return pGravamen;
	}
	public void setpGravamen(Double pGravamen) {
		this.pGravamen = pGravamen;
	}
	public String getpCuenta() {
		return pCuenta;
	}
	public void setpCuenta(String pCuenta) {
		this.pCuenta = pCuenta;
	}
	public Double getpMoviCtaDest() {
		return pMoviCtaDest;
	}
	public void setpMoviCtaDest(Double pMoviCtaDest) {
		this.pMoviCtaDest = pMoviCtaDest;
	}
	public String getpMoviTpctDest() {
		return pMoviTpctDest;
	}
	public void setpMoviTpctDest(String pMoviTpctDest) {
		this.pMoviTpctDest = pMoviTpctDest;
	}
	public String getpMoviTpctPag() {
		return pMoviTpctPag;
	}
	public void setpMoviTpctPag(String pMoviTpctPag) {
		this.pMoviTpctPag = pMoviTpctPag;
	}
	public String getpFondo() {
		return pFondo;
	}
	public void setpFondo(String pFondo) {
		this.pFondo = pFondo;
	}
	public String getpTipoReg() {
		return pTipoReg;
	}
	public void setpTipoReg(String pTipoReg) {
		this.pTipoReg = pTipoReg;
	}
	public Map<String, String> getOtro() {
		return otro;
	}
	public void setOtro(Map<String, String> otro) {
		this.otro = otro;
	}
}
