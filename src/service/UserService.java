package service;

import dao.UserDao;
import vo.User;

public class UserService {
    public User login(User user) throws Exception {
        User existUser = null;
        try {
            existUser = new UserDao().findUser(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return existUser;
    }

    public boolean register(User user) throws Exception {
        UserDao userDao = new UserDao();
        return userDao.writeUser(user);
    }

}
