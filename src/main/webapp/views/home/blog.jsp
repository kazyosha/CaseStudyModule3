<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Blog Đồ Chơi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .blog-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            transition: box-shadow 0.3s;
        }

        .blog-card:hover {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .blog-image {
            height: 200px;
            object-fit: cover;
            width: 100%;
        }

        .blog-title {
            color: #0d6efd;
            font-weight: bold;
        }

        .blog-content {
            max-height: 80px;
            overflow: hidden;
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
        <form class="d-flex" action="${pageContext.request.contextPath}/search" method="get">
            <input class="form-control me-2" type="search" placeholder="Tìm kiếm..." name="query">
            <button class="btn btn-outline-primary" type="submit">Tìm</button>
        </form>
        <div>
            <a href="${pageContext.request.contextPath}/auth/login" class="btn btn-primary">Login</a>
            <a href="${pageContext.request.contextPath}/auth/register" class="btn btn-outline-secondary me-2">Sign up</a>
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
<div class="container my-5">
    <h2 class="text-center mb-5 text-primary">🧸 Blog Chia Sẻ Kiến Thức & Tin Tức Về Đồ Chơi</h2>

    <div class="row g-4">
        <!-- Blog 1 -->
        <div class="col-md-4">
            <div class="blog-card">
                <img src="https://cdn.pixabay.com/photo/2016/03/27/20/56/bear-1281321_960_720.jpg" alt="Đồ chơi thông minh" class="blog-image">
                <div class="p-3">
                    <h5 class="blog-title">Lợi ích của đồ chơi thông minh cho trẻ nhỏ</h5>
                    <p class="blog-content">Đồ chơi thông minh giúp trẻ phát triển trí tuệ, khả năng tư duy logic và sáng tạo thông qua các hoạt động vui chơi mỗi ngày...</p>
                    <a href="#" class="btn btn-outline-primary btn-sm mt-2">Xem chi tiết</a>
                </div>
            </div>
        </div>

        <!-- Blog 2 -->
        <div class="col-md-4">
            <div class="blog-card">
                <img src="https://cdn.pixabay.com/photo/2016/04/01/10/10/toy-1309828_960_720.jpg" alt="Lắp ráp lego" class="blog-image">
                <div class="p-3">
                    <h5 class="blog-title">Top 5 bộ đồ chơi lắp ráp LEGO phát triển tư duy</h5>
                    <p class="blog-content">LEGO là món đồ chơi không thể thiếu đối với trẻ yêu thích xây dựng. Cùng khám phá 5 bộ LEGO nổi bật năm 2025 mà bạn không nên bỏ qua...</p>
                    <a href="#" class="btn btn-outline-primary btn-sm mt-2">Xem chi tiết</a>
                </div>
            </div>
        </div>

        <!-- Blog 3 -->
        <div class="col-md-4">
            <div class="blog-card">
                <img src="https://cdn.pixabay.com/photo/2014/12/30/10/36/teddy-bear-584264_960_720.jpg" alt="Chọn đồ chơi an toàn" class="blog-image">
                <div class="p-3">
                    <h5 class="blog-title">Hướng dẫn chọn đồ chơi an toàn cho bé</h5>
                    <p class="blog-content">Không chỉ giúp bé vui chơi, đồ chơi còn cần đảm bảo an toàn cho sức khỏe. Cùng tìm hiểu cách chọn đồ chơi phù hợp theo độ tuổi...</p>
                    <a href="#" class="btn btn-outline-primary btn-sm mt-2">Xem chi tiết</a>
                </div>
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
</body>
</html>
