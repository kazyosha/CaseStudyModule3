<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Liên hệ & Góp ý</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .contact-form {
            background-color: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .form-label {
            font-weight: bold;
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
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="contact-form">
                <h3 class="text-center text-primary mb-4">📩 Gửi Đánh Giá / Góp Ý Cho Chúng Tôi</h3>

                <form action="${pageContext.request.contextPath}/contact" method="post">
                    <div class="mb-3">
                        <label for="name" class="form-label">Họ và tên</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Nhập họ tên của bạn" required>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email liên hệ</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="email@example.com" required>
                    </div>

                    <div class="mb-3">
                        <label for="subject" class="form-label">Chủ đề</label>
                        <input type="text" class="form-control" id="subject" name="subject" placeholder="Ví dụ: Góp ý về sản phẩm..." required>
                    </div>

                    <div class="mb-3">
                        <label for="message" class="form-label">Nội dung góp ý</label>
                        <textarea class="form-control" id="message" name="message" rows="5" placeholder="Nhập nội dung bạn muốn gửi..." required></textarea>
                    </div>

                    <div class="text-end">
                        <button type="submit" class="btn btn-primary">Gửi đánh giá</button>
                    </div>
                </form>

                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success mt-3">${successMessage}</div>
                </c:if>
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
