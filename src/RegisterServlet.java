import service.UserService;
import vo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
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
        user.setPermission(1);
        UserService service = new UserService();
        try {
            boolean flag = service.register(user);
            boolean existedUser = service.check(user);
            if (!flag) {
                session.setAttribute("permission",0);
                session.setAttribute("user",null);
                response.setStatus(401);
                response.getWriter().println("<script> alert(\"注册失败\"); </script>");
                response.getWriter().write("<script>history.back();</script>");
            } else if (!existedUser) {
                session.setAttribute("permission",0);
                session.setAttribute("user",null);
                response.setStatus(401);
                response.getWriter().println("<script> alert(\"用户名重复\"); </script>");
                response.getWriter().write("<script>history.back();</script>");
            } else {
                session.setAttribute("user",user);
                session.setAttribute("permission",user.getPermission());
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        } catch (Exception e) {
            session.setAttribute("permission",0);
            session.setAttribute("user",null);
            response.setStatus(401);
            response.getWriter().println("<script> alert(\"注册失败\"); </script>");
            response.getWriter().write("<script>history.back();</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
