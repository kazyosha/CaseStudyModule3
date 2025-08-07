<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Cửa Hàng Đồ Chơi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .category-link {
            color: #333;
            text-decoration: none;
        }
        .category-link:hover {
            text-decoration: underline;
            color: #0d6efd;
        }
        .card-img-top {
            height: 200px;
            object-fit: cover;
        }

    </style>
</head>
<body>
<!-- Top Header -->
<div class="bg-light border-bottom py-2">
    <div class="container d-flex justify-content-between align-items-center">
        <div class="d-flex align-items-center">
            <img src="${pageContext.request.contextPath}/img/logo.jpg" alt="Logo" style="height: 40px;">
            <h5 class="ms-3 text-primary mb-0">Cửa Hàng Đồ Chơi Sáng Tạo</h5>
        </div>
        <form class="d-flex" action="${pageContext.request.contextPath}/search" method="get">
            <input class="form-control me-2" type="search" placeholder="Tìm kiếm..." name="query">
            <button class="btn btn-outline-primary" type="submit">Tìm</button>
        </form>
        <div>
            <a href="${pageContext.request.contextPath}/auth/login" class="btn btn-outline-secondary me-2">Login</a>
            <a href="${pageContext.request.contextPath}/auth/register" class="btn btn-primary">Sign up</a>
        </div>
    </div>
</div>

<!-- Main Content -->
<div class="container-fluid mt-4">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2">
            <h6 class="mb-3">Danh mục</h6>
            <ul class="list-unstyled">
                <li><a class="category-link" href="#">Trang chủ</a></li>
                <li><a class="category-link" href="#">Sản phẩm nổi bật</a></li>
                <li><a class="category-link" href="#">Blogs</a></li>
                <li><a class="category-link" href="#">Contact</a></li>
                <li><a class="category-link" href="#">Chính sách</a></li>
            </ul>
        </div>

        <!-- Products -->
        <div class="col-md-10">
            <h4 class="mb-4">🔸 Sản phẩm nổi bật</h4>
            <div class="row g-4">
                <c:forEach var="entry" items="${groupedProducts}">
                    <h4 class="mt-4 mb-3 text-primary fw-bold">Danh mục: ${entry.key}</h4>
                    <div class="row">
                        <c:forEach var="product" items="${entry.value}">
                            <div class="col-md-3 mb-4">
                                <div class="card h-100 shadow-sm">
                                    <img src="${pageContext.request.contextPath}/${product.image}" class="card-img-top" alt="${product.name}" style="height: 200px; object-fit: cover;">
                                    <div class="card-body">
                                        <h6 class="card-title text-dark">${product.name}</h6>
                                        <p class="card-text text-danger fw-semibold">Giá: ${product.price} VNĐ</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:forEach>

            </div>
        </div>
    </div>
</div>
<footer class="bg-dark text-white mt-5">
    <div class="container py-4">
        <div class="row">
            <div class="col-md-4 mb-3">
                <h5>Cửa Hàng Đồ Chơi Sáng Tạo</h5>
                <p>Chuyên cung cấp đồ chơi phát triển trí tuệ, sáng tạo và an toàn cho trẻ em.</p>
            </div>

            <div class="col-md-4 mb-3">
                <h5>Liên hệ</h5>
                <ul class="list-unstyled">
                    <li>Email: lienhe@dochoisangtao.vn</li>
                    <li>Hotline: 0123 456 789</li>
                    <li>Địa chỉ: 123 Đường ABC, Quận 1, TP. HCM</li>
                </ul>
            </div>

            <!-- Mạng xã hội -->
            <div class="col-md-4 mb-3">
                <h5>Kết nối với chúng tôi</h5>
                <a href="#" class="text-white me-2"><i class="bi bi-facebook"></i> Facebook</a><br>
                <a href="#" class="text-white me-2"><i class="bi bi-youtube"></i> YouTube</a><br>
                <a href="#" class="text-white"><i class="bi bi-instagram"></i> Instagram</a>
            </div>
        </div>

        <div class="text-center mt-3 border-top pt-3">
            <small>&copy; 2025 Cửa Hàng Đồ Chơi Sáng Tạo. All rights reserved.</small>
        </div>
    </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
