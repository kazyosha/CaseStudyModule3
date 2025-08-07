package com.example.toystore.entities;

import java.util.List;

public class Product {
    private int id;
    private String name;
    private double price;
    private int quantity;
    private Category categories;
    private  String CategoryNames;
    private String image;

    public Product() {}
    public Product(int id, String name, double price, int quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    public Product(int id, String name, double price, int quantity, Category categories) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.categories = categories;
    }

    public Product(int id, String name, double price, int quantity, String image, Category categories) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
        this.categories = categories;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public Category getCategories() {
        return categories;
    }
    public void setCategories(Category categories) {
        this.categories = categories;
    }

    public String getCategoryNames() {
        return CategoryNames;
    }

    public void setCategoryNames(String categoryNames) {
        CategoryNames = categoryNames;
    }
    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }
}
