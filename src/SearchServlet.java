import com.alibaba.fastjson.JSON;
import service.ItemService;
import vo.Item;
import vo.Paging;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 0;
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String address = request.getParameter("location");
        String str_page=    request.getParameter("page");
        String sql = "select * from project_item where 1=1 ";
        if (!name.equals("")) {
            sql += " and name like '%" + name + "%'";
        } else if (!description.equals("")) {
            sql += " and description like '%" + description + "%'";
        } else if (!address.equals("")) {
            sql += " and address like '%" + address + "%'";
        }
        sql += " order by hot desc";
        HttpSession session = request.getSession();
        session.setAttribute("sql", sql);
        request.getRequestDispatcher("SearchResult.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
