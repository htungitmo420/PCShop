<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Create Product - NHT-PCSHOP</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link href="<c:url value='/resources/admin/css/admin-layout.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/resources/admin/css/admin-form.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/resources/admin/css/admin-validation.css'/>" rel="stylesheet"/>
</head>

<body>
<div class="app">

    <jsp:include page="../layout/header.jsp"/>
    <jsp:include page="../layout/sidebar.jsp"/>

    <div class="with-sidebar">
        <main id="main-content">
            <div class="container-fluid p-4">

                <!-- Page Header -->
                <div class="page-header form-header">
                    <h1><i class="fas fa-box-open me-2"></i>Create Product</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="/admin"><i class="fas fa-home me-1"></i>Dashboard</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/admin/product">Products</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Create</li>
                        </ol>
                    </nav>
                </div>

                <!-- Form Card -->
                <div class="form-card">

                    <div class="form-header">
                        <h3><i class="fas fa-edit me-2"></i>Product Information</h3>
                        <p class="text-muted mb-0">Fill in the details below to create a new product</p>
                    </div>
                    <%--@elvariable id="newProduct" type="vn"--%>
                    <form:form method="post"
                               action="/admin/product/create"
                               modelAttribute="newProduct"
                               enctype="multipart/form-data">

                        <div class="row g-4">

                            <!-- Product Name -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label required">
                                        <i class="fas fa-tag me-2"></i>Product Name
                                    </label>
                                    <form:input path="name"
                                                cssClass="form-control"
                                                cssErrorClass="form-control is-invalid"
                                                placeholder="Enter product name"/>
                                    <form:errors path="name" cssClass="invalid-feedback"/>
                                </div>
                            </div>

                            <!-- Price -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label required">
                                        <i class="fas fa-dollar-sign me-2"></i>Price
                                    </label>
                                    <form:input path="price" type="number"
                                                cssClass="form-control"
                                                cssErrorClass="form-control is-invalid"
                                                placeholder="0.00" step="0.01"/>
                                    <form:errors path="price" cssClass="invalid-feedback"/>
                                </div>
                            </div>

                            <!-- Factory -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label required">
                                        <i class="fas fa-industry me-2"></i>Factory
                                    </label>
                                    <form:input path="factory"
                                                cssClass="form-control"
                                                cssErrorClass="form-control is-invalid"
                                                placeholder="Apple, Samsung, Xiaomi..."/>
                                    <form:errors path="factory" cssClass="invalid-feedback"/>
                                </div>
                            </div>

                            <!-- Target -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-users me-2"></i>Target User
                                    </label>
                                    <form:input path="target"
                                                cssClass="form-control"
                                                placeholder="e.g. Students, Office, Gaming..."/>
                                </div>
                            </div>

                            <!-- Quantity -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-boxes me-2"></i>Quantity
                                    </label>
                                    <form:input path="quantity" type="number" cssClass="form-control"/>
                                </div>
                            </div>

                            <!-- Short Description -->
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-align-left me-2"></i>Short Description
                                    </label>
                                    <form:textarea path="shortDesc" cssClass="form-control" rows="2"
                                                   placeholder="Short summary..."/>
                                </div>
                            </div>

                            <!-- Detail Description -->
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-file-alt me-2"></i>Detail Description
                                    </label>
                                    <form:textarea path="detailDesc" cssClass="form-control" rows="4"
                                                   placeholder="Full product details..."/>
                                </div>
                            </div>

                            <!-- Image Upload -->
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-image me-2"></i>Product Image
                                    </label>
                                    <input type="file" class="form-control" name="imageFile"
                                           accept="image/*" id="productFile"/>
                                    <small class="text-muted">Accepted: JPG, PNG, GIF (Max 2MB)</small>
                                </div>
                            </div>

                            <!-- Image Preview -->
                            <div class="col-12">
                                <div class="avatar-preview-container" style="display: none;">
                                    <label class="form-label">Preview:</label>
                                    <div class="avatar-preview">
                                        <img id="productPreview" src="" alt="Image Preview"/>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- Form Actions -->
                        <div class="form-actions">
                            <a href="/admin/product" class="btn-secondary">
                                <i class="fas fa-times me-2"></i>Cancel
                            </a>
                            <button type="submit" class="btn-primary">
                                <i class="fas fa-check me-2"></i>Create Product
                            </button>
                        </div>

                    </form:form>
                </div>
            </div>

            <jsp:include page="../layout/footer.jsp"/>
        </main>
    </div>
</div>

<div class="sidebar-overlay"></div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Image Preview
    document.getElementById('productFile')?.addEventListener('change', function (e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                const preview = document.getElementById('productPreview');
                const container = document.querySelector('.avatar-preview-container');
                preview.src = e.target.result;
                container.style.display = 'block';
            };
            reader.readAsDataURL(file);
        }
    });
</script>
<script src="<c:url value='/resources/admin/js/scripts.js'/>"></script>
</body>
</html>
