<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Cửa Hàng Đồ Chơi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card-img-top {
            height: 140px;
            object-fit: contain;
            border: 1px solid #ccc;
            border-radius: 6px;
            padding: 6px;
            background-color: #fff;
        }

        .card-img-top:hover {
            transform: scale(1.05);
            transition: transform 0.3s ease;
        }
    </style>
</head>
<body>
<div class="bg-light border-bottom py-2">
    <div class="container d-flex justify-content-between align-items-center">
        <div class="d-flex align-items-center">
            <img src="${pageContext.request.contextPath}/img/logo.jpg" alt="Logo" style="height: 50px;">
            <h5 class="ms-3 text-primary mb-0">Cửa Hàng Đồ Chơi Sáng Tạo</h5>
        </div>
        <form class="d-flex" action="${pageContext.request.contextPath}/home/search" method="get">
            <input class="form-control me-2" type="search" placeholder="Tìm kiếm..." name="keyword">
            <button class="btn btn-outline-primary" type="submit">Tìm</button>
        </form>
        <div>
            <c:choose>
                <c:when test="${sessionScope.user != null}">
                    <p>Xin chào, ${sessionScope.user.fullName} | <a href="${pageContext.request.contextPath}/auth/logout">Đăng xuất</a></p>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/auth/login" class="btn btn-primary">Đăng nhập</a>
                    <a href="${pageContext.request.contextPath}/auth/register" class="btn btn-outline-secondary me-2">Đăng ký</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<!-- Menu ngang -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/home">Trang chủ</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/home/featured">Sản phẩm nổi bật</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/home/discount">Giảm giá</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/home/blogs">Blogs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/home/contact">Liên hệ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/home/policy">Chính sách</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid mt-4">
    <div class="row">
        <!-- Sidebar bên trái -->
        <div class="col-md-2">
            <div class="border rounded p-3 bg-light">
                <h6><strong>Chỉ hiển thị còn hàng</strong></h6>
                <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" id="stockOnly">
                    <label class="form-check-label" for="stockOnly">Còn hàng</label>
                </div>

                <h6 class="mt-3"><strong>Loại sản phẩm</strong></h6>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="type1">
                    <label class="form-check-label" for="type1">Mô hình One Piece <span class="text-muted">[21]</span></label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="type2">
                    <label class="form-check-label" for="type2">Đồ chơi Gundam <span class="text-muted">[13]</span></label>
                </div>

                <h6 class="mt-4"><strong>Mức giá</strong></h6>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="price1">
                    <label class="form-check-label" for="price1">Dưới 5 triệu <span class="text-muted">[5]</span></label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="price2">
                    <label class="form-check-label" for="price2">5 - 10 triệu <span class="text-muted">[8]</span></label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="price3">
                    <label class="form-check-label" for="price3">Trên 10 triệu <span class="text-muted">[6]</span></label>
                </div>

                <h6 class="mt-4"><strong>Chủ đề</strong></h6>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="theme1">
                    <label class="form-check-label" for="theme1">One Piece <span class="text-muted">[10]</span></label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="theme2">
                    <label class="form-check-label" for="theme2">Dragon Ball <span class="text-muted">[4]</span></label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="theme3">
                    <label class="form-check-label" for="theme3">Naruto <span class="text-muted">[3]</span></label>
                </div>
            </div>
        </div>

        <!-- Sản phẩm nổi bật bên phải -->
        <div class="col-md-10">
            <h4 class="mb-4">🔸 Sản phẩm nổi bật</h4>
            <div class="row g-4">
                <c:forEach var="entry" items="${groupedProducts}">
                    <h4 class="mt-4 mb-3 text-primary fw-bold">Danh mục: ${entry.key}</h4>
                    <div class="row">
                        <c:forEach var="product" items="${entry.value}">
                            <div class="col-md-3 mb-4">
                                <div class="card h-100 shadow-sm" style="text-align: center">
                                    <img src="${pageContext.request.contextPath}/${product.image}"
                                         class="card-img-top"
                                         alt="${product.name}">
                                    <div class="card-body d-flex flex-column">
                                        <h6 class="card-title text-dark">${product.name}</h6>
                                        <p class="card-text text-danger fw-semibold">
                                            Giá: <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/> VNĐ
                                        </p>
                                        <a href="${pageContext.request.contextPath}/product/detail?id=${product.id}" class="btn btn-outline-primary mt-auto">Xem chi tiết</a>
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

<!-- Footer -->
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
            <div class="col-md-4 mb-3">
                <h5>Kết nối với chúng tôi</h5>
                <a href="#" class="text-white me-2">Facebook</a><br>
                <a href="#" class="text-white me-2">YouTube</a><br>
                <a href="#" class="text-white">Instagram</a>
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
