<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Product Management - NHT-PCSHOP</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link href="<c:url value='/resources/admin/css/admin-layout.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/resources/admin/css/product-show.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/resources/admin/css/product-form.css'/>" rel="stylesheet"/>
</head>
<body>
<div class="app">
    <jsp:include page="../layout/header.jsp"/>
    <jsp:include page="../layout/sidebar.jsp"/>

    <div class="with-sidebar">
        <main id="main-content">
            <div class="container-fluid p-4">
                <!-- Page Header -->
                <div class="page-header">
                    <h1><i class="fas fa-boxes me-2"></i>Product Management</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="/admin"><i class="fas fa-home me-1"></i>Dashboard</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Products</li>
                        </ol>
                    </nav>
                </div>

                <!-- Stats -->
                <div class="row">
                    <div class="col-md-4">
                        <div class="stats-card">
                            <div class="icon-box">
                                <i class="fas fa-box"></i>
                            </div>
                            <div class="stats-info">
                                <h2>${products.size()}</h2>
                                <p>Total Products</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product List -->
                <div class="product-card">
                    <div class="product-card-header">
                        <h3><i class="fas fa-table me-2"></i>Product List</h3>
                        <a href="/admin/product/create" class="btn-create-modern">
                            <i class="fas fa-plus-circle"></i>Create New Product
                        </a>
                    </div>

                    <c:choose>
                        <c:when test="${empty products}">
                            <div class="empty-state-modern">
                                <i class="fas fa-box-open fa-4x"></i>
                                <h3>No Product Found</h3>
                                <p>Start by creating your first product</p>
                            </div>
                        </c:when>

                        <c:otherwise>
                            <table class="table product-table">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Factory</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="product" items="${products}">
                                    <tr>
                                        <td><strong>${product.id}</strong></td>
                                        <td>
                                            <div class="product-image-cell">
                                                <c:choose>
                                                    <c:when test="${not empty product.image}">
                                                        <img src="<c:url value='/resources/admin/images/product/${product.image}'/>"
                                                             alt="${product.name}"
                                                             class="product-thumbnail"
                                                             onerror="this.onerror=null; this.src='<c:url
                                                                     value='/resources/images/no-image.png'/>'"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="no-image">
                                                            <i class="fas fa-image"></i>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </td>
                                        <td>${product.name}</td>
                                        <td><strong>$${product.price}</strong></td>
                                        <td>${product.factory}</td>
                                        <td>
                                            <div class="action-buttons-modern">
                                                <a href="/admin/product/${product.id}"
                                                   class="btn-action-modern btn-view-modern">
                                                    <i class="fas fa-eye"></i> View
                                                </a>
                                                <a href="/admin/product/update/${product.id}"
                                                   class="btn-action-modern btn-edit-modern">
                                                    <i class="fas fa-edit"></i> Edit
                                                </a>
                                                <a href="/admin/product/delete/${product.id}"
                                                   class="btn-action-modern btn-delete-modern">
                                                    <i class="fas fa-trash"></i> Delete
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>
                </div>

            </div>

        </main>
    </div>
    <jsp:include page="../layout/footer.jsp"/>
</div>

<div class="sidebar-overlay"></div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/admin/js/scripts.js'/>"></script>

</body>
</html>
