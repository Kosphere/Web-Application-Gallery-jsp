package util;

import java.sql.*;

public class JdbcUtil {
    private final static String URL = "jdbc:mysql://localhost:3306/project?useSSL=false&serverTimezone=UTC";
    private final static String USER = "root"; // 安装mysql时的用户名
    private final static String PASSWORD = "123456"; //安装mysql时的密码
    public JdbcUtil() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
    public static void close(ResultSet rs, Statement st, Connection conn) {
        try {
            if (rs != null) { rs.close(); }
            if (st != null) { st.close(); }
            if (conn != null) { conn.close(); }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}

