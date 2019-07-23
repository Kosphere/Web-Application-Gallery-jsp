import service.ItemService;
import vo.Item;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String address = request.getParameter("location");
        String sql;
        if (name.equals("") && description.equals("") && address.equals("")) {
            sql = "";
        } else {
            sql = "select * from project_item where 1=1 ";
            if (!name.equals("")) {
                sql += " and name like '%" + name + "%'";
            }
            if (!description.equals("")) {
                sql += " and description like '%" + description + "%'";
            }
            if (!address.equals("")) {
                sql += " and address like '%" + address + "%'";
            }
            sql += " order by hot desc";
        }
        ItemService itemService = new ItemService();
        ArrayList<Item> items = itemService.getItems(sql);
        StringBuilder resultBuilder = new StringBuilder();
        if (items != null) {
            resultBuilder.append("[");
            for (int i = 0; i < items.size(); i++) {
                resultBuilder.append("{\"name\":\"<a style='color:black'href='Item.jsp?id=").append(items.get(i).getId()).append("'>").append(items.get(i).getName()).append("</a>").append("\",\"description\":\"").append(items.get(i).getDescription()).append("\",\"address\":\"").append(items.get(i).getAddress()).append("\",\"image\":\"<img src='").append(items.get(i).getImage()).append("' class='d-block w-100' alt='...' style='width=auto'>").append("\"},");
            }
            resultBuilder.deleteCharAt(resultBuilder.length()-1);
            resultBuilder.append("]");
        }

        String result = resultBuilder.toString();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");
        response.getWriter().append(result);
//        response.setCharacterEncoding("UTF-8");
//        response.setContentType("application/json; charset=utf-8");
//        PrintWriter out = null;
//        try {
//            out = response.getWriter();
//            out.append(result.toString());
//        } catch (IOException e) {
//            e.printStackTrace();
//        } finally {
//            if (out != null) {
//                out.close();
//            }
//        }
//        request.getRequestDispatcher("Search.jsp").forward(request, response);

    }

}
