package com.nobious.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTimeFomatter {

	public static String getCurrentTimeStamp()
	{
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date = simpleDateFormat.format(new Date());
		System.out.println(date);
		return date;
	}
	
}
