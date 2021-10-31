package bean;

public class DonorProgress{
   private String day,description,city,district,amount,time,place,imgsrc;
   public DonorProgress(String day1,String description1,String city1,String district1,String amount1,String time1,String place1,String imgsrc1){
	   day=day1;
	   description=description1;
	   city=city1;
	   district=district1;
	   amount=amount1;
	   time=time1;
	   place=place1;
	   imgsrc=imgsrc1;
   }   
   public String getDay(){
      return day;
	}
   public String getDescription(){
      return description;
	}
   public String getCity(){
      return city;
	}
   public String getDistrict(){
      return district;
	}
   public String getAmount(){
      return amount;
	}
   public String getTime(){
      return time;
	}
   public String getPlace(){
      return place;
	}
   public String getImgSrc(){
      return imgsrc;
	}

   public void setDay(String day1){
	  day=day1;   
   }
   public void setDiscription(String description1){
	  description=description1;
   }
   public void setCity(String city1){
	  city=city1;
   }
   public void setDistrict(String district1){
	  district=district1;
   }
   public void setAmount(String amount1){
	  amount=amount1;
   }
   public void setTime(String time1){
	  time=time1;
   }
   public void setPlace(String place1){
	  place=place1;
   }
   public void setImgSrc(String imgsrc1){
	  imgsrc=imgsrc1;
   } 
}