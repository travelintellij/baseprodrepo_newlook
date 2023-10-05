package com.udanchoo.intranet.model;

import java.util.HashMap;
import java.util.Map;

public class DashboardObj {

	public String name;
	public long value;
	public String status;
	public Map map = new HashMap();
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getValue() {
		return value;
	}
	public void setValue(long value) {
		this.value = value;
	}
	
	public String toString() {
		String attr = "Name: " + name + " Value- " + value;
		return attr;
	}
	
	
	public Map getMap() {
		return map;
	}
	public void setMap(Map map) {
		this.map = map;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	 
	

}