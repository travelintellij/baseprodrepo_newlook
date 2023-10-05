package com.udanchoo.intranet.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.udanchoo.intranet.model.Udn_SightSeeing_Master_Obj;

@Entity
@Table(name = "udn_sight_seeing_master")
public class Udn_SightSeeing_Master_Entity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long sightSeeingId;
	
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
	private boolean active;
	private int tourRating;
	private boolean flexibleTimming;
	private boolean deleted;

	
	public Udn_SightSeeing_Master_Entity() {}
	
	public Udn_SightSeeing_Master_Entity(Udn_SightSeeing_Master_Obj sightSeeingObj) {
		this.sightSeeingId=sightSeeingObj.getSightSeeingId();
		this.sightSeeingName=sightSeeingObj.getSightSeeingName();
		this.cityId=sightSeeingObj.getCityId();
		this.sightSeeingDescription=sightSeeingObj.getSightSeeingDescription();
		this.duration=sightSeeingObj.getDuration();
		this.departurePoint=sightSeeingObj.getDeparturePoint();
		this.reportingPoint=sightSeeingObj.getReportingPoint();
		this.meals=sightSeeingObj.getMeals();
		this.usefulInfo=sightSeeingObj.getUsefulInfo();
		this.tnc=sightSeeingObj.getTnc(); // Terms and Conditions
		this.standardPickupTime=sightSeeingObj.getStandardPickupTime();
		this.standardDropTime=sightSeeingObj.getStandardDropTime();
		this.flexibleTimming = sightSeeingObj.isFlexibleTimming();
		this.tourRating = sightSeeingObj.getTourRating();
		this.active=sightSeeingObj.isActive();
		this.deleted=sightSeeingObj.isDeleted();
	}
	
	public String toString() {
		String attrib = "Displaying SightSeeing Master: ";
		attrib = attrib +  "\n" + "sightSeeingId -> " + sightSeeingId + "\n";
		attrib = attrib + "sightSeeingName - >" + sightSeeingName+ "\n";
		attrib = attrib + "cityId - >" + cityId+ "\n";
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

	public void setSightSeeingId(long sightSeeingId) {
		this.sightSeeingId = sightSeeingId;
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

	public void setTourRating(int tourRating) {
		this.tourRating = tourRating;
	}

	public boolean isDeleted() {
		return deleted;
	}

	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	
	
	
	
}