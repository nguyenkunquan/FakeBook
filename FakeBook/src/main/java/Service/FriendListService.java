/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import DAO.UserDAO;
import Model.User;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FriendListService {

    private UserDAO userDAO;

    public FriendListService() {
        this.userDAO = UserDAO.getInstance();
    }

    public Map<User, Integer> getFriendList(String user_name) {
        Map<User, Integer> list = new HashMap<>();
        List<User> list1 = null;
        list1 = userDAO.getFriendList(user_name);
        for (User user : list1) {
            List<User> list2 = userDAO.getFriendList(user.getUsername());
            list.put(user, list2.size());
        }
        return list;
    }

}
