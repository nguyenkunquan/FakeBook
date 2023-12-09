/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.User;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import utilities.JDBCUtil;

public class UserDAO {

    public static UserDAO getInstance() {
        return new UserDAO();
    }

    public int insert(User user) {
        try {
            Connection connection = JDBCUtil.getConnection();
            String insertQuery = "INSERT INTO USER_Account (id_user, user_name, pass, gender, birthday, phone, email, first_Name, last_Name, avatar, background)"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            // Tạo PreparedStatement
            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(insertQuery);
            // Thiết lập các tham số trong truy vấn
            preparedStatement.setString(1, user.getId());
            preparedStatement.setString(2, user.getUsername());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getGender());
            preparedStatement.setDate(5, user.getBirthday());
            preparedStatement.setString(6, user.getPhone());
            preparedStatement.setString(7, user.getEmail());
            preparedStatement.setString(8, user.getFirstName());
            preparedStatement.setString(9, user.getLastName());
            preparedStatement.setString(10, user.getAvatar());
            preparedStatement.setString(11, user.getBackground());
            // Thực hiện INSERT
            int rowsInserted = preparedStatement.executeUpdate();
            JDBCUtil.closeConnection(connection);
            return rowsInserted;
        } catch (SQLException ex) {
            System.out.println("error: " + ex.getMessage());
        }
        return 0;
    }

    public int update(User user) {
        try {
            Connection connection = JDBCUtil.getConnection();
            String insertQuery = "UPDATE USER_Account u"
                    + "SET u.id_user = ?, u.pass = ?, u.gender = ?, u.birthday = ?, "
                    + "    u.phone = ?, u.email = ?, u.first_Name = ?, u.last_Name = ?, u.avatar = ?, u.backgroud = ?"
                    + "WHERE u.user_name = ?";
            // Tạo PreparedStatement 
            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(insertQuery);
            // Thiết lập các tham số trong truy vấn
            preparedStatement.setString(1, user.getId());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getGender());
            preparedStatement.setDate(4, user.getBirthday());
            preparedStatement.setString(5, user.getPhone());
            preparedStatement.setString(6, user.getEmail());
            preparedStatement.setString(7, user.getFirstName());
            preparedStatement.setString(8, user.getLastName());
            preparedStatement.setString(9, user.getAvatar());
            preparedStatement.setString(10, user.getBackground());
            preparedStatement.setString(11, user.getUsername());

            // Thực hiện INSERT
            int rowsInserted = preparedStatement.executeUpdate();
            JDBCUtil.closeConnection(connection);
            return rowsInserted;
        } catch (SQLException ex) {
            System.out.println("error: " + ex.getMessage());
        }
        return 0;
    }

    public int updatePassword(String user_name, String password) {
        try {
            Connection connection = JDBCUtil.getConnection();
            String updateQuery = "UPDATE USER_Account u SET u.pass = ? WHERE u.user_name = ?";
//            user_name = "phuc@email.com";
            // Tạo PreparedStatement 
            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(updateQuery);

            // Thiết lập các tham số trong truy vấn
            preparedStatement.setString(1, password);
            preparedStatement.setString(2, user_name);

            // Thực hiện UPDATE
            int rowsUpdated = preparedStatement.executeUpdate();

            JDBCUtil.closeConnection(connection);
            return rowsUpdated;
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
            ex.printStackTrace(); // In ra thông tin lỗi để debug
        }
        return 0;
    }

    public List<User> selectAll() {
        List<User> list = new ArrayList<>();
        try {
            Connection connection = JDBCUtil.getConnection();
            Statement stmt = connection.createStatement();
            // get data from table 'customer'
            ResultSet rs = stmt.executeQuery("select * from USER_Account");

            // map customer data
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
                list.add(user);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return list;
    }

    public User selectByUserName(String user_name) {
        User result = null;
        try {
            Connection connection = JDBCUtil.getConnection();
            Statement stmt = connection.createStatement();
            // get data from table 'customer'
            ResultSet rs = stmt.executeQuery("select * from USER_Account where user_name =" + "'" + user_name + "'");
            // map customer data
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
                break;
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return result;
    }

    public int updateMyProfile(String userName, String avatarImage, String coverImage) {
        try {
            Connection connection = JDBCUtil.getConnection();
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

    public int updateMyProfile(String userName, String gender, Date birthDay, String phone, String email) {
        try {
            Connection connection = JDBCUtil.getConnection();
            String updateQuery = "UPDATE user_account t SET t.gender = ?, t.birthday = ?, t.phone = ?, t.email = ? WHERE t.user_name = ?";
            // Tạo PreparedStatement
            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(updateQuery);
            // Thiết lập các tham số trong truy vấn
            preparedStatement.setString(1, gender);
            preparedStatement.setDate(2, birthDay);
            preparedStatement.setString(3, phone);
            preparedStatement.setString(4, email);
            preparedStatement.setString(5, userName);

            // Thực hiện update
            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated;
        } catch (SQLException ex) {
            System.out.println("error: " + ex.getMessage());
        }
        return 0;
    }

    public List<User> selectAllByName(String user_name, String name) {
        List<User> list = new ArrayList<>();
        try {
            Connection connection = JDBCUtil.getConnection();
            Statement stmt = connection.createStatement();
            // get data from table 'customer'
            ResultSet rs = stmt.executeQuery("select * from USER_Account where (first_Name LIKE " + "'%" + name + "%'"
                    + " or last_Name LIKE " + "'%" + name + "%'" + ") AND user_name <> " + "'" + user_name + "'");

            // map customer data
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
                list.add(user);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return list;
    }

    public List<User> getFriendList(String user_name) {
        List<User> list = new ArrayList<>();
        try {
            Connection connection = JDBCUtil.getConnection();
            Statement stmt = connection.createStatement();
            // get data from table 'customer'
            ResultSet rs = stmt.executeQuery("SELECT ua.* "
                    + "FROM user_account ua "
                    + "JOIN friendship f ON (ua.user_name = f.user_name_2 OR ua.user_name = f.user_name_1) "
                    + "WHERE (f.user_name_1 = " + "'" + user_name + "'" + " OR f.user_name_2 = " + "'" + user_name + "'" + ") AND ua.user_name <>" + "'" + user_name + "'");
            // map customer data
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getString(1));
                user.setUsername(rs.getString(2));
                user.setPassword(null);
                user.setGender(rs.getString(4));
                user.setBirthday(rs.getDate(5));
                user.setPhone(rs.getString(6));
                user.setEmail(rs.getString(7));
                user.setFirstName(rs.getString(8));
                user.setLastName(rs.getString(9));
                user.setAvatar(rs.getString(10));
                user.setBackground(rs.getString(11));
                list.add(user);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return list;
    }

    public int addFriend(String user_name, String people_name) {
        try {
            Connection connection = JDBCUtil.getConnection();
            String insertQuery = "INSERT INTO FRIENDSHIP (user_name_1, user_name_2)"
                    + "VALUES (?, ?)";
            // Tạo PreparedStatement
            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(insertQuery);
            // Thiết lập các tham số trong truy vấn
            preparedStatement.setString(1, user_name);
            preparedStatement.setString(2, people_name);
            // Thực hiện INSERT
            int rowsInserted = preparedStatement.executeUpdate();
            JDBCUtil.closeConnection(connection);
            return rowsInserted;
        } catch (SQLException ex) {
            System.out.println("error: " + ex.getMessage());
        }
        return 0;
    }

    public int deleteFriend(String user_name, String people_name) {
        try {
            Connection connection = JDBCUtil.getConnection();
            String insertQuery = "DELETE FROM FRIENDSHIP WHERE (user_name_1 = ? AND user_name_2 = ?) OR (user_name_1 = ? AND user_name_2 = ?)";
            // Tạo PreparedStatement
            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(insertQuery);
            // Thiết lập các tham số trong truy vấn
            preparedStatement.setString(1, user_name);
            preparedStatement.setString(2, people_name);
            preparedStatement.setString(3, people_name);
            preparedStatement.setString(4, user_name);
            // Thực hiện INSERT
            int rowsInserted = preparedStatement.executeUpdate();
            JDBCUtil.closeConnection(connection);
            return rowsInserted;
        } catch (SQLException ex) {
            System.out.println("error: " + ex.getMessage());
        }
        return 0;
    }
}
