/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utilities;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class JDBCUtil {

    private static final String DB_URL = "jdbc:mysql://localhost:1709/fakebook";
    private static final String USER_NAME = "root";
    private static final String PASSWORD = "";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL,
                    USER_NAME, PASSWORD);
            System.out.println("connect to DB success!!");
        } catch (ClassNotFoundException | SQLException exception) {
            System.out.println("can't connect to database!!!" + exception.getMessage());
        }

        return conn;
    }

    public static void closeConnection(Connection conn) {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
        }
    }

    public static void printInfo(Connection conn) {
        try {
            if (conn != null) {
                DatabaseMetaData mtdt = conn.getMetaData();
                System.out.println(mtdt.getDatabaseProductName());
                System.out.println(mtdt.getDatabaseProductVersion());
            }
        } catch (SQLException ex) {
        }

    }
}
