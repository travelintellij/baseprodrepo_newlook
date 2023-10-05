package com.udanchoo.intranet.validator;

import java.io.File;

public class MyFirstClass {

	public static void main(String[] args) {
		File file = new File("C:\\uploads\\deals\\9\\Flight\\E Ticket-JFK-DEL-JFK.pdf");
		if(file.exists()) {
			System.out.println("File Exists -  > " + file.getPath());
		}

	}

}
