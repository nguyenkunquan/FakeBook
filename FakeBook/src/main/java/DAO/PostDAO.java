/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import utilities.JDBCUtil;

public class PostDAO implements DAOInterface<Post> {

    public static PostDAO getInstance() {
        return new PostDAO();
    }

    @Override
    public int insert(Post post) {
        try {
            Connection connection = JDBCUtil.getConnection();
            String insertQuery = "INSERT INTO POST (content, img, like_num, comment, id_user)"
                    + "VALUES (?, ?, ?, ?, ?)";
            // Tạo PreparedStatement
            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(insertQuery);
            // Thiết lập các tham số trong truy vấn
            preparedStatement.setString(1, post.getContent());
            preparedStatement.setString(2, post.getImg());
            preparedStatement.setInt(3, post.getLikeNum());
            preparedStatement.setInt(4, post.getCommentNum());
            preparedStatement.setInt(5, post.getIdUser());

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
    public int update(Post post) {
        try {
            Connection connection = JDBCUtil.getConnection();
            String insertQuery = "INSERT INTO POST (content, img, like_num, comment, id_user)"
                    + "VALUES (?, ?, ?, ?, ?)";
            // Tạo PreparedStatement
            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(insertQuery);
            // Thiết lập các tham số trong truy vấn
            preparedStatement.setString(1, post.getContent());
            preparedStatement.setString(2, post.getImg());
            preparedStatement.setInt(3, post.getLikeNum());
            preparedStatement.setInt(4, post.getCommentNum());
            preparedStatement.setInt(5, post.getIdUser());
            preparedStatement.setInt(6, post.getId());

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
    public int delete(Post t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Post> selectAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Post selectById(Post t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
