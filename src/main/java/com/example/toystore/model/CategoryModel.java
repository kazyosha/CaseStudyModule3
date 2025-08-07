package com.example.toystore.model;

import com.example.toystore.entities.Category;
import com.example.toystore.entities.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CategoryModel extends BaseModel {

    public List<Category> getAllCategories() throws SQLException {
        String sql = "SELECT * FROM categories";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        List<Category> categories = new ArrayList<>();
        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String description = rs.getString("description");
            categories.add(new Category(id, name, description));
        }
        return categories;
    }

    public List<Integer> getCategoryIdsByProductId(int productId) throws SQLException {
        List<Integer> categoryIds = new ArrayList<>();
        String sql = "SELECT category_id FROM categories_product WHERE product_id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, productId);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            categoryIds.add(rs.getInt("category_id"));
        }
        return categoryIds;
    }

    public Category addNewCategory(Category category) throws SQLException {
        String sql = "INSERT INTO categories (name, description) VALUES (?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, category.getName());
        ps.setString(2, category.getDescription());
        ps.executeUpdate();

        return category;
    }
    public Map<String, List<Product>> getProductsGroupedByCategory() throws SQLException {
        String sql = "SELECT p.id, p.name, p.price, p.quantity, p.image, c.name AS category_name, c.description " +
                "FROM product p " +
                "JOIN categories_product cp ON p.id = cp.product_id " +
                "JOIN categories c ON cp.category_id = c.id";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        Map<String, List<Product>> grouped = new HashMap<>();

        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            double price = rs.getDouble("price");
            int quantity = rs.getInt("quantity");
            String image = rs.getString("image");

            String categoryName = rs.getString("category_name");
            String categoryDesc = rs.getString("description");

            Category category = new Category(categoryName, categoryDesc);
            Product product = new Product(id, name, price, quantity, category);
            product.setImage(image);

            grouped.putIfAbsent(categoryName, new ArrayList<>());
            grouped.get(categoryName).add(product);
        }

        return grouped;
    }

}
