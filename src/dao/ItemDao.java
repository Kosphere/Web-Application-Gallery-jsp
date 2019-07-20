package dao;

import util.JdbcUtil;
import vo.Item;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ItemDao {

    public Item getItem(int itemID) {
        String sql = "select * from project_item where id=";
        ArrayList<Item> items = getItems(sql + itemID);
        if(items.size() > 0)
            return items.get(0);
        else
            return null;
    }


    public ArrayList<Item> getHottest(){
        String sql = "SELECT * FROM project_item Order By `like` desc limit 3";
        return getItems(sql);
    }

    public ArrayList<Item> getItems(String sql) {
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        ArrayList<Item> items = new ArrayList<>();
        try {
            conn = JdbcUtil.getConnection();
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()){
                int id = rs.getInt("id");
                String name =  rs.getString("name");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String video = rs.getString("video");
                int hot = rs.getInt("hot");
                String date = rs.getString("date");
                String address = rs.getString("address");
                items.add(new Item(id,name,image,description,address,date,video,hot));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            try {
                JdbcUtil.close(rs, st, conn);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return items;
    }

}
