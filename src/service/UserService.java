package service;

import dao.UserDaoImpl;
import vo.User;

public class UserService {
    public User login(User user) throws Exception {
        User existUser = null;
        try {
            existUser = new UserDaoImpl().findUser(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return existUser;
    }

    public boolean register(User user) throws Exception {
        UserDaoImpl userDao = new UserDaoImpl();
        return userDao.writeUser(user);
    }

}
