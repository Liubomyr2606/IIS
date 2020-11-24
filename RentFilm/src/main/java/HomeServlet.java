import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        if (path.equals("/")){
            request.getRequestDispatcher("/view/index.jsp").forward(request, response);
        }else if(path.equals("/main")){
            request.getRequestDispatcher("/view/index.jsp").forward(request, response);
        }else if(path.equals("/register")){
            request.getRequestDispatcher("/view/register.jsp").forward(request, response);
        }else if(path.equals("/login")){
            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
        }else if(path.equals("/conditions")){
            request.getRequestDispatcher("/view/conditions.jsp").forward(request, response);
        }else if(path.equals("/logError")){
            request.getRequestDispatcher("/view/logError.jsp").forward(request, response);
        }else if(path.equals("/user/main")){
            request.getRequestDispatcher("/view/user/main.jsp").forward(request, response);
        }else if(path.equals("/user/films")){
            request.getRequestDispatcher("/view/user/Films.jsp").forward(request, response);
        }else if(path.equals("/user/MyFilm")){
            request.getRequestDispatcher("/view/user/MyFilm.jsp").forward(request, response);
        }else if (request.getServletPath().equals(("/logout"))) {
            request.getRequestDispatcher("/backend/logout.jsp").forward(request, response);
        }else if(path.equals("/admin/main")){
            request.getRequestDispatcher("/view/admin/main.jsp").forward(request, response);
        }else if(path.equals("/admin/films")){
            request.getRequestDispatcher("/view/admin/Films.jsp").forward(request, response);
        }else if (request.getServletPath().equals(("/admin/addFilm"))) {
            request.getRequestDispatcher("/view/admin/addFilm.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        if (request.getServletPath().equals(("/login"))) {
            request.getRequestDispatcher("/backend/login.jsp").forward(request, response);
        }else if (request.getServletPath().equals(("/register"))) {
            request.getRequestDispatcher("/backend/register.jsp").forward(request, response);
        }else if (request.getServletPath().equals(("/MyFilm"))) {
            request.getRequestDispatcher("/view/MyFilm.jsp").forward(request, response);
        }else if(path.equals("/user/films")){
            request.getRequestDispatcher("/view/user/Films.jsp").forward(request, response);
        }else if(path.equals("/user/RentFilm")){
            request.getRequestDispatcher("/backend/RentFilm.jsp").forward(request, response);
        }
        else if(path.equals("/admin/films")){
            request.getRequestDispatcher("/view/admin/Films.jsp").forward(request, response);
        }
        else if(path.equals("/admin/addFilm")){
            request.getRequestDispatcher("/backend/addFilm.jsp").forward(request, response);
        }
        else if(path.equals("/admin/removeFilm")){
            request.getRequestDispatcher("/backend/removeFilm.jsp").forward(request, response);
        }
    }
}