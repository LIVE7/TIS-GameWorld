package common.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	
	private static String url="jdbc:oracle:thin:@jobs.cbflhtwx5pyr.ap-northeast-2.rds.amazonaws.com:1521:ORCL";
	private static String user="mydev";
	private static String pwd="tigertiger";
	
	static {
		
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("Driver Loading Success!");
		}catch(ClassNotFoundException e) {
			System.out.println("Driver Loading Fail..: ");
			e.printStackTrace();
		}
		
	}
	
	public static Connection getCon() throws java.sql.SQLException{
		Connection con=DriverManager.getConnection(url,user,pwd);
		return con;
	}
	
}
