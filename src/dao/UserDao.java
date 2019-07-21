package dao;

import util.JdbcUtil;
import vo.User;

import java.sql.*;

public class UserDao {
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
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setEmail(rs.getString("email"));
                u.setNumber(rs.getInt("number"));
                u.setAddress(rs.getString("address"));
                u.setPermission(rs.getInt("permission"));
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

    public boolean checkRepeat(User user) throws Exception {
        String sql = "select * from project_user where username='" + user.getUsername() + "'";
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            conn = JdbcUtil.getConnection();
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) { // 如果可以next,代表查找到了这个用户的信息
                return false;
            }
        } finally {
            try {
                JdbcUtil.close(rs, st, conn);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return true;
    }


    public boolean writeUser(User user) throws Exception {
        //String checkSql = "select count(*) from project_user where username='" + user.getUsername() + "'";
        String sql = "insert into project_user (id,username,password,email,number,address,permission) values(null,?,?,?,?,?,?)";
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        boolean flag = false;
        try {
            conn = JdbcUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setInt(4, user.getNumber());
            ps.setString(5, user.getAddress());
            ps.setInt(6,user.getPermission());
            int a = ps.executeUpdate();
            if(a>0) flag=true;
            ps.close();
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
