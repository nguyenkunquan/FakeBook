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
           List<User> listUser = userDAO.selectAll();
           if(!listUser.isEmpty()){
            for (User user1 : listUser) {
                if(user1.getUsername().equals(user.getUsername())
                        ||user1.getId().equals(user.getId()))
                    return 0;
            }
           }
            return userDAO.insert(user);
        }

}
