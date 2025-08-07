<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="vi_VN"/>

<html>
<head>
    <title>Danh sách sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            padding: 30px;
            background-color: #f8f9fa;
        }

        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .table th, .table td {
            vertical-align: middle;
        }

        .btn {
            margin-right: 5px;
        }

        .search-box {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .search-box input {
            width: 300px;
        }
        .mb-4{
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <h1 class="mb-4">TOY STORE</h1>
    <h2 class="mb-3">Danh sách sản phẩm</h2>

    <div class="search-box">
        <form method="get" action="/product/search">
            <input type="text" name="keyword" class="form-control" placeholder="Tìm kiếm sản phẩm...">
        </form>
        <div>
            <a href="/product/add" class="btn btn-success">+ Thêm sản phẩm</a>
            <a href="/category/add" class="btn btn-success">+ Thêm danh mục</a>
            <a href="/invoice/list" class="btn btn-primary">Hóa đơn</a>
        </div>
    </div>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>STT</th>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Danh mục</th>
            <th>Image</th>
            <th>Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${listProduct}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${product.name}</td>
                <td>
                    <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true" maxFractionDigits="0"/>
                    ₫
                </td>
                <td>${product.quantity}</td>
                <td><c:out value="${fn:replace(product.categories.name, ',', '<br/>')}" escapeXml="false"/></td>
                <td><img src="${pageContext.request.contextPath}/${product.image}" width="100"></td>
                <td>
                    <a href="/product/delete?id=${product.id}" onclick="return confirm('Bạn có chắc chắn muốn xoá?');" class="btn btn-danger btn-sm">Delete</a>|
                    <a href="/product/edit?id=${product.id}" class="btn btn-warning btn-sm">Edit</a>
                </td>
            </tr>
        </c:forEach>

        <c:if test="${empty listProduct}">
            <tr>
                <td colspan="7" class="text-center">Không có dữ liệu sản phẩm</td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>
<script>
    const urlParams = new URLSearchParams(window.location.search);
    const success = urlParams.get('success');
    if (success === 'login') {
        Swal.fire({
            icon: 'success',
            title: 'Đăng nhập thành công!',
            text: 'Chào mừng bạn quay trở lại!',
            confirmButtonText: 'OK'
        });
    }
</script>
</body>
</html>
