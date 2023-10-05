package com.udanchoo.intranet.model.supplier;

import java.util.HashSet;
import java.util.Set;

import com.udanchoo.intranet.entity.Udn_Destinations_Entity;
import com.udanchoo.intranet.entity.supplier.Tg_Supplier_Master_Entity;

public class TgSupplierMasterVO extends Tg_Supplier_Master_Entity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//private List operatingDestinations = new ArrayList();

	private String cityName;
	private String countryName;
	private String destinationNames;
	private String minOneserviceError;
	private Set<String> operatingDestinations = new HashSet();


	public TgSupplierMasterVO() {
		
	}
	
	public TgSupplierMasterVO(Tg_Supplier_Master_Entity tgSupplierEntity) {
		this.supplierId = tgSupplierEntity.getSupplierId();
		this.supplierName = tgSupplierEntity.getSupplierName();
		this.companyDetails = tgSupplierEntity.getCompanyDetails();
		this.address = tgSupplierEntity.getAddress();
		this.cityId = tgSupplierEntity.getCityId();
		this.countryId = tgSupplierEntity.getCountryId();
		this.mobile = tgSupplierEntity.getMobile();
		this.phone = tgSupplierEntity.getPhone();
		this.email = tgSupplierEntity.getEmail();
		this.gstDetails = tgSupplierEntity.getGstDetails();
		this.bankDetails = tgSupplierEntity.getBankDetails();
		this.remarks = tgSupplierEntity.getRemarks();
		this.referredBy = tgSupplierEntity.getReferredBy();
		this.consolidator = tgSupplierEntity.isConsolidator();
		this.landPackage= tgSupplierEntity.isLandPackage();
		/*
		this.packageWithFlight = tgSupplierEntity.isPackageWithFlight();
		this.packageWithoutFlight = tgSupplierEntity.isPackageWithoutFlight();
		*/
		
		
		this.flight = tgSupplierEntity.isFlight();
		this.hotel = tgSupplierEntity.isHotel();
		this.transfers = tgSupplierEntity.isTransfers();
		this.sightseeing = tgSupplierEntity.isSightseeing();
		this.visa = tgSupplierEntity.isVisa();
		this.insurance = tgSupplierEntity.isInsurance();
		this.cruise = tgSupplierEntity.isCruise();
		this.others = tgSupplierEntity.isOthers();
		this.negotiates = tgSupplierEntity.isNegotiates();
		this.supplierRating = tgSupplierEntity.getSupplierRating();
		this.lastUpdatedBy = tgSupplierEntity.getLastUpdatedBy();
		this.destinations = tgSupplierEntity.getDestinations();
		updateDestinationsFromVO(destinations);
		this.supplierContactsList = tgSupplierEntity.getSupplierContactsList();
		this.deleted = tgSupplierEntity.isDeleted();
		//this.operatingDestinations = tgSupplierEntity.getOperatingDestinations();
	}

	
	public void setSupplierVoFromEntity(Tg_Supplier_Master_Entity tgSupplierEntity) {
			this.supplierId = tgSupplierEntity.getSupplierId();
			this.supplierName = tgSupplierEntity.getSupplierName();
			this.companyDetails = tgSupplierEntity.getCompanyDetails();
			this.address = tgSupplierEntity.getAddress();
			this.cityId = tgSupplierEntity.getCityId();
			this.countryId = tgSupplierEntity.getCountryId();
			this.mobile = tgSupplierEntity.getMobile();
			this.phone = tgSupplierEntity.getPhone();
			this.email = tgSupplierEntity.getEmail();
			this.gstDetails = tgSupplierEntity.getGstDetails();
			this.bankDetails = tgSupplierEntity.getBankDetails();
			this.remarks = tgSupplierEntity.getRemarks();
			this.referredBy = tgSupplierEntity.getReferredBy();
			this.consolidator = tgSupplierEntity.isConsolidator();
			this.landPackage= tgSupplierEntity.isLandPackage();
			/*
			this.packageWithFlight = tgSupplierEntity.isPackageWithFlight();
			this.packageWithoutFlight = tgSupplierEntity.isPackageWithoutFlight();
			*/
			this.flight = tgSupplierEntity.isFlight();
			this.hotel = tgSupplierEntity.isHotel();
			this.transfers = tgSupplierEntity.isTransfers();
			this.sightseeing = tgSupplierEntity.isSightseeing();
			this.visa = tgSupplierEntity.isVisa();
			this.insurance = tgSupplierEntity.isInsurance();
			this.cruise = tgSupplierEntity.isCruise();
			this.others = tgSupplierEntity.isOthers();
			this.negotiates = tgSupplierEntity.isNegotiates();
			this.supplierRating = tgSupplierEntity.getSupplierRating();
			this.lastUpdatedBy = tgSupplierEntity.getLastUpdatedBy();
			this.destinations = tgSupplierEntity.getDestinations();
			updateDestinationsFromVO(destinations);
			this.supplierContactsList = tgSupplierEntity.getSupplierContactsList();
			this.deleted = tgSupplierEntity.isDeleted();
			//this.operatingDestinations = tgSupplierEntity.getOperatingDestinations();
		}

	private void updateDestinationsFromVO(Set<Udn_Destinations_Entity> destinationEntity) {
		destinationEntity.forEach((e) -> { 
			operatingDestinations.add(String.valueOf(e.getDestinationId()));
		});
	}
	
	
	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}




	public String getDestinationNames() {
		return destinationNames;
	}

	public void setDestinationNames(String destinationNames) {
		this.destinationNames = destinationNames;
	}

	

	@Override
	public String toString() {
		return "TgSupplierMasterVO [cityName=" + cityName + ", countryName=" + countryName + ", destinationNames="
				+ destinationNames + ", minOneserviceError=" + minOneserviceError + ", operatingDestinations="
				+ operatingDestinations + "]";
	}

	public String getMinOneserviceError() {
		return minOneserviceError;
	}

	public void setMinOneserviceError(String minOneserviceError) {
		this.minOneserviceError = minOneserviceError;
	}

	public Set<String> getOperatingDestinations() {
		return operatingDestinations;
	}

	public void setOperatingDestinations(Set<String> operatingDestinations) {
		this.operatingDestinations = operatingDestinations;
	}

	

}
