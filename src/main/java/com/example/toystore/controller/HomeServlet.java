package com.example.toystore.controller;

import com.example.toystore.entities.Product;
import com.example.toystore.model.CategoryModel;
import com.example.toystore.model.ListProductModel;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "HomeServlet", urlPatterns = {"/home/*"})
public class HomeServlet extends HttpServlet {

    private CategoryModel categoryModel;
    private ListProductModel listModel;

    @Override
    public void init() throws ServletException {
        categoryModel = new CategoryModel();
        listModel = new ListProductModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getPathInfo();
        if (uri == null) {
            uri = "";
        }
        switch (uri) {
            case "/":
            case "":
                homePage(req, resp);
                break;
            case "/featured":
                featuredPage(req, resp);
                break;
            case "/blogs":
                blogsPage(req, resp);
                break;
            case "/contact":
                contactPage(req, resp);
                break;
            case "/policy":
                policyPage(req, resp);
                break;
            case "/productDetail":
                showProductDetailPage(req, resp);
                break;
            case "/search":
                searchProduct(req, resp);
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);

        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp){

    }

    private void featuredPage(HttpServletRequest req, HttpServletResponse resp){
        try {
            Map<String, List<Product>> grouped = categoryModel.getProductsGroupedByCategory();
            req.setAttribute("groupedProducts", grouped);
            req.getRequestDispatcher("/views/home/featured.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void homePage(HttpServletRequest req, HttpServletResponse resp){
        try {
            List<Product> modelToys = categoryModel.getFeaturedModelToys();
            req.setAttribute("modelToys", modelToys);
            req.getRequestDispatcher("/views/home/homePage.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void blogsPage(HttpServletRequest req, HttpServletResponse resp){
        try {
            req.getRequestDispatcher("/views/home/blog.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void contactPage(HttpServletRequest req, HttpServletResponse resp){
        try {
            RequestDispatcher rd = req.getRequestDispatcher("/views/home/contact.jsp");
            rd.forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void policyPage(HttpServletRequest req, HttpServletResponse resp){
        try {
            RequestDispatcher rd = req.getRequestDispatcher("/views/home/policy.jsp");
            rd.forward(req, resp);
        } catch (ServletException | IOException e) {}

    }

    private void searchProduct(HttpServletRequest req, HttpServletResponse resp) {
            String keyword = req.getParameter("keyword");
            try {
                List<Product> searchResult;
                if (keyword == null || keyword.trim().isEmpty()) {
                    searchResult = listModel.showListProduct();
                } else {
                    searchResult = listModel.searchByName(keyword);
                }
                req.setAttribute("searchResult", searchResult);
                RequestDispatcher rd = req.getRequestDispatcher("/views/home/featured.jsp");
                rd.forward(req, resp);
            } catch (SQLException | ServletException | IOException e) {
                throw new RuntimeException("Lỗi khi tìm kiếm sản phẩm", e);
            }
    }

    private void showProductDetailPage(HttpServletRequest req, HttpServletResponse resp) {
    }
}
