package com.example.toystore.entities;

public class CategoriesProduct {
    private int categoryId;
    private int productId;

    public CategoriesProduct() {}
    public CategoriesProduct(int categoryId, int productId) {
        this.categoryId = categoryId;
        this.productId = productId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }
}
