<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chính Sách Cửa Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f9f9f9;
        }
        .policy-section {
            background-color: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
        }
        .policy-title {
            color: #0d6efd;
            font-weight: 600;
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
    <div class="policy-section">
        <h2 class="text-center mb-4 policy-title">📜 Chính Sách Cửa Hàng Đồ Chơi Sáng Tạo</h2>

        <!-- Chính sách đổi trả -->
        <h4 class="mt-4">1. Chính sách đổi/trả sản phẩm</h4>
        <p>
            Quý khách có thể đổi trả sản phẩm trong vòng <strong>7 ngày</strong> kể từ ngày nhận hàng nếu sản phẩm bị lỗi kỹ thuật do nhà sản xuất hoặc bị hư hỏng trong quá trình vận chuyển. Sản phẩm phải còn nguyên vẹn, không bị sử dụng hoặc thay đổi hình dạng ban đầu.
        </p>

        <!-- Chính sách bảo hành -->
        <h4 class="mt-4">2. Chính sách bảo hành</h4>
        <p>
            Tất cả các sản phẩm tại cửa hàng đều được bảo hành theo quy định của nhà sản xuất. Vui lòng giữ lại hóa đơn mua hàng và bao bì sản phẩm để được hỗ trợ bảo hành.
        </p>

        <!-- Chính sách vận chuyển -->
        <h4 class="mt-4">3. Chính sách vận chuyển</h4>
        <p>
            Chúng tôi hỗ trợ giao hàng toàn quốc với thời gian giao dự kiến từ 2–5 ngày làm việc tùy vào khu vực. Miễn phí vận chuyển cho đơn hàng từ <strong>500.000 VNĐ</strong> trở lên.
        </p>

        <!-- Chính sách bảo mật -->
        <h4 class="mt-4">4. Chính sách bảo mật thông tin</h4>
        <p>
            Thông tin cá nhân của khách hàng được bảo mật tuyệt đối và chỉ sử dụng cho mục đích xử lý đơn hàng và chăm sóc khách hàng. Chúng tôi cam kết không chia sẻ thông tin khách hàng với bên thứ ba khi chưa có sự đồng ý.
        </p>

        <!-- Hỗ trợ -->
        <h4 class="mt-4">5. Hỗ trợ và phản hồi</h4>
        <p>
            Nếu quý khách có bất kỳ thắc mắc hay góp ý nào về chính sách, vui lòng liên hệ qua email: <strong>lienhe@dochoisangtao.vn</strong> hoặc hotline <strong>0123 456 789</strong>.
        </p>
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
