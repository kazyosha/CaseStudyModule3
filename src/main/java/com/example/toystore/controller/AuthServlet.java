package com.example.toystore.controller;

import com.example.toystore.entities.User;
import com.example.toystore.enums.Role;
import com.example.toystore.model.UserModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AuthServlet", urlPatterns = {"/auth/*"})
public class AuthServlet extends HttpServlet {

    private UserModel userModel;

    @Override
    public void init() throws ServletException {
        userModel = new UserModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getPathInfo();
        if (uri == null) {
            uri = "";
        }
        switch (uri) {
            case "/login":
                req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
                break;
            case "/register":
                req.getRequestDispatcher("/views/auth/register.jsp").forward(req, resp);
                break;
            case "/logout":
                logout(req,resp);
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getPathInfo();
        if (uri == null) {
            uri = "";
        }
        switch (uri) {
            case "/login":
                authentic(req, resp);
                break;
            case "/register":
                registerUser(req, resp);
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    public void registerUser(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            String fullName = req.getParameter("fullname");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            if (username == null || password == null || fullName == null || email == null || phone == null) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                return;
            }
            Role role = Role.CUSTOMER;
            User newUser = new User(username, password, fullName, email, phone, "", role);
            userModel.registerUser(newUser);
            resp.sendRedirect("/auth/login?success=register");
            resp.setStatus(HttpServletResponse.SC_OK);
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }

    }

    public void authentic(HttpServletRequest req, HttpServletResponse resp) throws ServletException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        try {
            User user = userModel.loginUser(username, password);
            if (user != null) {
                req.getSession().setAttribute("user", user);

                if (user.getRole() == Role.ADMIN) {
                    resp.sendRedirect("/product/list?success=login");
                    return;
                } else {
                    resp.sendRedirect("/home?success=login");
                    return;
                }
            } else {
                req.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu!");
                req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
            }
        } catch (SQLException | IOException e) {
            throw new ServletException(e);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
    public void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().invalidate();
        resp.sendRedirect(req.getContextPath() + "/home?success=logout");
    }

}
