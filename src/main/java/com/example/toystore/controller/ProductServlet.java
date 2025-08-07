package com.example.toystore.controller;

import com.example.toystore.entities.Category;
import com.example.toystore.entities.Product;
import com.example.toystore.model.CategoryModel;
import com.example.toystore.model.ListProductModel;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = {"/product/*"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 15
)
public class ProductServlet extends HttpServlet {

    private ListProductModel listModel;
    private CategoryModel categoryModel;

    @Override
    public void init() throws ServletException {
        listModel = new ListProductModel();
        categoryModel = new CategoryModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getPathInfo();
        if (uri == null) {
            uri = "";
        }
        switch (uri) {
            case "/list":
                showListProduct(req, resp);
                break;
            case "/add":
                showAddProductPage(req, resp);
                break;
            case "/edit":
                showEditProductPage(req, resp);
                break;
            case "/delete":
                deleteProduct(req, resp);
                break;
            case"/search":
                searchProduct(req,resp);
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
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
                addProduct(req, resp);
                break;
            case "/edit":
                editProduct(req, resp);
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void showListProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Product> listProduct = listModel.showListProduct();
            req.setAttribute("listProduct", listProduct);
            req.getRequestDispatcher("/views/product-admin/list.jsp").forward(req, resp);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteProduct(HttpServletRequest req, HttpServletResponse resp) {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            listModel.delete(id);
            resp.sendRedirect("/product/list");
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void addProduct(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String name = req.getParameter("name");
            double price = Double.parseDouble(req.getParameter("price"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            String[] categoryIds = req.getParameterValues("categoryIds");

            Part filePart = req.getPart("image");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            String uploadDir = getServletContext().getRealPath("/uploads");
            File uploadFolder = new File(uploadDir);
            if (!uploadFolder.exists()) uploadFolder.mkdir();


            if (fileName != null && !fileName.isEmpty()) {
                String filePath = uploadDir + File.separator + fileName;
                filePart.write(filePath);
            }

            String imagePath = "uploads/" + fileName;

            Product product = new Product();
            product.setName(name);
            product.setPrice(price);
            product.setQuantity(quantity);
            product.setImage(imagePath);

            listModel.addProduct(product, categoryIds);
            resp.sendRedirect("/product/list");
            System.out.println("Upload folder: " + uploadDir);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void showAddProductPage(HttpServletRequest req, HttpServletResponse resp) {
        try {
            List<Category> categories = categoryModel.getAllCategories();
            req.setAttribute("categories", categories);
            req.getRequestDispatcher("/views/product-admin/add.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void showEditProductPage(HttpServletRequest req, HttpServletResponse resp) {
        try {
            int id = Integer.parseInt(req.getParameter("id"));

            Product product = listModel.findById(id);
            List<Category> listCategories = categoryModel.getAllCategories();
            List<Integer> categoryIds = categoryModel.getCategoryIdsByProductId(id);
            req.setAttribute("product", product);
            req.setAttribute("listCategories", listCategories);
            req.setAttribute("categoryIds", categoryIds);
            RequestDispatcher rd = req.getRequestDispatcher("/views/product-admin/edit.jsp");
            rd.forward(req, resp);

        } catch (SQLException | ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void editProduct(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        try {
            Product product = listModel.findById(id);
            if (product == null) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            String name = req.getParameter("name");
            double price = Double.parseDouble(req.getParameter("price"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            String[] categoryIds = req.getParameterValues("categoryIds");

            product.setName(name);
            product.setPrice(price);
            product.setQuantity(quantity);

            listModel.updateProduct(product, categoryIds);
            resp.sendRedirect("/product/list");

        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    public void searchProduct(HttpServletRequest req, HttpServletResponse resp) {
        String keyword = req.getParameter("keyword");
        try {
            List<Product> listProduct;
            if (keyword == null || keyword.trim().isEmpty()) {
                listProduct = listModel.showListProduct();
            } else {
                listProduct = listModel.searchByName(keyword);
            }
        req.setAttribute("listProduct", listProduct);
        RequestDispatcher rd = req.getRequestDispatcher("/views/product-admin/list.jsp");
        rd.forward(req,resp);
        } catch (SQLException | ServletException | IOException e) {
            throw new RuntimeException("Lỗi khi tìm kiếm sản phẩm", e);
        }
    }

}
