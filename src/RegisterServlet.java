import service.UserService;
import vo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        int number = Integer.parseInt(request.getParameter("number"));
        String address = request.getParameter("address");
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setNumber(number);
        user.setAddress(address);
        UserService service = new UserService();
        try {
            boolean flag = service.register(user);
            if (!flag) {
                response.getWriter().println("<script> alert(\"注册失败\"); </script>");
                response.getWriter().write("<script>history.back();</script>");
            } else {
                request.getSession().setAttribute("user", user);
                response.sendRedirect(request.getContextPath() + "/success.jsp");
            }
        } catch (Exception e) {
            response.getWriter().println("<script> alert(\"注册失败\"); </script>");
            response.getWriter().write("<script>history.back();</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
