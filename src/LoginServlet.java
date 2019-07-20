import service.UserService;
import vo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
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
                session.setAttribute("permission",0);
                session.setAttribute("user",null);
                response.setStatus(401);
                response.getWriter().println("<script> alert(\"用户名或密码错误\"); </script>");
                response.getWriter().write("<script>history.back();</script>");
            } else {
                response.setStatus(200);
                session.setAttribute("user",user);
                session.setAttribute("permission",user.getPermission());
                response.getWriter().write("<script>window.location.href = goBack($(\".login-body\").attr(\"id\"));</script>");

            }
        } catch (Exception e) {
            session.setAttribute("permission",0);
            session.setAttribute("user",null);
            response.setStatus(401);
            response.getWriter().println("<script> alert(\"用户名或密码错误\"); </script>");
            response.getWriter().write("<script>history.back();</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
