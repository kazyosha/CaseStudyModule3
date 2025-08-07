<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm sản phẩm</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .form-title {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-check {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="form-container">
        <h2 class="form-title">Thêm sản phẩm mới</h2>
        <form action="/product/add" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="name" class="form-label">Tên sản phẩm:</label>
                <input type="text" class="form-control" name="name" id="name" required/>
            </div>

            <div class="mb-3">
                <label for="price" class="form-label">Giá:</label>
                <input type="number" class="form-control" name="price" id="price" min="1" required/>
            </div>

            <div class="mb-3">
                <label for="quantity" class="form-label">Số lượng:</label>
                <input type="number" class="form-control" name="quantity" id="quantity" min="1" required/>
            </div>
            <div class="mb-3">
                <label for="image" class="form-label">Ảnh sản phẩm:</label>
                <input type="file" class="form-control" name="image" id="image" accept="image/*" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">Chọn danh mục:</label>
                <div class="row">
                    <c:forEach var="cat" items="${categories}" varStatus="loop">
                        <div class="col-md-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox"
                                       name="categoryIds" value="${cat.id}" id="cat${cat.id}">
                                <label class="form-check-label" for="cat${cat.id}">
                                        ${cat.name}
                                </label>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS (tùy chọn nếu bạn dùng JS của Bootstrap) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
