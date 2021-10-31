package bean;
import java.sql.*;


public class DButil{
  public Connection getConnection() throws Exception{
    try{
		Class.forName("com.mysql.jdbc.Driver"); 
	
		//Connection con=DriverManager.getConnection("jdbc:mysql://sql6.freesqldatabase.com/sql6439461","sql6439461","IRDUaTij9B");
		//String url="jdbc:mysql://localhost:3306/mydb";
		//String user="root";
		//String password="";
		String url="jdbc:mysql://remotemysql.com/nx84IdznJx";
		String user="nx84IdznJx";
		String password="nTtYHxbwio";
		Connection con=DriverManager.getConnection(url,user,password);
		return con;
	}
	catch(Exception e){
		throw e;
	   }
   }
}
	