<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Trang Chủ - Cửa Hàng Đồ Chơi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card-img-top {
            height: 200px;
            width: 100%;
            object-fit: contain;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f8f9fa;
        }
        .banner {
            background: url('${pageContext.request.contextPath}/img/banner.jpg') no-repeat center center;
            background-size: cover;
            height: 300px;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .banner h1 {
            background-color: rgba(0,0,0,0.5);
            padding: 10px 20px;
            border-radius: 10px;
        }
        #bannerCarousel img {
            height: 400px;
            width: 80%;
            object-fit: cover;
            margin-top: 16px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        .banner-img {
            max-height: 350px;
            object-fit: cover;
            width: 100%;
        }
    </style>
</head>
<body>

<!-- Header -->
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

<div id="bannerCarousel" class="carousel slide mb-4" data-bs-ride="carousel">
    <div class="carousel-inner rounded shadow-sm">
        <div class="carousel-item active">
            <a href="${pageContext.request.contextPath}/home/featured">
                <img src="${pageContext.request.contextPath}/img/banner1.jpg" class="d-block w-100 banner-img"  alt="Banner 1">
            </a>
        </div>
        <div class="carousel-item">
            <a href="${pageContext.request.contextPath}/home/featured">
                <img src="${pageContext.request.contextPath}/img/banner2.jpg" class="d-block w-100" alt="Banner 2">
            </a>
        </div>
        <div class="carousel-item">
            <a href="${pageContext.request.contextPath}/home/featured">
                <img src="${pageContext.request.contextPath}/img/banner3.jpg" class="d-block w-100" alt="Banner 3">
            </a>
        </div>
    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#bannerCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#bannerCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>
</div>


<!-- Main Content -->
<div class="container">
    <h3 class="text-center text-primary mb-4">🌟 Các sản phẩm tiêu biểu 🌟</h3>
    <div class="row g-4">
        <c:forEach var="product" items="${modelToys}">
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    const urlParams = new URLSearchParams(window.location.search);
    const success = urlParams.get('success');
    if (success === 'logout') {
        Swal.fire({
            icon: 'success',
            title: 'Đăng xuất thành công!',
            text: 'Hẹn gặp lại!',
            confirmButtonText: 'OK'
        }).then(() => {
            const url = new URL(window.location);
            url.searchParams.delete('success');
            window.history.replaceState({}, document.title, url);
        });
    }
    if (success === 'login') {
        Swal.fire({
            icon: 'success',
            title: 'Đăng nhập thành công!',
            text: 'Chào mừng quý khách!',
            confirmButtonText: 'OK'
        }).then(() => {
            const url = new URL(window.location);
            url.searchParams.delete('success');
            window.history.replaceState({}, document.title, url);
        });
    }
</script>
</body>
</html>
