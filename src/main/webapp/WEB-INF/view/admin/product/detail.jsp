<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Product Detail - NHT-PCSHOP</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link href="<c:url value='/resources/admin/css/admin-layout.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/resources/admin/css/admin-detail.css'/>" rel="stylesheet"/>
</head>

<body>
<div class="app">

    <jsp:include page="../layout/header.jsp"/>
    <jsp:include page="../layout/sidebar.jsp"/>

    <div class="with-sidebar">
        <main id="main-content">
            <div class="container-fluid p-4">

                <!-- Header -->
                <div class="page-header detail-header">
                    <h1><i class="fas fa-box-open me-2"></i>Product Detail</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="/admin"><i class="fas fa-home me-1"></i>Dashboard</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/admin/product">Products</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">
                                Detail #${product.id}
                            </li>
                        </ol>
                    </nav>
                </div>

                <!-- Product Detail Card -->
                <div class="detail-card">

                    <!-- Header Row -->
                    <div class="detail-header">
                        <div class="d-flex align-items-center gap-3">

                            <!-- Product Image -->
                            <div class="user-avatar-large">
                                <c:choose>
                                    <c:when test="${not empty product.image}">
                                        <img src="<c:url value='/images/product/${product.image}'/>"
                                             alt="${product.name}"/>
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fas fa-box"></i>
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <div>
                                <h3 class="mb-1">${product.name}</h3>
                                <p class="text-muted mb-0">
                                    <i class="fas fa-dollar-sign me-2"></i>${product.price}
                                </p>
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="d-flex gap-2">
                            <a href="/admin/product/update/${product.id}" class="btn-edit">
                                <i class="fas fa-edit me-2"></i>Edit
                            </a>
                            <a href="/admin/product" class="btn-back">
                                <i class="fas fa-arrow-left me-2"></i>Back
                            </a>
                        </div>
                    </div>

                    <!-- Body -->
                    <div class="detail-body">
                        <div class="row g-4">

                            <!-- Basic Info -->
                            <div class="col-12">
                                <div class="info-section">
                                    <h4 class="section-title">
                                        <i class="fas fa-info-circle me-2"></i>Basic Information
                                    </h4>

                                    <div class="row g-3">

                                        <div class="col-md-6">
                                            <div class="info-item">
                                                <label><i class="fas fa-id-badge me-2"></i>Product ID</label>
                                                <div class="info-value">${product.id}</div>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="info-item">
                                                <label><i class="fas fa-industry me-2"></i>Factory</label>
                                                <div class="info-value">${product.factory}</div>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="info-item">
                                                <label><i class="fas fa-users me-2"></i>Target</label>
                                                <div class="info-value">${product.target}</div>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="info-item">
                                                <label><i class="fas fa-box me-2"></i>Quantity</label>
                                                <div class="info-value">${product.quantity}</div>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="info-item">
                                                <label><i class="fas fa-shopping-cart me-2"></i>Sold</label>
                                                <div class="info-value">${product.sold}</div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <!-- Descriptions -->
                            <c:if test="${not empty product.shortDesc}">
                                <div class="col-12">
                                    <div class="info-section">
                                        <h4 class="section-title">
                                            <i class="fas fa-align-left me-2"></i>Short Description
                                        </h4>
                                        <div class="info-value">${product.shortDesc}</div>
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${not empty product.detailDesc}">
                                <div class="col-12">
                                    <div class="info-section">
                                        <h4 class="section-title">
                                            <i class="fas fa-file-alt me-2"></i>Detailed Description
                                        </h4>
                                        <div class="info-value">${product.detailDesc}</div>
                                    </div>
                                </div>
                            </c:if>

                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="../layout/footer.jsp"/>
        </main>
    </div>

</div>

<div class="sidebar-overlay"></div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/admin/js/scripts.js'/>"></script>
</body>
</html>
