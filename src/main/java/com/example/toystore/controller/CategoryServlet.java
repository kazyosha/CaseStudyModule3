package com.example.toystore.controller;

import com.example.toystore.entities.Category;
import com.example.toystore.model.CategoryModel;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CategoryServlet", urlPatterns = {"/category/*"})
public class CategoryServlet extends HttpServlet {

    private CategoryModel categoryModel;

    @Override
    public void init() throws ServletException {
        categoryModel = new CategoryModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getPathInfo();
        if (uri == null) {
            uri = "";
        }
        switch (uri) {
            case "/add":
                req.getRequestDispatcher("/views/category/add.jsp").forward(req, resp);
                break;
            case "/list":
                listCategory(req, resp);
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
            case "/add":
                addCategory(req, resp);
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    public void addCategory(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String name = req.getParameter("name");
            String description = req.getParameter("description");
            Category category = new Category(name, description);
            categoryModel.addNewCategory(category);
            resp.sendRedirect("/category/list");

        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    public void listCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
        List<Category> listCategory = categoryModel.getAllCategories();
        req.setAttribute("listCategory", listCategory);
        req.getRequestDispatcher("/views/category/list.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
