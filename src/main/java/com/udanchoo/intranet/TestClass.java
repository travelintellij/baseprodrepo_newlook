package com.udanchoo.intranet;

public class TestClass {

	public static void main(String[] arg) {
		int total=10;
		
		Integer mytotal=10;
		changeInt(mytotal);
		//changeNumber(total);
		System.out.println("2 Hello Ritik Chal gayab " + total);
	}
	
	private static void changeNumber(int myno) {
		myno = myno + 5;
		System.out.println("0 My number is " + myno);
	}
	
	private static void changeInt(Integer myno) {
		myno = myno + 5;
		System.out.println("1 My number is " + myno);
	}

	
}
