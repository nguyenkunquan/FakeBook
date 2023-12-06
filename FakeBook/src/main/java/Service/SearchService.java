/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import DAO.PostDAO;
import DAO.UserDAO;
import Model.User;
import java.util.AbstractMap;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author ADMIN
 */
public class SearchService {
    private UserDAO userDAO;
    private PostDAO postDAO;
    
    public SearchService() {
        this.userDAO = UserDAO.getInstance();
        this.postDAO = PostDAO.getInstance();
    }

    
    public Map<User, Boolean> getAllUserByName(String user_name, String peole_name){
        Map<User, Boolean> list = new HashMap<>();
        List<User> list1 = userDAO.selectAllByName(peole_name);
        for (User user : list1) {
            if (isFriend(user.getUsername(), peole_name)) {
                list.put(user, true);
            }else {
                list.put(user, false);
            }
        }
        return list;
    }
    public boolean isFriend(String user_name, String friend_name){
        List<User> list = userDAO.getFriendList(new User(null, user_name, null, null, null, null, null, null, null, null, null));
        for (User user : list) {
            if (user.getUsername().equals(friend_name)) {
                return true;
            }
        }
        return false;
    }
    public int addFriend(String user_name, String people_name){
        return userDAO.addFriend(user_name, people_name);
    }
}
