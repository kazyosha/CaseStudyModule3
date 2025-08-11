package com.example.toystore.controller;

import com.example.toystore.entities.User;
import com.example.toystore.model.UserModel;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = {"/user/*"})
public class UserServlet extends HttpServlet {
    UserModel userModel;

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
            case "/list":
                showListUser(req, resp);
                break;
            case "/search":
                searchUser(req, resp);
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {

    }

    public void showListUser(HttpServletRequest req, HttpServletResponse resp) {
        try {
            List<User> listUser = userModel.getUsers();
            req.setAttribute("listUser", listUser);
            req.getRequestDispatcher("/views/user-admin/list.jsp").forward(req, resp);
        } catch (SQLException | ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void searchUser(HttpServletRequest req, HttpServletResponse resp) {
        String keyword = req.getParameter("keyword");
        try {
            List<User> listUser;
            if (keyword == null || keyword.trim().isEmpty()) {
                listUser = userModel.getUsers();
            } else {
                listUser = userModel.searchUsersByName(keyword);
            }
            req.setAttribute("listUser", listUser);
            RequestDispatcher rd = req.getRequestDispatcher("/views/user-admin/list.jsp");
            rd.forward(req, resp);
        } catch (SQLException | ServletException | IOException e) {
            throw new RuntimeException("Lỗi khi tìm kiếm sản phẩm", e);
        }
    }


}
