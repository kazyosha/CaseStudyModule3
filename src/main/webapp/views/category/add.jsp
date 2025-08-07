<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>Thêm Danh Mục</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
  <h2 class="text-primary mb-4">Thêm Danh Mục Mới</h2>

  <form method="post" action="${pageContext.request.contextPath}/category/add" class="border p-4 bg-white rounded shadow-sm">
    <div class="mb-3">
      <label for="name" class="form-label">Tên danh mục:</label>
      <input type="text" id="name" name="name" class="form-control" required>
    </div>

    <div class="mb-3">
      <label for="description" class="form-label">Mô tả:</label>
      <textarea id="description" name="description" rows="4" class="form-control"></textarea>
    </div>

    <button type="submit" class="btn btn-success">Thêm</button>
    <a href="${pageContext.request.contextPath}/category/list" class="btn btn-secondary ms-2">Quay lại danh sách</a>
  </form>
</div>
</body>
</html>
