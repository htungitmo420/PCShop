<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Update Product - NHT-PCSHOP</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link href="<c:url value='/resources/admin/css/admin-layout.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/resources/admin/css/admin-form.css'/>" rel="stylesheet"/>
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
                    <h1><i class="fas fa-boxes me-2"></i>Update Product</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="/admin"><i class="fas fa-home me-1"></i>Dashboard</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/admin/product">Products</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">
                                Update #${newProduct.id}
                            </li>
                        </ol>
                    </nav>
                </div>

                <!-- Form Update -->
                <div class="form-card">
                    <div class="form-header">
                        <h3><i class="fas fa-edit me-2"></i>Edit Product Information</h3>
                        <p class="text-muted mb-0">Update product details below</p>
                    </div>
                    <%--@elvariable id="newProduct" type="vn"--%>
                    <form:form method="post"
                               action="/admin/product/update"
                               modelAttribute="newProduct"
                               enctype="multipart/form-data"
                               class="needs-validation" novalidate="novalidate">

                        <!-- Hidden ID -->
                        <form:hidden path="id"/>

                        <div class="row g-4">

                            <!-- Name -->
                            <div class="col-md-6">
                                <label class="form-label required"><i class="fas fa-tag me-2"></i>Name</label>
                                <form:input path="name" type="text" class="form-control"
                                            placeholder="Product name" required="required"/>
                                <div class="invalid-feedback">Name is required.</div>
                            </div>

                            <!-- Price -->
                            <div class="col-md-6">
                                <label class="form-label required"><i class="fas fa-dollar-sign me-2"></i>Price</label>
                                <form:input path="price" type="number" class="form-control"
                                            required="required"/>
                                <div class="invalid-feedback">Price is required.</div>
                            </div>

                            <!-- Short Description -->
                            <div class="col-md-6">
                                <label class="form-label"><i class="fas fa-align-left me-2"></i>Short
                                    Description</label>
                                <form:input path="shortDesc" type="text" class="form-control"
                                            placeholder="Short description"/>
                            </div>

                            <!-- Quantity -->
                            <div class="col-md-6">
                                <label class="form-label required"><i class="fas fa-box me-2"></i>Quantity</label>
                                <form:input path="quantity" type="number" class="form-control"
                                            required="required"/>
                                <div class="invalid-feedback">Quantity is required.</div>
                            </div>

                            <!-- Factory -->
                            <div class="col-md-6">
                                <label class="form-label required"><i class="fas fa-industry me-2"></i>Factory</label>
                                <form:select path="factory" class="form-select" required="required">
                                    <form:option value="apple">Apple</form:option>
                                    <form:option value="dell">Dell</form:option>
                                    <form:option value="samsung">Samsung</form:option>
                                </form:select>
                            </div>

                            <!-- Target -->
                            <div class="col-md-6">
                                <label class="form-label required"><i class="fas fa-users me-2"></i>Target</label>
                                <form:select path="target" class="form-select" required="required">
                                    <form:option value="gaming">Gaming</form:option>
                                    <form:option value="office">Office</form:option>
                                    <form:option value="design">Design</form:option>
                                </form:select>
                            </div>

                            <!-- Detailed Description -->
                            <div class="col-12">
                                <label class="form-label"><i class="fas fa-file-alt me-2"></i>Detailed
                                    Description</label>
                                <form:textarea path="detailDesc" rows="4" class="form-control"
                                               placeholder="Enter full detailed description"/>
                            </div>

                            <!-- Image Upload -->
                            <div class="col-12">
                                <label class="form-label"><i class="fas fa-image me-2"></i>Product Image</label>
                                <input type="file" name="imageFile" class="form-control"
                                       accept="image/*" id="avatarFile"/>
                                <small class="text-muted">Accepted: JPG, PNG, GIF (Max 2MB)</small>
                            </div>

                            <!-- Current Image Preview -->
                            <c:if test="${not empty newProduct.image}">
                                <div class="col-12">
                                    <div class="current-avatar">
                                        <label class="form-label">Current Image:</label>
                                        <div class="avatar-preview">
                                            <img src="<c:url value='/images/product/${newProduct.image}'/>"
                                                 alt="Current image" id="currentAvatar"/>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                            <!-- New Image Preview -->
                            <div class="col-12">
                                <div class="avatar-preview-container" style="display:none;">
                                    <label class="form-label">New Image Preview:</label>
                                    <div class="avatar-preview">
                                        <img id="avatarPreview" src="" alt="Avatar Preview"/>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- Buttons -->
                        <div class="form-actions">
                            <a href="/admin/product" class="btn-secondary">
                                <i class="fas fa-times me-2"></i>Cancel
                            </a>
                            <button type="submit" class="btn-primary">
                                <i class="fas fa-save me-2"></i>Update Product
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
<script src="<c:url value='/resources/admin/js/scripts.js'/>"></script>

<script>
    // New Image Preview
    document.getElementById('avatarFile')?.addEventListener('change', function (e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('avatarPreview').src = e.target.result;
                document.querySelector('.avatar-preview-container').style.display = 'block';
            };
            reader.readAsDataURL(file);
        }
    });

    // Validation
    (function () {
        'use strict';
        const forms = document.querySelectorAll('.needs-validation');
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    })();
</script>

</body>
</html>
