package com.tools;

import java.text.ParseException;

public class ChStr {

	public String chStr(String str) {      //返回中文字符串
		if (str == null) {
			str = "";
		} else {
			try {
				//str = (new String(str.getBytes("iso-8859-1"), "GBK")).trim();   //原
				str = (new String(str.getBytes("iso-8859-1"), "utf-8")).trim();   //0k   解决了中文乱码
			} catch (Exception e) {
				e.printStackTrace(System.err);
			}
		}
		return str;
	}

	public String convertStr(String str1) {
		if (str1 == null) {
			str1 = "";
		} else {
			try {
				str1 = str1.replaceAll("<", "&lt;");
				str1 = str1.replaceAll(">", "&gt;");
				str1 = str1.replaceAll(" ", "&nbsp;");
				str1 = str1.replaceAll("\r\n", "<br>");
			} catch (Exception e) {
				e.printStackTrace(System.err);
			}
		}
		return str1;
	}
	
	/**
     * <li>功能描述：时间相减得到天数
     * @param beginDateStr
     * @param endDateStr
     * @return
     * long 
     * @author Administrator
     */
    public static long getDaySub(String beginDateStr,String endDateStr)
    {
        long day=0;
        java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");    
        java.util.Date beginDate;
        java.util.Date endDate;
        try
        {
            beginDate = format.parse(beginDateStr);
            endDate= format.parse(endDateStr);    
            day=(endDate.getTime()-beginDate.getTime())/(24*60*60*1000);    
            //System.out.println("相隔的天数="+day);   
        } catch (ParseException e)
        {
            // TODO 自动生成 catch 块
            e.printStackTrace();
        }   
        return day;
    }
    
    /**
     * <li>功能描述：时间相减得到天数
     * @param beginDateStr
     * @param endDateStr
     * @return
     * int
     * @author Administrator
     */
    public static int getDaySub_int(String beginDateStr,String endDateStr)
    {
        int day=0;
        java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");    
        java.util.Date beginDate;
        java.util.Date endDate;
        try
        {
            beginDate = format.parse(beginDateStr);
            endDate= format.parse(endDateStr);    
            day=(int) ((endDate.getTime()-beginDate.getTime())/(24*60*60*1000));    
            //System.out.println("相隔的天数="+day);   
        } catch (ParseException e)
        {
            // TODO 自动生成 catch 块
            e.printStackTrace();
        }   
        return day;
    }
    
    /**
     * <li>功能描述：时间相减得到天数
     * @param beginDateStr
     * @param endDateStr
     * @return
     * int
     * @author Administrator
     */
    public static int getDaySub_int_1(String beginDateStr,String endDateStr)
    {
        int day=0;
        java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("MM/dd/yyyy");    
        java.util.Date beginDate;
        java.util.Date endDate;
        try
        {
            beginDate = format.parse(beginDateStr);
            endDate= format.parse(endDateStr);    
            day=(int) ((endDate.getTime()-beginDate.getTime())/(24*60*60*1000));    
            //System.out.println("相隔的天数="+day);   
        } catch (ParseException e)
        {
            // TODO 自动生成 catch 块
            e.printStackTrace();
        }   
        return day;
    }
}
