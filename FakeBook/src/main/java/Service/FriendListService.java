/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import DAO.UserDAO;
import Model.User;
import java.util.List;


public class FriendListService {
    private UserDAO userDAO;

    public FriendListService() {
        this.userDAO = UserDAO.getInstance();
    }
        public List<User> getFriendList(String user_name){
        List<User> list = null;
        list = userDAO.getFriendList(new User(null, user_name, null, null, null, null, null, null, null, null, null));
        return list;
    }

}
