package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class connectDB {
    public Connection getConnection() throws Exception{
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;"
                    + "databaseName=Quanlybanphukiendienthoai;user=sa;password=123;");
            System.out.println("Da ket noi duoc");
        } catch (Exception e) {
            System.out.println("chua ket noi duoc");
            e.printStackTrace();
        }
		return conn;
    }
    public static void main(String[] args) throws Exception {
		System.out.println(new connectDB().getConnection());
	}
}
