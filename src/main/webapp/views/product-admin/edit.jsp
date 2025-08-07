<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="product" value="${requestScope.product}" />
<c:set var="listCa" value="${requestScope.listCategories}" />
<c:set var="selectedCategoryIds" value="${requestScope.categoryIds}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa sản phẩm</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .checkbox-container {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
        }

        .checkbox-item {
            flex: 0 0 48%;
        }

        .form-section {
            max-width: 600px;
            margin: 30px auto;
            padding: 20px;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form-section">
        <h3 class="mb-4 text-center">Chỉnh sửa sản phẩm</h3>

        <form action="/product/edit?id=${product.id}" method="post">
            <input type="hidden" name="id" value="${product.id}" />

            <div class="mb-3">
                <label class="form-label">Tên sản phẩm</label>
                <input type="text" name="name" class="form-control" value="${product.name}" required />
            </div>

            <div class="mb-3">
                <label class="form-label">Giá</label>
                <input type="number" name="price" class="form-control" value="${product.price}" required />
            </div>

            <div class="mb-3">
                <label class="form-label">Số lượng</label>
                <input type="number" name="quantity" class="form-control" value="${product.quantity}" required />
            </div>

            <div class="mb-3">
                <label class="form-label">Danh mục</label>
                <div class="checkbox-container">
                    <c:forEach var="category" items="${listCa}">
                        <div class="checkbox-item form-check">
                            <input
                                    type="checkbox"
                                    class="form-check-input"
                                    name="categoryIds"
                                    value="${category.id}"
                                    id="category-${category.id}"
                                    <c:if test="${selectedCategoryIds != null and fn:contains(selectedCategoryIds, category.id.toString())}">
                                        checked
                                    </c:if>
                            />
                            <label class="form-check-label" for="category-${category.id}">
                                    ${category.name}
                            </label>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary">Cập nhật</button>
                <a href="/product/list" class="btn btn-secondary">Hủy</a>
            </div>
        </form>
    </div>
</div>

<!-- Optional Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
