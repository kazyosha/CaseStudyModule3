<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="vi_VN"/>

<html>
<head>
  <title>Danh sách người dùng</title>
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

    .mb-4 {
      text-align: center;
    }
  </style>
</head>
<body>

<div class="container">
  <h1 class="mb-4">TOY STORE</h1>
  <h2 class="mb-3">Danh sách người dùng</h2>

  <div class="search-box">
    <form method="get" action="/user/search">
      <input type="text" name="keyword" class="form-control" placeholder="Tìm kiếm người dùng...">
    </form>
    <div>
      <a href="/user/add" class="btn btn-success">+ Thêm Quản trị viên</a>
      <a href="/product/list" class="btn btn-primary">List Product</a>
    </div>
  </div>

  <table class="table table-bordered table-striped">
    <thead class="table-dark">
    <tr>
      <th>ID</th>
      <th>Họ và tên</th>
      <th>Email</th>
      <th>Điện thoại</th>
      <th>Địa chỉ</th>
      <th>Quyền</th>
      <th>Thao tác</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${listUser}" varStatus="status">
      <tr>
        <td>${status.index + 1}</td>
        <td><c:out value="${user.fullName}"/></td>
        <td><c:out value="${user.email}"/></td>
        <td><c:out value="${user.phone != null ? user.phone : '-'}"/></td>
        <td><c:out value="${user.address != null ? user.address : '-'}"/></td>
        <td><c:out value="${user.role}"/></td>
        <td>
          <a href="/user/delete?id=${user.id}" onclick="return confirm('Bạn có chắc chắn muốn xoá người dùng này?');" class="btn btn-danger btn-sm">Delete</a> |
          <a href="/user/edit?id=${user.id}" class="btn btn-warning btn-sm">Edit</a>
        </td>
      </tr>
    </c:forEach>

    <c:if test="${empty listUser}">
      <tr>
        <td colspan="7" class="text-center">Không có dữ liệu người dùng</td>
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
