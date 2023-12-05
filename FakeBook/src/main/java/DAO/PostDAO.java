/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Post;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import utilities.JDBCUtil;

public class PostDAO implements DAOInterface<Post> {

    public static PostDAO getInstance() {
        return new PostDAO();
    }

    @Override
    public int insert(Post post) {
        try {
            Connection connection = JDBCUtil.getConnection();
            String insertQuery = "INSERT INTO POST (id_post, content, img, like_num, comment_num, id_user)"
                    + "VALUES (?, ?, ?, ?, ?, ?)";
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
                throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody

    }

    @Override
    public int delete(Post t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Map<String, Object>> selectAllPost() {
        List<Map<String, Object>> list = new ArrayList<>();
        try {
            Connection connection = JDBCUtil.getConnection();
            Statement stmt = connection.createStatement();
            // get data from table 'customer'
            ResultSet rs = stmt.executeQuery("   select  * from POST p INNER JOIN user_account u on p.id_user = u.id_user\n"
                    + "    ORDER BY createdTime DESC;");
            // map customer data
            while (rs.next()) {
                Map<String, Object> rowMap = new HashMap<>();
                rowMap.put("id_post", rs.getObject(1));
                rowMap.put("content", rs.getString(2));
                rowMap.put("img", rs.getString(3));
                rowMap.put("like_num", rs.getInt(4));
                rowMap.put("comment_num", rs.getInt(5));
                rowMap.put("id_user", rs.getString(6));
                rowMap.put("createdTime", rs.getDate(7));
                rowMap.put("user_Name", rs.getString(9));
                rowMap.put("avatar", rs.getString(17));
                list.add(rowMap);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            System.out.println("errror:: " + e.getMessage());
        }
        return list;
    }

    @Override
    public Post selectById(Post t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Post> selectAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
