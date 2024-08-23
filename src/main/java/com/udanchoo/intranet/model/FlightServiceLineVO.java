package com.udanchoo.intranet.model;

import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import com.udanchoo.intranet.entity.Udn_Deal_FLT_SL_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Flight_Quotation_Entity;

public class FlightServiceLineVO {
	
	private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
	private long fltServiceId;
	private long serviceMapId;
	
	private int airlineId;
	private LocalDateTime departureDate;
	private String formattedDepartureDate;
	private String formattedArrivalDate;
	private LocalDateTime arrivalDate;
	private int supplierId;
	private String remarks;
	private int adults;
	private int children;
	private int infants;
	private int cabinClass;
	private String cabinClassName;
	private int displayOrder;
	
	 
	public int getDisplayOrder() {
		return displayOrder;
	}
	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}
	public String getCabinClassName() {
		return cabinClassName;
	}
	public void setCabinClassName(String cabinClassName) {
		this.cabinClassName = cabinClassName;
	}
	
	@NotNull(message="Error[Departing City] is not selected property.")
	@Min(value=1, message="Error[Departing City] is not selected property.")  
	private int departingFrom;

	@NotNull(message="Error[Arrival City] is not selected property.")
	@Min(value=1, message="Error[Arrival City] is not selected property.")  
	private int arrivingTo;

	private String departingCity;
	private String arrivalCity;
	
	private int noOfHalt;
	private int status;
	private String flightNumber;
	
	private Date holdingDate;
	
	private String airlineShortName;
	private String supplierName;
	private long dealConfirmationId;
	
	private String statusName;
	

	
	private java.util.Date createdAt;
	
	private float serviceLineCost;
	private float markup;
	
	
	private String clientName;
	
	private String originCity;
	private String destinationCity;
	
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	public long getDealConfirmationId() {
		return dealConfirmationId;
	}
	public void setDealConfirmationId(long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}
	
	
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getAirlineShortName() {
		return airlineShortName;
	}
	public void setAirlineShortName(String airlineShortName) {
		this.airlineShortName = airlineShortName;
	}
	public Date getHoldingDate() {
		return holdingDate;
	}
	public void setHoldingDate(Date holdingDate) {
		this.holdingDate = holdingDate;
	}
	public int getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}
	public String getFlightNumber() {
		return flightNumber;
	}
	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}


	
	public FlightServiceLineVO() {
		
	}
	public long getFltServiceId() {
		return fltServiceId;
	}
	public void setFltServiceId(long fltServiceId) {
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
	public void setDepartureDate(String departureDate) {
		//this.departureDate = departureDate;
		this.departureDate = LocalDateTime.parse(departureDate,formatter);
		this.formattedDepartureDate = this.departureDate.format(formatter);
	}
	public LocalDateTime getArrivalDate() {
		return arrivalDate;
	}
	public void setArrivalDate(String arrivalDate) {
		//this.arrivalDate = arrivalDate;
		this.arrivalDate = LocalDateTime.parse(arrivalDate,formatter);
		this.formattedArrivalDate = this.arrivalDate.format(formatter);
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
	
	
	
	
	public int getCabinClass() {
		return cabinClass;
	}
	public void setCabinClass(int cabinClass) {
		this.cabinClass = cabinClass;
	}
	public int getInfants() {
		return infants;
	}
	public void setInfants(int infants) {
		this.infants = infants;
	}
	
	
	
	
	
	
	
	
	public java.util.Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(java.util.Date createdAt) {
		this.createdAt = createdAt;
	}
	
	
	
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	
	
	public float getServiceLineCost() {
		return serviceLineCost;
	}
	public void setServiceLineCost(float serviceLineCost) {
		this.serviceLineCost = serviceLineCost;
	}

	
	
	
	

	@Override
	public String toString() {
		return "FlightServiceLineVO [fltServiceId=" + fltServiceId + ", serviceMapId=" + serviceMapId + ", airlineId="
				+ airlineId + ", departureDate=" + departureDate + ", arrivalDate=" + arrivalDate + ", supplierId="
				+ supplierId + ", remarks=" + remarks + ", adults=" + adults + ", children=" + children + ", infants="
				+ infants + ", cabinClass=" + cabinClass + ", cabinClassName=" + cabinClassName + ", displayOrder="
				+ displayOrder + ", departingFrom=" + departingFrom + ", arrivingTo=" + arrivingTo + ", noOfHalt="
				+ noOfHalt + ", status=" + status + ", flightNumber=" + flightNumber + ", holdingDate=" + holdingDate
				+ ", airlineShortName=" + airlineShortName + ", supplierName=" + supplierName + ", dealConfirmationId="
				+ dealConfirmationId + ", statusName=" + statusName + ", createdAt=" + createdAt + ", serviceLineCost="
				+ serviceLineCost + ", clientName=" + clientName + ", originCity=" + originCity + ", destinationCity="
				+ destinationCity + "]";
	}
	public FlightServiceLineVO(Udn_Deal_FLT_SL_Entity fltSLEntity){
		this.airlineId = fltSLEntity.getAirlineId();
		this.arrivingTo=fltSLEntity.getArrivingTo();
		this.departingFrom=fltSLEntity.getDepartingFrom();
		this.noOfHalt=fltSLEntity.getNoOfHalt();
		this.status=fltSLEntity.getStatus();
		this.supplierId=fltSLEntity.getSupplierId();
		this.arrivalDate=fltSLEntity.getArrivalDate();
		this.departureDate=fltSLEntity.getDepartureDate();
		//this.holdingDate=fltSLEntity.getHoldingDate();
		this.flightNumber=fltSLEntity.getFlightNumber();
		this.remarks=fltSLEntity.getRemarks();
		this.serviceMapId=fltSLEntity.getServiceMapId();
		this.fltServiceId=fltSLEntity.getFltServiceId();
		this.adults = fltSLEntity.getAdults();
		this.children= fltSLEntity.getChildren();
		this.infants=fltSLEntity.getInfants();
		this.cabinClass= fltSLEntity.getCabinClass();
		this.dealConfirmationId=fltSLEntity.getDealConfirmationId();
		this.createdAt = fltSLEntity.getCreatedAt();
		this.serviceLineCost = fltSLEntity.getServiceLineCost();
		this.cabinClass= fltSLEntity.getCabinClass();
		this.markup=fltSLEntity.getMarkup();
		this.displayOrder= fltSLEntity.getDisplayOrder();
	}

	public void updateFlightServiceLineVOFromEntity(Udn_Deal_FLT_SL_Entity fltSLEntity){
		this.airlineId = fltSLEntity.getAirlineId();
		this.arrivingTo=fltSLEntity.getArrivingTo();
		this.departingFrom=fltSLEntity.getDepartingFrom();
		this.noOfHalt=fltSLEntity.getNoOfHalt();
		this.status=fltSLEntity.getStatus();
		this.supplierId=fltSLEntity.getSupplierId();
		this.arrivalDate=fltSLEntity.getArrivalDate();
		this.departureDate=fltSLEntity.getDepartureDate();
		//this.holdingDate=fltSLEntity.getHoldingDate();
		this.flightNumber=fltSLEntity.getFlightNumber();
		this.remarks=fltSLEntity.getRemarks();
		this.serviceMapId=fltSLEntity.getServiceMapId();
		this.fltServiceId=fltSLEntity.getFltServiceId();
		this.adults = fltSLEntity.getAdults();
		this.children= fltSLEntity.getChildren();
		this.infants=fltSLEntity.getInfants();
		this.cabinClass= fltSLEntity.getCabinClass();
		this.dealConfirmationId=fltSLEntity.getDealConfirmationId();
		this.createdAt = fltSLEntity.getCreatedAt();
		this.serviceLineCost = fltSLEntity.getServiceLineCost();
		this.cabinClass= fltSLEntity.getCabinClass();
		this.markup=fltSLEntity.getMarkup();
		this.displayOrder=fltSLEntity.getDisplayOrder();
	}
	
	public FlightServiceLineVO(Udn_Manual_Flight_Quotation_Entity qtnfltSLEntity){
		this.airlineId = Integer.parseInt(String.valueOf(qtnfltSLEntity.getAirlineId()));
		this.arrivingTo=qtnfltSLEntity.getAirportCodeDestination();
		this.departingFrom=qtnfltSLEntity.getAirportCodeOrigin();
		this.noOfHalt=qtnfltSLEntity.getNoOfStops();
		//this.status=qtnfltSLEntity.gets
		//this.supplierId=qtnfltSLEntity.getSupplierId();
		this.arrivalDate=qtnfltSLEntity.getArrivalDate();
		this.departureDate=qtnfltSLEntity.getDepartureDate();
		this.flightNumber=qtnfltSLEntity.getFlightNumber();
		//this.serviceMapId=qtnfltSLEntity.getServiceMapId();
		//this.fltServiceId=qtnfltSLEntity.getFltServiceId();
		this.adults = qtnfltSLEntity.getAdultCount();
		this.children= qtnfltSLEntity.getChildCount();
		this.infants= qtnfltSLEntity.getInfantCount();
		this.cabinClass= qtnfltSLEntity.getCabinClass();
		//this.dealConfirmationId=fltSLEntity.getDealConfirmationId();
		//this.serviceLineOwner = fltSLEntity.getServiceLineOwner();
		this.serviceLineCost = qtnfltSLEntity.getFlightCost();
		this.markup=qtnfltSLEntity.getFlightMarkup();
		this.displayOrder=qtnfltSLEntity.getDisplayOrder();
		
	}
	public String getOriginCity() {
		return originCity;
	}
	public void setOriginCity(String originCity) {
		this.originCity = originCity;
	}
	public String getDestinationCity() {
		return destinationCity;
	}
	public void setDestinationCity(String destinationCity) {
		this.destinationCity = destinationCity;
	}
	public float getMarkup() {
		return markup;
	}
	public void setMarkup(float markup) {
		this.markup = markup;
	}
	public String getDepartingCity() {
		return departingCity;
	}
	public void setDepartingCity(String departingCity) {
		this.departingCity = departingCity;
	}
	public String getArrivalCity() {
		return arrivalCity;
	}
	public void setArrivalCity(String arrivalCity) {
		this.arrivalCity = arrivalCity;
	}
	public String getFormattedDepartureDate() {
		return formattedDepartureDate;
	}
	public void setFormattedDepartureDate(String formattedDepartureDate) {
		this.formattedDepartureDate = formattedDepartureDate;
	}
	public String getFormattedArrivalDate() {
		return formattedArrivalDate;
	}
	public void setFormattedArrivalDate(String formattedArrivalDate) {
		this.formattedArrivalDate = formattedArrivalDate;
	}
	
	

	
}
