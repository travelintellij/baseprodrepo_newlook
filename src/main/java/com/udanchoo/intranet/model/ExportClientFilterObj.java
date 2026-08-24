package com.udanchoo.intranet.model;

public class ExportClientFilterObj {
	private int cityId = 0;
	private String cityName;
	private String dateFilterType = "ALL"; // ALL, TODAY, AFTER, RANGE
	private String createdAfterDate;
	private String startDate;
	private String endDate;
	private String reference;
	private String exportPurpose;

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

	public String getDateFilterType() {
		return dateFilterType;
	}

	public void setDateFilterType(String dateFilterType) {
		this.dateFilterType = dateFilterType;
	}

	public String getCreatedAfterDate() {
		return createdAfterDate;
	}

	public void setCreatedAfterDate(String createdAfterDate) {
		this.createdAfterDate = createdAfterDate;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getReference() {
		return reference;
	}

	public void setReference(String reference) {
		this.reference = reference;
	}

	public String getExportPurpose() {
		return exportPurpose;
	}

	public void setExportPurpose(String exportPurpose) {
		this.exportPurpose = exportPurpose;
	}
}
