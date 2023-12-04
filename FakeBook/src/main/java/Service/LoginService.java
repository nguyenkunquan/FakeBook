/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import DAO.UserDAO;
import Model.User;
import java.util.List;

public class LoginService {

    private UserDAO userDAO;

    public LoginService() {
        this.userDAO = UserDAO.getInstance();
    }

    public int insertUser(User user) {
        return userDAO.insert(user);
    }

    public int CheckLogin(String user_name, String pass) {
        User user = null;
        user = userDAO.selectByUserName(user_name);
        if (user != null) {
            if (user.getPassword().equals(pass)) {
                return 1;
            } else {
                return 0;
            }
        }
        return 0;
    }

}
