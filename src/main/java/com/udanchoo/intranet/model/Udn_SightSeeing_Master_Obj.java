package com.udanchoo.intranet.model;

import com.udanchoo.intranet.entity.Udn_SightSeeing_Master_Entity;

public class Udn_SightSeeing_Master_Obj {
	
	private long sightSeeingId=0;
	private String sightSeeingName;
	private int cityId;
	private String sightSeeingDescription;
	private int duration;
	private String departurePoint;
	private String reportingPoint;
	private String meals;
	private String usefulInfo;
	private String tnc; // Terms and Conditions
	private String standardPickupTime;
	private String standardDropTime;
	private boolean active=true;
	private int tourRating;
	private boolean flexibleTimming;
	private boolean deleted;
	
	//following variables are not stored in entity. 
	private String cityName;

	
	public Udn_SightSeeing_Master_Obj() {}
	

	public Udn_SightSeeing_Master_Obj(Udn_SightSeeing_Master_Entity sightSeeingEntity) {
		this.sightSeeingId=sightSeeingEntity.getSightSeeingId();
		this.sightSeeingName=sightSeeingEntity.getSightSeeingName();
		this.cityId=sightSeeingEntity.getCityId();
		this.sightSeeingDescription=sightSeeingEntity.getSightSeeingDescription();
		this.duration=sightSeeingEntity.getDuration();
		this.departurePoint=sightSeeingEntity.getDeparturePoint();
		this.reportingPoint=sightSeeingEntity.getReportingPoint();
		this.meals=sightSeeingEntity.getMeals();
		this.usefulInfo=sightSeeingEntity.getUsefulInfo();
		this.tnc=sightSeeingEntity.getTnc(); // Terms and Conditions
		this.standardPickupTime=sightSeeingEntity.getStandardPickupTime();
		this.standardDropTime=sightSeeingEntity.getStandardDropTime();
		this.active=sightSeeingEntity.isActive();
		this.flexibleTimming = sightSeeingEntity.isFlexibleTimming();
		this.tourRating = sightSeeingEntity.getTourRating();
	}
	
	public String toString() {
		String attrib = "Displaying SightSeeing Master: ";
		attrib = attrib +  "\n" + "sightSeeingId -> " + sightSeeingId + "\n";
		attrib = attrib + "sightSeeingName - >" + sightSeeingName+ "\n";
		attrib = attrib + "cityId - >" + cityId+ "\n";
		attrib = attrib + "cityName - >" + cityName+ "\n";
		attrib = attrib + "sightSeeingDescription - >" + sightSeeingDescription+ "\n";
		attrib = attrib + "duration - >" + duration+ "\n";
		attrib = attrib + "departurePoint - >" + departurePoint+ "\n";
		attrib = attrib + "reportingPoint - >" + reportingPoint+ "\n";
		attrib = attrib + "meals - >" + meals+ "\n";
		attrib = attrib + "usefulInfo - >" + usefulInfo+ "\n";
		attrib = attrib + "tnc - >" + tnc+ "\n";
		attrib = attrib + "standardPickupTime - >" + standardPickupTime+ "\n";
		attrib = attrib + "standardDropTime - >" + standardDropTime+ "\n";
		attrib = attrib + "flexibleTimming - >" + flexibleTimming+ "\n";
		attrib = attrib + "tourRating - >" + tourRating+ "\n";
		attrib = attrib + "active - >" + active+ "\n";
		attrib = attrib + "deleted - >" + deleted+ "\n";
		return attrib;
	}
	
	
	public long getSightSeeingId() {
		return sightSeeingId;
	}

	public void setSightSeeingId(String sightSeeingId) {
		if(sightSeeingId!=null && sightSeeingId.trim().length()>0) {
			this.sightSeeingId = Long.parseLong(sightSeeingId);
		}
		else {
			this.sightSeeingId = 0;
		}
	}

	public String getSightSeeingName() {
		return sightSeeingName;
	}

	public void setSightSeeingName(String sightSeeingName) {
		this.sightSeeingName = sightSeeingName;
	}

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public String getSightSeeingDescription() {
		return sightSeeingDescription;
	}

	public void setSightSeeingDescription(String sightSeeingDescription) {
		this.sightSeeingDescription = sightSeeingDescription;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public String getDeparturePoint() {
		return departurePoint;
	}

	public void setDeparturePoint(String departurePoint) {
		this.departurePoint = departurePoint;
	}

	public String getReportingPoint() {
		return reportingPoint;
	}

	public void setReportingPoint(String reportingPoint) {
		this.reportingPoint = reportingPoint;
	}

	public String getMeals() {
		return meals;
	}

	public void setMeals(String meals) {
		this.meals = meals;
	}

	public String getUsefulInfo() {
		return usefulInfo;
	}

	public void setUsefulInfo(String usefulInfo) {
		this.usefulInfo = usefulInfo;
	}

	public String getTnc() {
		return tnc;
	}

	public void setTnc(String tnc) {
		this.tnc = tnc;
	}

	public String getStandardPickupTime() {
		return standardPickupTime;
	}

	public void setStandardPickupTime(String standardPickupTime) {
		this.standardPickupTime = standardPickupTime;
	}

	public String getStandardDropTime() {
		return standardDropTime;
	}

	public void setStandardDropTime(String standardDropTime) {
		this.standardDropTime = standardDropTime;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}


	public boolean isFlexibleTimming() {
		return flexibleTimming;
	}


	public void setFlexibleTimming(boolean flexibleTimming) {
		this.flexibleTimming = flexibleTimming;
	}


	public int getTourRating() {
		return tourRating;
	}


	public void setTourRating(String tourRating) {
		if(tourRating!=null && tourRating.trim().length()>0) {
			this.tourRating = Integer.parseInt(tourRating);
		}
		else {
			this.tourRating = 0;
		}
	}


	public boolean isDeleted() {
		return deleted;
	}


	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	
	
	
	
}