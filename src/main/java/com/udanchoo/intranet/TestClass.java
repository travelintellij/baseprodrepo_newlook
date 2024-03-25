package com.udanchoo.intranet;

import com.udanchoo.intranet.util.UdanChooUtil;

public class TestClass {

	public static void main(String[] arg) {
		System.out.println("Start Date is " + UdanChooUtil.getStartDayOfFinancialYear("2024-2025"));
		System.out.println("End Date is " + UdanChooUtil.getLastDayOfFinancialYear("2024-2025"));
	}
	
}
