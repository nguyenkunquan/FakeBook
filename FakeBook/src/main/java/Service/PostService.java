package Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;


public class PostService {

    //connect to db => done
    //query to db get data
    private static final String DB_URL = "jdbc:mysql://localhost:3306/blog";
    private static final String USER_NAME = "root";
    private static final String PASSWORD = "123456";
    public Connection connection = null;

    public PostService() {
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
        public int insertPost(int id, String content, String img , int likeNum, int commentNum, int idUser) {
        try {
            String insertQuery = "INSERT INTO POST (id_post, content, img, like_num, comment_num, user_name) VALUES (?, ?, ?, ?, ?, ?)";
            // Tạo PreparedStatement
            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(insertQuery);
            // Thiết lập các tham số trong truy vấn
            preparedStatement.setInt(1, id);
            preparedStatement.setString(2, content);
            preparedStatement.setString(3,img);
            preparedStatement.setInt(4, likeNum);
            preparedStatement.setInt(5, commentNum);
            preparedStatement.setInt(6, idUser);

            // Thực hiện INSERT
            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted;
        } catch (SQLException ex) {
            System.out.println("error: " + ex.getMessage());
        }
        return 0;
    }
}
