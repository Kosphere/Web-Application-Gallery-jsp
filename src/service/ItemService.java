package service;

import dao.ItemDao;
import vo.Item;

import java.util.ArrayList;

public class ItemService {
    public ArrayList<Item> getLatest(){
        ItemDao itemDao = new ItemDao();
        String sql = "SELECT * FROM project_item Order By `update` desc limit 3";
        return itemDao.getItems(sql);
    }

    public ArrayList<Item> getHottest(){
        ItemDao itemDao = new ItemDao();
        String sql = "SELECT * FROM project_item Order By `hot` desc limit 3";
        return itemDao.getItems(sql);
    }

    public Item getItem(int id) {
        ItemDao itemDao = new ItemDao();
        return itemDao.getItem(id);
    }

    public void addHot(int id){
        ItemDao itemDao = new ItemDao();
        itemDao.addHot(id);
    }

    public ArrayList<Item> getItems(String sql) {
        ItemDao itemDao = new ItemDao();
        return itemDao.getItems(sql);
    }

}
