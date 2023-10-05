package com.udanchoo.intranet.model;

public class SearchHotelObj extends Udn_Hotel_Master_Obj {
	
	//private String hotelChainId;

	private int searchPrefer=0;

	public int getSearchPrefer() {
		return searchPrefer;
	}

	public void setSearchPrefer(int searchPrefer) {
		this.searchPrefer = searchPrefer;
	}

	private String hotelChainName;

	public String getInputSearch() {
		return inputSearch;
	}

	public void setInputSearch(String inputSearch) {
		this.inputSearch = inputSearch;
	}

	private String inputSearch;

	/*public String getHotelChainId() {
		return hotelChainId;
	}

	public void setHotelChainId(String hotelChainId) {
		this.hotelChainId = hotelChainId;
	}*/

	public String getHotelChainName() {
		return hotelChainName;
	}

	public void setHotelChainName(String hotelChainName) {
		this.hotelChainName = hotelChainName;
	}


	public String toString() {
		
		System.out.println(super.toString());
		String attrib = "hotelChainId -> " + hotelChainId +"\n";
		attrib = attrib + "hotelChainName -> " + hotelChainName + "\n";
		attrib = attrib + "inputSearch -> " + inputSearch + "\n";
		attrib = attrib + "searchPrefer -> " + searchPrefer + "\n";
		return attrib;
	}
	
	
	public SearchHotelObj() {
		super();
	}
	
}