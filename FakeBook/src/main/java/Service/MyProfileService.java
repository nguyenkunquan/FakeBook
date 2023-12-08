/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import DAO.PostDAO;
import DAO.UserDAO;
import Model.User;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

/**
 *
 * @author acer
 */
public class MyProfileService {

    private UserDAO userDao;
    private PostDAO postDao;

    public MyProfileService() {
        this.userDao = UserDAO.getInstance();
        this.postDao = PostDAO.getInstance();
    }

    public User getMyProfileByUserName(String userName) {
        return userDao.selectByUserName(userName);
    }
    public int updateMyProfile(String userName, String avatarImage, String coverImage) {
        return userDao.updateMyProfile(userName, avatarImage, coverImage);
    }
    public int updateMyProfile(String userName, String gender, Date birthDay, String phone, String email) {
        return userDao.updateMyProfile(userName, gender, birthDay, phone, email);
    }
    public List<Map<String, Object>> selectAllPostByUserName(String userName) {
        return postDao.selectAllPostByUserName(userName);
    }
}
