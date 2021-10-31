package bean;

import java.text.ParseException;  
import java.text.SimpleDateFormat;  
import java.util.Date;
import java.util.ArrayList;  
public class OPT{
  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
  public int getAge(String dob){
    long yeardiff=-1;
	try{
    formatter.setLenient(false);	
	Date d1=formatter.parse(dob);
	Date d2=new Date();
	long milli=d2.getTime()-d1.getTime();
    yeardiff=(milli/(1000l*24*60*60*365));
	}
	catch (Exception e) {e.printStackTrace();return 1;} 
    return (int)yeardiff;
    }
  public boolean verifyEmail(String email){
	String arr[]=email.split("@|.");
	if(arr[1].equals("gmail") && arr[2].equals("com")){
		return true;
	}
	return false;
  } 
  public String verifyDetails(String phn,String str,String city,String district,String avail,String avail1,String desc,String email){
	String query="update donors set phone_number='"+phn+"'";
	if(!str.isEmpty()){
		query+=",street='"+str+"'";
	}
	if(!city.isEmpty()){
		query+=",city='"+city+"'";
	}
	if(!district.isEmpty()){
		query+=",district='"+district+"'";
	}
	if(!avail1.isEmpty()){
		query+=",when_free='"+avail1+"'";
	}
	try{
	if(!avail.isEmpty()){
		query+=",anytime='"+avail+"'";
	}
	}catch(Exception e){}
	if(!desc.isEmpty()){
		query+=",general_description='"+desc+"'";
	}
	return query;
  }
}