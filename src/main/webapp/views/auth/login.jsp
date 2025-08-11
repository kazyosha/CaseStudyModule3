<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background: linear-gradient(to right, #e0eafc, #cfdef3);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .login-container {
            min-height: 100vh;
        }

        .form-section {
            padding: 40px;
        }

        .form-section h4 {
            font-weight: 600;
        }

        .form-control {
            border-radius: 0.5rem;
            padding: 10px 14px;
        }

        .btn-secondary {
            border-radius: 0.5rem;
        }

        .social-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .form-section a {
            color: #6c757d;
            text-decoration: none;
        }

        .form-section a:hover {
            text-decoration: underline;
        }

        .alert-danger {
            font-size: 14px;
            padding: 8px;
        }
        .image-section img {
            margin-left: -20px;
        }
    </style>
</head>
<body>
<div class="container login-container d-flex justify-content-center align-items-center">
    <div class="row shadow-lg border rounded overflow-hidden bg-white" style="max-width: 900px; width: 100%;">

        <div class="col-md-6 d-none d-md-block p-0">
            <img src="${pageContext.request.contextPath}/img/img_login.png"
                 alt="Login Image"
                 class="img-fluid h-100">
        </div>

        <div class="col-md-6 form-section">
            <div class="text-center mb-4">
                <div class="rounded-circle bg-secondary mx-auto" style="width: 60px; height: 60px;"></div>
                <h4 class="mt-3">Log in</h4>
            </div>

            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger text-center">${error}</div>
            </c:if>

            <!-- Login Form -->
            <form action="${pageContext.request.contextPath}/auth/login" method="post">
                <div class="mb-3">
                    <input type="text" class="form-control" name="username" placeholder="Username or Email" required>
                </div>
                <div class="mb-3">
                    <input type="password" class="form-control" name="password" placeholder="Password" required>
                </div>
                <div class="d-grid mb-3">
                    <button type="submit" class="btn btn-primary">Log in</button>
                </div>

<%--                <div class="text-center mb-3 text-muted">— OR —</div>--%>

<%--                <div class="d-grid mb-3">--%>
<%--                    <button type="button" class="btn btn-outline-primary social-btn">--%>
<%--                        <i class="bi bi-facebook"></i> Continue with Facebook--%>
<%--                    </button>--%>
<%--                </div>--%>

                <div class="text-center mb-2">
                    <a href="#">Forgot your password?</a>
                </div>
                <div class="text-center">
                    Don't have an account?
                    <a href="${pageContext.request.contextPath}/auth/register">Sign up</a>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    const urlParams = new URLSearchParams(window.location.search);
    const success = urlParams.get('success');
    if (success === 'register') {
        Swal.fire({
            icon: 'success',
            title: 'Đăng ký thành công!',
            text: 'Bạn có thể đăng nhập ngay bây giờ.',
            confirmButtonText: 'OK'
        });
    }
    // Thông báo lỗi đăng nhập
    <c:if test="${not empty error}">
    Swal.fire({
        icon: 'error',
        title: 'Lỗi đăng nhập',
        text: '${error}',
        confirmButtonText: 'Thử lại'
    });
    </c:if>
</script>
</body>
</html>
