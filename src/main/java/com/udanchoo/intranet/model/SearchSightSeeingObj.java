package com.udanchoo.intranet.model;

public class SearchSightSeeingObj extends Udn_SightSeeing_Master_Obj{
	private int minDuration;
	private int maxDuration;

	public String toString() {
		
		System.out.println(super.toString());
		String attrib = "minDuration -> " + minDuration +"\n";
		attrib = attrib + "maxDuration -> " + maxDuration + "\n";
	
		return attrib;
	}
	
	
	public SearchSightSeeingObj() {
		super();
	}


	public int getMinDuration() {
		return minDuration;
	}


	public void setMinDuration(String minDuration) {
		if(minDuration!=null && minDuration.trim().length()>0) {
			this.minDuration = Integer.parseInt(minDuration);
		}
		else {
			this.minDuration = 0;
		}
		
	}


	public int getMaxDuration() {
		return maxDuration;
	}


	public void setMaxDuration(String maxDuration) {
		if(maxDuration!=null && maxDuration.trim().length()>0) {
			this.maxDuration = Integer.parseInt(maxDuration);
		}
		else {
			this.maxDuration = 0;
		}
		
	}
	
	
	
}