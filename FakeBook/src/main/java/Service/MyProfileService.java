/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import Model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author acer
 */
public class MyProfileService {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/fakebook";
    private static final String USER_NAME = "root";
    private static final String PASSWORD = "123456789";
    public Connection connection = null;

    public MyProfileService() {
        this.connection = getConnection(DB_URL, USER_NAME, PASSWORD);
    }

    /**
     * get connection to mySql
     *
     * @param urlDBString
     * @param username
     * @param password
     * @return
     */
    private Connection getConnection(String urlDBString, String username, String password) {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(urlDBString,
                    username, password);
            System.out.println("connect to DB success!!");
        } catch (ClassNotFoundException | SQLException exception) {
            System.out.println("can't connect to database!!!" + exception.getMessage());
        }

        return conn;
    }

    public User getMyProfileByUserName(String userName) {
        User result = null;

        try (Statement stmt = this.connection.createStatement()) {
            // Use a parameterized query to avoid SQL injection
            String sql = "SELECT * FROM user_account WHERE user_name = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, userName);

                // Execute the query
                try (ResultSet rs = preparedStatement.executeQuery()) {
                    // Map myProfile data
                    while (rs.next()) {
                        User user = new User();
                        user.setId(rs.getString(1));
                        user.setUsername(rs.getString(2));
                        user.setPassword(rs.getString(3));
                        user.setGender(rs.getString(4));
                        user.setBirthday(rs.getDate(5));
                        user.setPhone(rs.getString(6));
                        user.setEmail(rs.getString(7));
                        user.setFirstName(rs.getString(8));
                        user.setLastName(rs.getString(9));
                        user.setAvatar(rs.getString(10));
                        user.setBackground(rs.getString(11));
                        result = user;
                        break;  // Assuming there's only one matching user, you can remove this line if not
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }

        return result;
    }

//    public int insertMyProfile(String name, String phone, String email, String gender, String avatar) {
//        try {
//            String insertQuery = "INSERT INTO MYPROFILE_image (name, phone, email, gender, avatar) VALUES (?, ?, ?, ?, ?)";
//            // Tạo PreparedStatement
//            PreparedStatement preparedStatement;
//            preparedStatement = connection.prepareStatement(insertQuery);
//            // Thiết lập các tham số trong truy vấn
//            preparedStatement.setString(1, name);
//            preparedStatement.setString(2, phone);
//            preparedStatement.setString(3, email);
//            preparedStatement.setString(4, gender);
//            preparedStatement.setString(5, avatar);
//
//            // Thực hiện INSERT
//            int rowsInserted = preparedStatement.executeUpdate();
//            return rowsInserted;
//        } catch (SQLException ex) {
//            System.out.println("error: " + ex.getMessage());
//        }
//        return 0;
//    }
    public int updateMyProfile(String userName, String avatarImage, String coverImage) {
        try {
            String updateQuery = "UPDATE user_account t SET t.avatar = ?, t.background = ? WHERE t.user_name = ?";
            // Tạo PreparedStatement
            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(updateQuery);
            // Thiết lập các tham số trong truy vấn
            preparedStatement.setString(1, avatarImage);
            preparedStatement.setString(2, coverImage);
            preparedStatement.setString(3, userName);

            // Thực hiện update
            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated;
        } catch (SQLException ex) {
            System.out.println("error: " + ex.getMessage());
        }
        return 0;
    }

//    public int deleteMyProfile(int id) {
//        try {
//            String insertQuery = "DELETE FROM myProfile WHERE id = ?";
//            // Tạo PreparedStatement
//            PreparedStatement preparedStatement;
//            preparedStatement = connection.prepareStatement(insertQuery);
//            // Thiết lập các tham số trong truy vấn
//            preparedStatement.setInt(1, id);
//
//            // Thực hiện delete
//            int rowsInserted = preparedStatement.executeUpdate();
//            return rowsInserted;
//        } catch (SQLException ex) {
//            System.out.println("error: " + ex.getMessage());
//        }
//        return 0;
//    }
}
