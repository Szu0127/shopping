package eduvideoproducts.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {

private static Connection connection = null;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		
		String url = "jdbc:sqlserver://localhost:1433;databaseName=EDUvideoProducts";
		String user = "manager";
		String password = "mssql";
		if(connection==null) {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			connection=DriverManager.getConnection(url, user, password);
				
				System.out.print("連線成功");
				
		}
		return connection;
		
	}
}
