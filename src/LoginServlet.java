import service.UserService;
import vo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        UserService service = new UserService();
        User existUser = null;
        try {
            existUser=service.login(user);
            if (existUser == null) {
                response.getWriter().println("<script> alert(\"用户名或密码错误\"); </script>");
                response.getWriter().write("<script>history.back();</script>");
            } else {
                request.getSession().setAttribute("user", existUser);
                response.sendRedirect(request.getContextPath() + "/success.jsp");
            }
        } catch (Exception e) {
            response.getWriter().println("<script> alert(\"用户名或密码错误\"); </script>");
            response.getWriter().write("<script>history.back();</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
