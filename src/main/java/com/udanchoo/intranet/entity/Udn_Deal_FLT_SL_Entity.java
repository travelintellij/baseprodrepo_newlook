package com.udanchoo.intranet.entity;

import java.sql.Date;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.udanchoo.intranet.entity.quotation.Udn_Manual_Flight_Quotation_Entity;
import com.udanchoo.intranet.model.FlightServiceLineVO;

@Entity
@Table(name = "udn_flt_service_line")
public class Udn_Deal_FLT_SL_Entity extends AuditModel {
   
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false,name="fltServiceId", unique = true)
	private Long fltServiceId;
	private long serviceMapId;
	private int airlineId;
	private LocalDateTime departureDate;
	private LocalDateTime arrivalDate;
	private int supplierId;
	private Long dealConfirmationId;
	private int adults;
	private int children;
	
	@Column(name = "infants")
	private int infants;
	private int cabinClass;
	private String remarks;
	private int departingFrom;
	private int arrivingTo;
	private int noOfHalt;
	private int status;
	private String flightNumber;
	private int displayOrder;
	//private Date holdingDate;
	
	private float serviceLineCost;
	private float markup;
	
	
	public int getDisplayOrder() {
		return displayOrder;
	}



	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}



	
	
	public Udn_Deal_FLT_SL_Entity() {
		
	}
	
	
	
	public Long getDealConfirmationId() {
		return dealConfirmationId;
	}



	public void setDealConfirmationId(Long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}




	
	
	public String getFlightNumber() {
		return flightNumber;
	}
	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}
	public Long getFltServiceId() {
		return fltServiceId;
	}
	public void setFltServiceId(Long fltServiceId) {
		this.fltServiceId = fltServiceId;
	}
	public long getServiceMapId() {
		return serviceMapId;
	}
	public void setServiceMapId(long serviceMapId) {
		this.serviceMapId = serviceMapId;
	}
	public int getAirlineId() {
		return airlineId;
	}
	public void setAirlineId(int airlineId) {
		this.airlineId = airlineId;
	}
	public LocalDateTime getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(LocalDateTime departureDate) {
		this.departureDate = departureDate;
	}
	public LocalDateTime getArrivalDate() {
		return arrivalDate;
	}
	public void setArrivalDate(LocalDateTime arrivalDate) {
		this.arrivalDate = arrivalDate;
	}
	public int getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public int getDepartingFrom() {
		return departingFrom;
	}
	public void setDepartingFrom(int departingFrom) {
		this.departingFrom = departingFrom;
	}
	public int getArrivingTo() {
		return arrivingTo;
	}
	public void setArrivingTo(int arrivingTo) {
		this.arrivingTo = arrivingTo;
	}
	public int getNoOfHalt() {
		return noOfHalt;
	}
	public void setNoOfHalt(int noOfHalt) {
		this.noOfHalt = noOfHalt;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	

	public Udn_Deal_FLT_SL_Entity(FlightServiceLineVO fltSLVO){
		this.airlineId = fltSLVO.getAirlineId();
		this.arrivingTo=fltSLVO.getArrivingTo();
		this.departingFrom=fltSLVO.getDepartingFrom();
		this.noOfHalt=fltSLVO.getNoOfHalt();
		this.status=fltSLVO.getStatus();
		this.supplierId=fltSLVO.getSupplierId();
		this.arrivalDate=fltSLVO.getArrivalDate();
		this.departureDate=fltSLVO.getDepartureDate();
		this.dealConfirmationId=fltSLVO.getDealConfirmationId();
		this.flightNumber=fltSLVO.getFlightNumber();
		this.remarks=fltSLVO.getRemarks();
		this.serviceMapId=fltSLVO.getServiceMapId();
		this.fltServiceId=fltSLVO.getFltServiceId();
		this.adults = fltSLVO.getAdults();
		this.children= fltSLVO.getChildren();
		this.infants=fltSLVO.getInfants();
		this.cabinClass= fltSLVO.getCabinClass();
		this.serviceLineCost=fltSLVO.getServiceLineCost();
		this.displayOrder = fltSLVO.getDisplayOrder();
		this.markup=fltSLVO.getMarkup();
	}

	public Udn_Deal_FLT_SL_Entity(Udn_Manual_Flight_Quotation_Entity flightQtnEntity){
		this.airlineId = (int)flightQtnEntity.getAirlineId();
		this.arrivingTo=flightQtnEntity.getAirportCodeDestination();
		this.departingFrom=flightQtnEntity.getAirportCodeOrigin();
		this.noOfHalt=flightQtnEntity.getNoOfStops();
		//this.status=flightQtnEntity.get
		//this.supplierId=fltSLVO.getSupplierId();
		this.arrivalDate=flightQtnEntity.getArrivalDate();
		this.departureDate=flightQtnEntity.getDepartureDate();
		//this.dealConfirmationId=fltSLVO.getDealConfirmationId();
		this.flightNumber=flightQtnEntity.getFlightNumber();
		//this.remarks=flightQtnEntity.getRemarks();
		//this.serviceMapId=fltSLVO.getServiceMapId();
		//this.fltServiceId=fltSLVO.getFltServiceId();
		this.adults = flightQtnEntity.getAdultCount();
		this.children= flightQtnEntity.getChildCount();
		this.infants=flightQtnEntity.getInfantCount();
		this.cabinClass= flightQtnEntity.getCabinClass();
		//this.serviceLineOwner = fltSLVO.getServiceLineOwner();
		this.serviceLineCost=flightQtnEntity.getFlightCost();
		this.markup=flightQtnEntity.getFlightMarkup();
		this.displayOrder=flightQtnEntity.getDisplayOrder();
	}



	public int getAdults() {
		return adults;
	}



	public void setAdults(int adults) {
		this.adults = adults;
	}



	public int getChildren() {
		return children;
	}



	public void setChildren(int children) {
		this.children = children;
	}


	

	public int getInfants() {
		return infants;
	}



	public void setInfants(int infants) {
		this.infants = infants;
	}



	


	public int getCabinClass() {
		return cabinClass;
	}



	public void setCabinClass(int cabinClass) {
		this.cabinClass = cabinClass;
	}


	public float getServiceLineCost() {
		return serviceLineCost;
	}



	public void setServiceLineCost(float serviceLineCost) {
		this.serviceLineCost = serviceLineCost;
	}



	@Override
	public String toString() {
		return "Udn_Deal_FLT_SL_Entity [fltServiceId=" + fltServiceId + ", serviceMapId=" + serviceMapId
				+ ", airlineId=" + airlineId + ", departureDate=" + departureDate + ", arrivalDate=" + arrivalDate
				+ ", supplierId=" + supplierId + ", dealConfirmationId=" + dealConfirmationId + ", adults=" + adults
				+ ", children=" + children + ", infants=" + infants + ", cabinClass=" + cabinClass + ", remarks="
				+ remarks + ", departingFrom=" + departingFrom + ", arrivingTo=" + arrivingTo + ", noOfHalt=" + noOfHalt
				+ ", status=" + status + ", flightNumber=" + flightNumber + ", displayOrder=" + displayOrder
				+ ", serviceLineCost=" + serviceLineCost + "]";
	}



	public float getMarkup() {
		return markup;
	}



	public void setMarkup(float markup) {
		this.markup = markup;
	}



	

	
}