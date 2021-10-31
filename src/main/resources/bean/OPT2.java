package bean;
import java.sql.*;
import java.util.*;
import java.text.SimpleDateFormat;
import java.text.ParseException;

public class OPT2{
   public int convertTime(String time){
			int ans=0;
			char arr[]=time.toCharArray();
			for(int i=0;i<arr.length;i++){
			     char ch=arr[i];
				 if(Character.isDigit(ch)){
				     int a=Character.getNumericValue(ch);
					 ans=ans*10+a;
				  }
				 else if(ch=='P' || ch=='p'){
				     ans+=12;
					 break;
				  }
			}
		    return ans;
		}
   public boolean isValid(String startTime,String endTime){
			SimpleDateFormat formatter = new SimpleDateFormat("HH");
	        java.util.Date date = new java.util.Date();
			String time=formatter.format(date);
			int actual=Integer.parseInt(time);
			int low=convertTime(startTime);
			int high=convertTime(endTime);
			if(actual>=low && actual<=high){
			     return true;
				 }
		    return false;
		}
	public boolean isValidDonor(String last_donate){
		if(last_donate==null){
			return true;
		}
		else{
		try{
		    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		    java.util.Date date = new java.util.Date();
			java.util.Date last_donate_date=formatter.parse(last_donate);
			long date1InMs = date.getTime();
			long date2InMs = last_donate_date.getTime();
			long timeDiff = 0;
			if(date1InMs > date2InMs) {
				timeDiff = date1InMs - date2InMs;
			} else {
				timeDiff = date2InMs - date1InMs;
			}
			int daysDiff = (int) (timeDiff / (1000 * 60 * 60* 24));
			if(daysDiff>=90){
				return true;
			}
			}catch(Exception e){
				return false;
			}
			return false;
		}
	}
}

						 
					    
				    
   