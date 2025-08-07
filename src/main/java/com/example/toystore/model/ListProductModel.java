package com.example.toystore.model;

import com.example.toystore.entities.Category;
import com.example.toystore.entities.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ListProductModel extends BaseModel {
    public List<Product> showListProduct() throws SQLException {
        String sql = "SELECT \n" +
                "    p.id AS product_id,\n" +
                "    p.name AS product_name,\n" +
                "    p.price,\n" +
                "    p.quantity,\n" +
                "    p.image,\n" +
                "    GROUP_CONCAT(c.name SEPARATOR ', ') AS category_names,\n" +
                "    GROUP_CONCAT(c.description SEPARATOR ', ') AS category_descriptions\n" +
                "FROM \n" +
                "    product p\n" +
                "LEFT JOIN categories_product cp ON p.id = cp.product_id\n" +
                "LEFT JOIN categories c ON cp.category_id = c.id\n" +
                "GROUP BY \n" +
                "    p.id, p.name, p.price, p.quantity, p.image";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        List<Product> products = new ArrayList<>();
        while (rs.next()) {
            int productId = rs.getInt("product_id");
            String productName = rs.getString("product_name");
            double price = rs.getDouble("price");
            int quantity = rs.getInt("quantity");
            String image = rs.getString("image");
            String categoryName = rs.getString("category_names");
            String description = rs.getString("category_descriptions");

            Category category = new Category(categoryName, description);
            Product product = new Product(productId, productName, price, quantity, category);
            product.setImage(image);
            products.add(product);
        }
        return products;
    }

    public Product findById(int id) throws SQLException {
        String sql = "SELECT \n" +
                "    p.id AS product_id,\n" +
                "    p.name AS product_name,\n" +
                "    p.price,\n" +
                "    p.quantity,\n" +
                "    c.id AS category_id,\n" +
                "    c.name AS category_name,\n" +
                "    c.description AS category_description\n" +
                "FROM product p\n" +
                "JOIN categories_product cp ON p.id = cp.product_id\n" +
                "JOIN categories c ON c.id = cp.category_id\n" +
                "WHERE p.id = ?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            int productId = rs.getInt("product_id");
            String productName = rs.getString("product_name");
            double price = rs.getDouble("price");
            int quantity = rs.getInt("quantity");

            int categoryId = rs.getInt("category_id");
            String categoryName = rs.getString("category_name");
            String categoryDescription = rs.getString("category_description");

            Category category = new Category();
            category.setId(categoryId);
            category.setName(categoryName);
            category.setDescription(categoryDescription);

            Product product = new Product(productId, productName, price, quantity, category);

            return product;
        }
        return null;
    }

    public void delete(int id) throws SQLException {
        String sql1 = "DELETE FROM categories_product WHERE product_id = ?";
        PreparedStatement ps1 = conn.prepareStatement(sql1);
        ps1.setInt(1, id);
        ps1.execute();

        String sql2 = "DELETE FROM product WHERE id = ?";
        PreparedStatement ps2 = conn.prepareStatement(sql2);
        ps2.setInt(1, id);
        ps2.execute();
    }

    public void addProduct(Product product, String[] categoryIds) throws SQLException {
        String sql1 = "INSERT INTO product(name, price, quantity, image) VALUES (?, ?, ?, ?)";
        PreparedStatement ps1 = conn.prepareStatement(sql1, PreparedStatement.RETURN_GENERATED_KEYS);
        ps1.setString(1, product.getName());
        ps1.setDouble(2, product.getPrice());
        ps1.setInt(3, product.getQuantity());
        ps1.setString(4, product.getImage());
        ps1.executeUpdate();
        ResultSet rs = ps1.getGeneratedKeys();

        if (rs.next()) {
            int productId = rs.getInt(1);
            String sql2 = "INSERT INTO categories_product(category_id, product_id) VALUES (?, ?)";
            PreparedStatement ps2 = conn.prepareStatement(sql2);
            for (String categoryId : categoryIds) {
                ps2.setInt(1, Integer.parseInt(categoryId));
                ps2.setInt(2, productId);
                ps2.addBatch();
            }
            ps2.executeBatch();
        }
    }

    public void updateProduct(Product product, String[] categoryIds) throws SQLException {

        String sqlUpdateProduct = "UPDATE product SET name = ?, price = ?, quantity = ? WHERE id = ?";
        PreparedStatement psUpdate = conn.prepareStatement(sqlUpdateProduct);
        psUpdate.setString(1, product.getName());
        psUpdate.setDouble(2, product.getPrice());
        psUpdate.setInt(3, product.getQuantity());
        psUpdate.setInt(4, product.getId());
        psUpdate.executeUpdate();

        String sqlDeleteCategories = "DELETE FROM categories_product WHERE product_id = ?";
        PreparedStatement psDelete = conn.prepareStatement(sqlDeleteCategories);
        psDelete.setInt(1, product.getId());
        psDelete.executeUpdate();

        if (categoryIds != null) {
            String sqlInsertCategory = "INSERT INTO categories_product (category_id, product_id) VALUES (?, ?)";
            PreparedStatement psInsert = conn.prepareStatement(sqlInsertCategory);
            for (String categoryId : categoryIds) {
                psInsert.setInt(1, Integer.parseInt(categoryId));
                psInsert.setInt(2, product.getId());
                psInsert.addBatch();
            }
            psInsert.executeBatch();
        }
    }
    public List<Product> searchByName(String keyword) throws SQLException {
        List<Product> result = new ArrayList<>();
        String sql = "SELECT " +
                "p.id AS product_id, " +
                "p.name AS product_name, " +
                "p.price, " +
                "p.quantity, " +
                "GROUP_CONCAT(DISTINCT c.name ORDER BY c.name SEPARATOR ', ') AS category_names, " +
                "GROUP_CONCAT(DISTINCT c.description ORDER BY c.name SEPARATOR ', ') AS category_descriptions " +
                "FROM product p " +
                "LEFT JOIN categories_product cp ON p.id = cp.product_id " +
                "LEFT JOIN categories c ON cp.category_id = c.id " +
                "WHERE p.name LIKE ? " +
                "GROUP BY p.id, p.name, p.price, p.quantity " +
                "ORDER BY p.name ASC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "%" + keyword + "%");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("product_id");
            String name = rs.getString("product_name");
            double price = rs.getDouble("price");
            int quantity = rs.getInt("quantity");
            String categoryName = rs.getString("category_names");
            String categoryDescription = rs.getString("category_descriptions");

            Category category = new Category(categoryName, categoryDescription);
            Product product = new Product(id, name, price, quantity, category);
            result.add(product);
        }
        return result;
    }

}
