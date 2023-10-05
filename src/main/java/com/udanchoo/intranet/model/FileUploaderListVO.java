package com.udanchoo.intranet.model;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;




public class FileUploaderListVO {

	
	private Long dealConfirmationId;
	private ArrayList<String> flight;
	private ArrayList<String> hotel;
	private ArrayList<String> insurance;
	private ArrayList<String> landPackage;
	private ArrayList<String> others;
	private ArrayList<String> sightSeeing;
	private ArrayList<String> transfers;
	private ArrayList<String> visa;
	
	/*
	private ArrayList<String> flightFilesList;
	private ArrayList<String> hotelFilesList;
	private ArrayList<String> insuranceFilesList;
	private ArrayList<String> landPackageFilesList;
	private ArrayList<String> othersFilesList;
	private ArrayList<String> sightseeingsFilesList;
	private ArrayList<String> transfersFilesList;
	private ArrayList<String> visaFilesList;
	
	
	public ArrayList<String> getFlightFilesList() {
		return flightFilesList;
	} 
	public void setFlightFilesList(ArrayList<String> flightFilesList) {
		this.flightFilesList = flightFilesList;
	}
	
	public ArrayList<String> getHotelFilesList() {
		return hotelFilesList;
	}
	public void setHotelFilesList(ArrayList<String> hotelFilesList) {
		this.hotelFilesList = hotelFilesList;
	}
	public ArrayList<String> getInsuranceFilesList() {
		return insuranceFilesList;
	}
	public void setInsuranceFilesList(ArrayList<String> insuranceFilesList) {
		this.insuranceFilesList = insuranceFilesList;
	}
	public ArrayList<String> getLandPackageFilesList() {
		return landPackageFilesList;
	}
	public void setLandPackageFilesList(ArrayList<String> landPackageFilesList) {
		this.landPackageFilesList = landPackageFilesList;
	}
	public ArrayList<String> getOthersFilesList() {
		return othersFilesList;
	}
	public void setOthersFilesList(ArrayList<String> othersFilesList) {
		this.othersFilesList = othersFilesList;
	}
	public ArrayList<String> getSightseeingsFilesList() {
		return sightseeingsFilesList;
	}
	public void setSightseeingsFilesList(ArrayList<String> sightseeingsFilesList) {
		this.sightseeingsFilesList = sightseeingsFilesList;
	}
	public ArrayList<String> getTransfersFilesList() {
		return transfersFilesList;
	}
	public void setTransfersFilesList(ArrayList<String> transfersFilesList) {
		this.transfersFilesList = transfersFilesList;
	}
	public ArrayList<String> getVisaFilesList() {
		return visaFilesList;
	}
	public void setVisaFilesList(ArrayList<String> visaFilesList) {
		this.visaFilesList = visaFilesList;
	}
	*/
	
	
	public ArrayList<String> getInsurance() {
		return insurance;
	}
	public void setInsurance(ArrayList<String> insurance) {
		this.insurance = insurance;
	}
	public ArrayList<String> getLandPackage() {
		return landPackage;
	}
	public void setLandPackage(ArrayList<String> landPackage) {
		this.landPackage = landPackage;
	}
	public ArrayList<String> getOthers() {
		return others;
	}
	public void setOthers(ArrayList<String> others) {
		this.others = others;
	}
	public ArrayList<String> getSightSeeing() {
		return sightSeeing;
	}
	public void setSightSeeing(ArrayList<String> sightSeeing) {
		sightSeeing = sightSeeing;
	}
	public ArrayList<String> getTransfers() {
		return transfers;
	}
	public void setTransfers(ArrayList<String> transfers) {
		this.transfers = transfers;
	}
	public ArrayList<String> getVisa() {
		return visa;
	}
	public void setVisa(ArrayList<String> visa) {
		this.visa = visa;
	}
	public ArrayList<String> getHotel() {
		return hotel;
	}
	public void setHotel(ArrayList<String> hotel) {
		this.hotel = hotel;
	}
	public ArrayList<String> getFlight() {
		return flight;
	}
	public void setFlight(ArrayList<String> flight) {
		this.flight = flight;
	}
	public Long getDealConfirmationId() {
		return dealConfirmationId;
	}
	public void setDealConfirmationId(Long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}
	
	
	
	
	public String toString() {
		String fileNameList ="<table>";
		fileNameList = fileNameList +  displayIterator(flight, "Flight -> ");
		fileNameList = fileNameList + " " + displayIterator(hotel,"Hotel -> ");
		fileNameList = fileNameList + " " + displayIterator(insurance,"Insurance -> ");
		fileNameList = fileNameList + " " + displayIterator(landPackage,"Land Package -> ");
		fileNameList = fileNameList + " " + displayIterator(others,"Others -> ");
		fileNameList = fileNameList + " " + displayIterator(sightSeeing,"SightSeeings -> ");
		fileNameList = fileNameList + " " + displayIterator(transfers,"Transfers -> ");
		fileNameList = fileNameList + " " + displayIterator(visa,"Visa -> ");
		return fileNameList + "</table>";
		

	}
	
	
	public String displayIterator(ArrayList list,String service) {
		String str="";
		if(list!=null && !list.isEmpty()) {
			str="<tr><td style=\"text-align: left;\">" + service + "[";
			Iterator itr = list.iterator();
			while(itr.hasNext()) {
				File tempFile=new File((String)itr.next());
				str = str +  " - " + tempFile.getName();
			}
			str=str+"]</td></tr>";
		}
		return str;
	}
	
	
}
