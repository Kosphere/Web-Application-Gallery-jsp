package dao;

import util.JdbcUtil;
import vo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class UserDaoImpl implements UserDao {
    @Override
    public User findUser(User user) throws Exception {
        String sql = "select * from project_user where username='" + user.getUsername() + "' and password='" + user.getPassword() + "'";
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            conn = JdbcUtil.getConnection();
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) { // 如果可以next,代表查找到了这个用户的信息，就将结果集中的信息封装到User对象中.
                User u = new User();
                u.setUser_id(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setEmail(rs.getString("email"));
                u.setNumber(rs.getInt("number"));
                u.setAddress(rs.getString("address"));
                return u;
            }
        } finally {
            try {
                JdbcUtil.close(rs, st, conn);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public boolean writeUser(User user) throws Exception {
        //String checkSql = "select count(*) from project_user where username='" + user.getUsername() + "'";
        String sql = "insert into project_user (user_id,username,password,email,number,address) values(null,?,?,?,?,?)";
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        boolean flag = false;
        try {
            conn = JdbcUtil.getConnection();
            ps = conn.prepareStatement(sql);
            //rs = st.executeQuery(checkSql);
            //int count = 0;
            //while (rs.next()) {
                //
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setInt(4, user.getNumber());
            ps.setString(5, user.getAddress());
            //执行
            int a = ps.executeUpdate();
            if(a>0) flag=true;
            ps.close();
            //} else {
              //  return false;
            //}
        }finally {
            try {
                JdbcUtil.close(rs, st, conn);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return flag;
    }
}
