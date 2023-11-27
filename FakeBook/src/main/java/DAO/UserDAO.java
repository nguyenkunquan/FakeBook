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
import utilities.JDBCUtil;

/**
 *
 * @author ADMIN
 */
public class UserDAO implements DAOInterface<User> {

    public static UserDAO getInstance() {
        return new UserDAO();
    }

    @Override
    public int insert(User user) {
        try {
            Connection connection = JDBCUtil.getConnection();
            String insertQuery = "INSERT INTO USER_Account (user_name, pass, gender, birthday, phone, email, first_Name, last_Name)"
                               + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            // Tạo PreparedStatement
            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(insertQuery);
            // Thiết lập các tham số trong truy vấn
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getGender());
            preparedStatement.setDate(4, user.getBirthday());
            preparedStatement.setString(5, user.getPhone());
            preparedStatement.setString(6, user.getEmail());
            preparedStatement.setString(7, user.getFirstName());
            preparedStatement.setString(8, user.getLastName());

            // Thực hiện INSERT
            int rowsInserted = preparedStatement.executeUpdate();
            JDBCUtil.closeConnection(connection);
            return rowsInserted;
        } catch (SQLException ex) {
            System.out.println("error: " + ex.getMessage());
        }
        return 0;
    }

    @Override
    public int update(User user) {
        try {
            Connection connection = JDBCUtil.getConnection();
            String insertQuery = "UPDATE USER_Account u"
                               + "SET u.user_name = ?, u.pass = ?, u.gender = ?, u.birthday = ?, "
                               + "    u.phone = ?, u.email = ?, u.first_Name = ?, u.last_Name = ?"
                               + "WHERE u.id_user = ?";
            // Tạo PreparedStatement
            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(insertQuery);
            // Thiết lập các tham số trong truy vấn
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getGender());
            preparedStatement.setDate(4, user.getBirthday());
            preparedStatement.setString(5, user.getPhone());
            preparedStatement.setString(6, user.getEmail());
            preparedStatement.setString(7, user.getFirstName());
            preparedStatement.setString(8, user.getLastName());
            preparedStatement.setInt(9, user.getId());

            // Thực hiện INSERT
            int rowsInserted = preparedStatement.executeUpdate();
            JDBCUtil.closeConnection(connection);
            return rowsInserted;
        } catch (SQLException ex) {
            System.out.println("error: " + ex.getMessage());
        }
        return 0;
    }

    @Override
    public int delete(User user) {
        try {
            Connection connection = JDBCUtil.getConnection();
            String insertQuery = "DELETE FROM USER_Account WHERE id_user = ?";
            // Tạo PreparedStatement
            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(insertQuery);
            // Thiết lập các tham số trong truy vấn
            preparedStatement.setInt(1, user.getId());

            // Thực hiện delete
            int rowsInserted = preparedStatement.executeUpdate();
            JDBCUtil.closeConnection(connection);
            return rowsInserted;
        } catch (SQLException ex) {
            System.out.println("error: " + ex.getMessage());
        }
        return 0;
    }

    @Override
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
                user.setId(rs.getInt(1));
                user.setUsername(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setGender(rs.getString(4));
                user.setBirthday(rs.getDate(5));
                user.setPhone(rs.getString(6));
                user.setEmail(rs.getString(7));
                user.setFirstName(rs.getString(8));
                user.setLastName(rs.getString(9));
                user.setRegisterDate(rs.getTimestamp(10));
                list.add(user);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return list;
    }

    @Override
    public User selectById(User u) {
        User result = null;
        try {
            Connection connection = JDBCUtil.getConnection();
            Statement stmt = connection.createStatement();
            // get data from table 'customer'
            ResultSet rs = stmt.executeQuery("select * from USER_Account where id_user =" + u.getId());
            // map customer data
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt(1));
                user.setUsername(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setGender(rs.getString(4));
                user.setBirthday(rs.getDate(5));
                user.setPhone(rs.getString(6));
                user.setEmail(rs.getString(7));
                user.setFirstName(rs.getString(8));
                user.setLastName(rs.getString(9));
                user.setRegisterDate(rs.getTimestamp(10));
                result = user;
                break;
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return result;
    }

}
