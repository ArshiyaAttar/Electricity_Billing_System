package com.ebilling.DBConnection;

import java.sql.Timestamp;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
public class Validation {
	
	public static Timestamp convertStringToTimestamp(String str_date) {
	    try {
	    	System.out.println("iniside this");
	      DateFormat formatter=null;
	      Date date=null;
	      formatter = new SimpleDateFormat("dd/MM/yyyy");
	       date = (Date) formatter.parse(str_date);
	      java.sql.Timestamp timeStampDate = new Timestamp(date.getTime());

	      return timeStampDate;
	    } catch (ParseException e) {
	      System.out.println("Exception :" + e);
	      return null;
	    }
	  }
	
	
	
	public static boolean isValid(String s) 
	{ 
	      
	   
	    Pattern p = Pattern.compile("(0/91)?[7-9][0-9]{9}"); 
	  
	  
	    Matcher m = p.matcher(s); 
	    return (m.find() && m.group().equals(s)); 
	} 
	
	public static boolean isValidUsername(String s) 
	{ 
	      System.out.println("inside uername validator");
	   
	    Pattern p = Pattern.compile("[A-Z][a-z]*"); 
	  
	    
	    Matcher m = p.matcher(s); 
	    return (m.find() && m.group().equals(s)); 
	} 
	
	public static boolean isValidUserid(CharSequence s) 
	{ 
	      System.out.println("inside uername validator");
	   
	    Pattern p = Pattern.compile("[0-9]+"); 
	  
	   
	    Matcher m = p.matcher(s); 
	    return (m.find() && m.group().equals(s)); 
	} 
}
