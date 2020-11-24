package DB;
import java.sql.*;


public class DBHandler extends Configs{
    Connection dbConnection;

    public Connection getDbConnection()
            throws ClassNotFoundException, SQLException{


        String Sconnection = "jdbc:mysql://" + dbHost + ":"
                + dbPort + "/" + dbName + "?serverTimezone=UTC";
        Class.forName("com.mysql.jdbc.Driver");

        dbConnection = DriverManager.getConnection(Sconnection, dbUser, dbPass);
        return dbConnection;
    }

}
