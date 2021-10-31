package bean;
public class ED{
  public String encrypt(String original){
	  try{
	    if(original.length()==0){
			return "";
		}
		char arr[]=original.toCharArray();
		String enc="";
		int a=(int)(Math.random()*(9+1)+1);
		System.out.println(a);
		for(char ch:arr){
		   ch+=a;
		   enc+=ch;
		   }
		char ch=(char)(a+65);
		enc+=ch;
		System.out.println(decrypt(enc));
		return enc;
	   }catch(Exception e){
		   return "";
	   }
    }
	
  public String decrypt(String original){
	  try{
	    if(original.length()==0){
			return "";
		}
		char arr[]=original.toCharArray();
		String enc="";
		char ch1=arr[arr.length-1];
		int a=(int)(ch1);
		a-=65;
        System.out.println(ch1+" "+a);		
		for(char ch:arr){
		   ch-=a;
		   enc+=ch;
		   }
		enc=enc.substring(0,enc.length()-1);
		return enc;
	   }catch(Exception e){
		   return "";
	   }
  }
}