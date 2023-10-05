package com.udanchoo.intranet.model.supplier;

public class SearchSupplierObj {
	private long supplierId;
	private String supplierName;
	private int cityId;
	private String cityName;
	
	private int serviceCityId;
	private String serviceCityName;
	
	
	private boolean consolidator;
	
	private boolean landPackage;
	//private boolean packageWithFlight;
	//private boolean packageWithoutFlight;
	
	private boolean flight;
	private boolean hotel;
	private boolean transfers;
	private boolean sightseeing;
	private boolean visa;
	private boolean insurance;
	private boolean cruise;
	private boolean others;
	
	private boolean deleted = false;
	private long leadId;
	private String sortBy;
	
	public long getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(long supplierId) {
		this.supplierId = supplierId;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public int getCityId() {
		return cityId;
	}
	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public boolean isConsolidator() {
		return consolidator;
	}
	public void setConsolidator(boolean consolidator) {
		this.consolidator = consolidator;
	}
	
	/*
	public boolean isPackageWithFlight() {
		return packageWithFlight;
	}
	public void setPackageWithFlight(boolean packageWithFlight) {
		this.packageWithFlight = packageWithFlight;
	}
	public boolean isPackageWithoutFlight() {
		return packageWithoutFlight;
	}
	public void setPackageWithoutFlight(boolean packageWithoutFlight) {
		this.packageWithoutFlight = packageWithoutFlight;
	}
	*/
	public boolean isFlight() {
		return flight;
	}
	public void setFlight(boolean flight) {
		this.flight = flight;
	}
	public boolean isHotel() {
		return hotel;
	}
	public void setHotel(boolean hotel) {
		this.hotel = hotel;
	}
	public boolean isTransfers() {
		return transfers;
	}
	public void setTransfers(boolean transfers) {
		this.transfers = transfers;
	}
	public boolean isSightseeing() {
		return sightseeing;
	}
	public void setSightseeing(boolean sightseeing) {
		this.sightseeing = sightseeing;
	}
	public boolean isVisa() {
		return visa;
	}
	public void setVisa(boolean visa) {
		this.visa = visa;
	}
	public boolean isInsurance() {
		return insurance;
	}
	public void setInsurance(boolean insurance) {
		this.insurance = insurance;
	}
	public boolean isCruise() {
		return cruise;
	}
	
	
	
	public boolean isOthers() {
		return others;
	}
	public void setOthers(boolean others) {
		this.others = others;
	}
	public void setCruise(boolean cruise) {
		this.cruise = cruise;
	}
	public int getServiceCityId() {
		return serviceCityId;
	}
	public void setServiceCityId(int serviceCityId) {
		this.serviceCityId = serviceCityId;
	}
	public String getServiceCityName() {
		return serviceCityName;
	}
	public void setServiceCityName(String serviceCityName) {
		this.serviceCityName = serviceCityName;
	}
	
	
	public boolean isDeleted() {
		return deleted;
	}
	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	
	
	public long getLeadId() {
		return leadId;
	}
	public void setLeadId(long leadId) {
		this.leadId = leadId;
	}
	
	
	 
	
	public boolean isLandPackage() {
		return landPackage;
	}
	public void setLandPackage(boolean landPackage) {
		this.landPackage = landPackage;
	}
	@Override
	public String toString() {
		return "SearchSupplierObj [supplierId=" + supplierId + ", supplierName=" + supplierName + ", cityId=" + cityId
				+ ", cityName=" + cityName + ", serviceCityId=" + serviceCityId + ", serviceCityName=" + serviceCityName
				+ ", consolidator=" + consolidator + ", landPackage=" + landPackage +  ", flight=" + flight + ", hotel=" + hotel
				+ ", transfers=" + transfers + ", sightseeing=" + sightseeing + ", visa=" + visa + ", insurance="
				+ insurance + ", cruise=" + cruise + ", deleted=" + deleted + ", leadId=" + leadId + "]";
	}
	public String getSortBy() {
		return sortBy;
	}
	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}
	
	
	
	
	
	
	
	
	
	
	

}
