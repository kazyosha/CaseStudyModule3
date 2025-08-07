<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>Danh sách danh mục</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
  <h2 class="mb-4 text-primary">Danh sách Danh Mục</h2>

  <a href="${pageContext.request.contextPath}/category/add" class="btn btn-success mb-3">+ Thêm danh mục mới</a>
  <a href="${pageContext.request.contextPath}/product/list" class="btn btn-primary mb-3"> List Product</a>

  <table class="table table-bordered table-hover table-striped">
    <thead class="table-dark">
    <tr>
      <th scope="col">STT</th>
      <th scope="col">Tên danh mục</th>
      <th scope="col">Mô tả</th>
      <th scope="col">Hành động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="category" items="${listCategory}" varStatus="status">
      <tr>
        <td>${status.index + 1}</td>
        <td>${category.name}</td>
        <td>${category.description}</td>
        <td>
          <a href="/category/delete?id=${category.id}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>
