package bean;

public class Donors{
   private String name,street,city,district,phone_number,second_phone_number,emailID,bld_grp;
   private long age;
   public Donors(String n,String email,String phone1,String phone2,String bld_grp1,String street1,String city1,String district1,long a){
	   name=n;
	   street=street1;
	   city=city1;
	   district=district1;
	   phone_number=phone1;
	   second_phone_number=phone2;
	   emailID=email;
	   bld_grp=bld_grp1;
	   age=a;
   }   
   public String getName(){
      return name;
	}
   public String getStreet(){
      return street;
	}
   public String getCity(){
      return city;
	}
   public String getDistrict(){
      return district;
	}
   public String getPhone1(){
      return phone_number;
	}
   public String getPhone2(){
      return second_phone_number;
	}
   public String getEmail(){
      return emailID;
	}
   public long getAge(){
      return age;
	}
   public String getBldGrp(){
      return bld_grp;
	}
   public void setName(String name1){
	  name=name1;
   }
   public void setStreet(String street1){
	  street=street1;
   }
   public void setCity(String city1){
	  city=city1;
   }
   public void setDistrict(String district1){
	  district=district1;
   }
   public void setPhone1(String phone1){
	  phone_number=phone1;
   }
   public void setPhone2(String phone2){
	  second_phone_number=phone2;
   }
   public void setEmail(String emailID1){
	  emailID=emailID1;
   }
   public void setAge(long age1){
	  age=age1;
   }
   public void setBldGrp(String bld_grp1){
	  bld_grp=bld_grp1;
   }
   
}