package dao;

import vo.User;

public interface UserDao {
    public User findUser(User user) throws Exception;
    public boolean writeUser(User user) throws Exception;
}
