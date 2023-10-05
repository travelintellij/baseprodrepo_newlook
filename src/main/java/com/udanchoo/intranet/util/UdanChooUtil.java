package com.udanchoo.intranet.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Date;
import java.text.DateFormatSymbols;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;
import java.util.TreeMap;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.util.ResourceUtils;

public class UdanChooUtil {

	static DateFormatSymbols dateFormatSymbol = new DateFormatSymbols();
	
	
	public static Map sortMap(Map mapToSort) {
		TreeMap<String, String> sorted = new TreeMap<>();
		sorted.putAll(mapToSort);
		System.out.println("After Sorting:");
        Set set2 = sorted.entrySet();
        Iterator iterator2 = set2.iterator();
        while(iterator2.hasNext()) {
             Map.Entry me2 = (Map.Entry)iterator2.next();
             
             //System.out.print(me2.getKey() + ": ");
             //System.out.println(me2.getValue());
        }
         return sorted;
	}
	
	
	  public static HashMap<Long, String> sortByValue(HashMap<Long, String> hm)
	    {
	        // Create a list from elements of HashMap
	        List<Map.Entry<Long, String> > list =
	               new LinkedList<Map.Entry<Long, String> >(hm.entrySet());
	  
	        // Sort the list
	        Collections.sort(list, new Comparator<Map.Entry<Long, String> >() {
	            public int compare(Map.Entry<Long, String> o1, 
	                               Map.Entry<Long, String> o2)
	            {
	                return (o1.getValue()).compareTo(o2.getValue());
	            }
	        });
	          
	        // put data from sorted list to hashmap 
	        HashMap<Long, String> temp = new LinkedHashMap<Long, String>();
	        for (Map.Entry<Long, String> aa : list) {
	            temp.put(aa.getKey(), aa.getValue());
	        }
	        return temp;
	    }
	
	public static String getMonth(int month) {
	    return dateFormatSymbol.getMonths()[month];
	}
	
	 /**
     * Replace placeholders in a string by the values of the map structure.
     *
     * @param format The string to be formatted
     * @param values The key/value map for the replacement of the placeholders
     * @return the formatted string
     * @author: http://stackoverflow.com/a/2295004/794395
     */
    public static String replacePlaceholders(String format, Map<String, Object> values) {
        StringBuilder convFormat = new StringBuilder(format);
        ArrayList valueList = new ArrayList();
        int currentPos = 1;

        for (Entry<String, Object> entry : values.entrySet()) {
            String key = entry.getKey(), formatKey = "%(" + key + ")",
                    formatPos = "%" + Integer.toString(currentPos) + "$s";

            int index = -1;

            while ((index = convFormat.indexOf(formatKey, index)) != -1) {
                convFormat.replace(index, index + formatKey.length(), formatPos);
                index += formatPos.length();

            }
            valueList.add(entry.getValue());
            currentPos++;
        }
        return String.format(convFormat.toString(), valueList.toArray());
    }
    
    public static Properties notificationMessagesList(){
        Properties properties = new Properties();
        try {
            //File file = ResourceUtils.getFile("classpath:notification-messages.properties");
            //Resource resource = new ClassPathResource("notification-messages.properties", UdanChooConstants.class.getClassLoader());
            //InputStream in = new FileInputStream(resource.getFile());
        	InputStreamReader in = new InputStreamReader(new ClassPathResource("notification-messages.properties").getInputStream());
            properties.load(in);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return properties;
    }
}
