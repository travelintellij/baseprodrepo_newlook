package com.udanchoo.intranet.entity.supplier;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Where;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.udanchoo.intranet.entity.AuditModel;
import com.udanchoo.intranet.entity.Udn_Destinations_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Doc_Map_Entity;
import com.udanchoo.intranet.model.supplier.TgSupplierMasterVO;
import com.udanchoo.intranet.repository.Tg_SupplierContactsRepository;

@Entity
@Table(name = "tg_supplier_master")
public class Tg_Supplier_Master_Entity extends AuditModel {
  
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long supplierId;

	protected String supplierName;
	protected String companyDetails;
	protected String address;
	protected int cityId;
	protected int countryId;
	protected long mobile;
	protected long phone;
	protected String email;
	protected String gstDetails;
	protected String bankDetails;
	protected String remarks;
	protected String referredBy;
	protected boolean consolidator;
	
	protected boolean landPackage;
	/*protected boolean packageWithFlight;
	protected boolean packageWithoutFlight;
	*/
	
	protected boolean flight;
	protected boolean hotel;
	protected boolean transfers;
	protected boolean sightseeing;
	protected boolean visa;
	protected boolean insurance;
	protected boolean cruise;
	protected boolean others;
	protected boolean negotiates;
	protected boolean deleted = false;
	protected int supplierRating;
	protected int lastUpdatedBy;
	
	
	@ManyToMany(targetEntity = Udn_Destinations_Entity.class,fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "supplier_destinations_map",
            joinColumns = {@JoinColumn(name="supplierId")},
            inverseJoinColumns = {@JoinColumn(name="destinationId")})
	protected Set<Udn_Destinations_Entity> destinations = new HashSet<Udn_Destinations_Entity>();
	
	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy = "supplierEntity")
	@OrderBy("updated_at DESC")
	@JsonBackReference
	@Where(clause = "deleted = false")
	protected Set<Tg_Supplier_Contact_Entity> supplierContactsList = new HashSet<Tg_Supplier_Contact_Entity>();
	
	
	public Tg_Supplier_Master_Entity() {
		
	}
	public Long getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(Long supplierId) {
		this.supplierId = supplierId;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getCityId() {
		return cityId;
	}
	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
	
	public int getCountryId() {
		return countryId;
	}
	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}
	public long getMobile() {
		return mobile;
	}
	public void setMobile(long mobile) {
		this.mobile = mobile;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public String getGstDetails() {
		return gstDetails;
	}
	public void setGstDetails(String gstDetails) {
		this.gstDetails = gstDetails;
	}
	public String getBankDetails() {
		return bankDetails;
	}
	public void setBankDetails(String bankDetails) {
		this.bankDetails = bankDetails;
	}
	
	
	public String getReferredBy() {
		return referredBy;
	}
	public void setReferredBy(String referredBy) {
		this.referredBy = referredBy;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
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
	public boolean isLandPackage() {
		return landPackage;
	}
	public void setLandPackage(boolean landPackage) {
		this.landPackage = landPackage;
	}
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
	public void setCruise(boolean cruise) {
		this.cruise = cruise;
	}

	
	
	public boolean isOthers() {
		return others;
	}
	public void setOthers(boolean others) {
		this.others = others;
	}
	public int getSupplierRating() {
		return supplierRating;
	}
	public void setSupplierRating(int supplierRating) {
		this.supplierRating = supplierRating;
	}
	public int getLastUpdatedBy() {
		return lastUpdatedBy;
	}
	public void setLastUpdatedBy(int lastUpdatedBy) {
		this.lastUpdatedBy = lastUpdatedBy;
	}
	
	
	public String getCompanyDetails() {
		return companyDetails;
	}
	public void setCompanyDetails(String companyDetails) {
		this.companyDetails = companyDetails;
	}
	
	
	public boolean isNegotiates() {
		return negotiates;
	}
	public void setNegotiates(boolean negotiates) {
		this.negotiates = negotiates;
	}
	

	
	public boolean isDeleted() {
		return deleted;
	}
	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	public Tg_Supplier_Master_Entity(TgSupplierMasterVO supplierVo) {
		this.supplierId = supplierVo.getSupplierId();
		this.supplierName = supplierVo.getSupplierName();
		this.companyDetails = supplierVo.getCompanyDetails();
		this.address = supplierVo.getAddress();
		this.cityId = supplierVo.getCityId();
		this.countryId = supplierVo.getCountryId();
		this.mobile = supplierVo.getMobile();
		this.phone = supplierVo.getPhone();
		this.email = supplierVo.getEmail();
		this.gstDetails = supplierVo.getGstDetails();
		this.bankDetails = supplierVo.getBankDetails();
		this.remarks = supplierVo.getRemarks();
		this.referredBy = supplierVo.getReferredBy();
		this.consolidator = supplierVo.isConsolidator();
		this.landPackage = supplierVo.isLandPackage();
		/*
		this.packageWithFlight = supplierVo.isPackageWithFlight();
		this.packageWithoutFlight = supplierVo.isPackageWithoutFlight();
		*/
		
		this.flight = supplierVo.isFlight();
		this.hotel = supplierVo.isHotel();
		this.transfers = supplierVo.isTransfers();
		this.sightseeing = supplierVo.isSightseeing();
		this.visa = supplierVo.isVisa();
		this.insurance = supplierVo.isInsurance();
		this.cruise = supplierVo.isCruise();
		this.others = supplierVo.isOthers();
		this.negotiates = supplierVo.isNegotiates();
		this.supplierRating = supplierVo.getSupplierRating();
		this.lastUpdatedBy = supplierVo.getLastUpdatedBy();
		this.deleted = supplierVo.isDeleted();
		//updateDestinationsFromVO(supplierVo.getOperatingDestinations());
		 
	}
	
	private void updateDestinationsFromVO(Set<String> operatingDestinations) {
		operatingDestinations.forEach((e) -> { 
			
			Udn_Destinations_Entity entity = new Udn_Destinations_Entity();
			//System.out.println("Submitted Entity is " + e);
			entity.setDestinationId(Integer.parseInt(e));
			destinations.add(entity);
			//System.out.println("Set is " + destinations);
		});
	}
	
	public Set<Udn_Destinations_Entity> getDestinations() {
		return destinations;
	}
	
	public void setDestinations(Set<Udn_Destinations_Entity> destinations) {
		this.destinations = destinations;
	}
	public Set<Tg_Supplier_Contact_Entity> getSupplierContactsList() {
		return supplierContactsList;
	}
	public void setSupplierContactsList(Set<Tg_Supplier_Contact_Entity> supplierContactsList) {
		this.supplierContactsList = supplierContactsList;
	}
	
	
		
}
