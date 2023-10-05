package com.udanchoo.intranet.model;

import java.util.List;
import java.util.Map;

public class Tag {

	public Long id;
	public String tagName;
	Map keyValueList;
	//public String inputSearch;
	

	public Tag() {
		
	}
	

	

	public Map getKeyValueList() {
		return keyValueList;
	}




	public void setKeyValueList(Map keyValueList) {
		this.keyValueList = keyValueList;
	}




	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public Tag(Long id, String tagName) {
		this.id = id;
		this.tagName = tagName;
	}
	
	public String toString() {
		return "Tag id is : " + id + " Tag Name is " + tagName + " RCat List size is " + keyValueList.size();
	}

	/*public String getInputSearch() {
		return inputSearch;
	}

	public void setInputSearch(String inputSearch) {
		this.inputSearch = inputSearch;
	}*/
	
	

}