<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Create User - NHT-PCSHOP</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link href="<c:url value='/resources/css/admin-layout.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/resources/css/admin-form.css'/>" rel="stylesheet"/>
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
                    <h1><i class="fas fa-user-plus me-2"></i>Create User</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="/admin"><i class="fas fa-home me-1"></i>Dashboard</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/admin/user">Users</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Create</li>
                        </ol>
                    </nav>
                </div>

                <!-- Form Card -->
                <div class="form-card">
                    <div class="form-header">
                        <h3><i class="fas fa-edit me-2"></i>User Information</h3>
                        <p class="text-muted mb-0">Fill in the details below to create a new user</p>
                    </div>
                    <%--@elvariable id="newUser" type="vn"--%>
                    <form:form method="post" action="/admin/user/create" modelAttribute="newUser"
                               enctype="multipart/form-data" class="needs-validation" novalidate="novalidate">
                        <div class="row g-4">
                            <!-- Email -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label required">
                                        <i class="fas fa-envelope me-2"></i>Email
                                    </label>
                                    <form:input path="email" type="email" class="form-control"
                                                placeholder="user@example.com" required="required"/>
                                    <div class="invalid-feedback">Please provide a valid email address.
                                    </div>
                                </div>
                            </div>

                            <!-- Password -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label required">
                                        <i class="fas fa-lock me-2"></i>Password
                                    </label>
                                    <form:input path="password" type="password" class="form-control"
                                                placeholder="••••••••" required="required"/>
                                    <div class="invalid-feedback">Password is required.</div>
                                </div>
                            </div>

                            <!-- Phone Number -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-phone me-2"></i>Phone Number
                                    </label>
                                    <form:input path="phoneNumber" type="tel" class="form-control"
                                                placeholder="+xx xxx xxx xxx"/>
                                </div>
                            </div>

                            <!-- Full Name -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label required">
                                        <i class="fas fa-user me-2"></i>Full Name
                                    </label>
                                    <form:input path="fullName" type="text" class="form-control"
                                                placeholder="John Doe" required="required"/>
                                    <div class="invalid-feedback">Full name is required.</div>
                                </div>
                            </div>

                            <!-- Address -->
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-map-marker-alt me-2"></i>Address
                                    </label>
                                    <form:textarea path="address" class="form-control" rows="3"
                                                   placeholder="Enter full address"/>
                                </div>
                            </div>

                            <!-- Role -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label required">
                                        <i class="fas fa-user-tag me-2"></i>Role
                                    </label>
                                    <form:select class="form-select" path="role.id">
                                        <c:forEach items="${roles}" var="r">
                                            <form:option value="${r.id}">${r.name}</form:option>
                                        </c:forEach>
                                    </form:select>
                                </div>
                            </div>

                            <!-- Avatar Upload -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-image me-2"></i>Avatar
                                    </label>
                                    <input type="file" class="form-control" name="imageFile"
                                           accept="image/*" id="avatarFile"/>
                                    <small class="text-muted">Accepted: JPG, PNG, GIF (Max 2MB)</small>
                                </div>
                            </div>

                            <!-- Avatar Preview -->
                            <div class="col-12">
                                <div class="avatar-preview-container" style="display: none;">
                                    <label class="form-label">Preview:</label>
                                    <div class="avatar-preview">
                                        <img id="avatarPreview" src="" alt="Avatar Preview"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Form Actions -->
                        <div class="form-actions">
                            <a href="/admin/user" class="btn-secondary">
                                <i class="fas fa-times me-2"></i>Cancel
                            </a>
                            <button type="submit" class="btn-primary">
                                <i class="fas fa-check me-2"></i>Create User
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
<script src="<c:url value='/resources/js/scripts.js'/>"></script>
<script>
    // Avatar Preview
    document.getElementById('avatarFile')?.addEventListener('change', function (e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                const preview = document.getElementById('avatarPreview');
                const container = document.querySelector('.avatar-preview-container');
                preview.src = e.target.result;
                container.style.display = 'block';
            };
            reader.readAsDataURL(file);
        }
    });

    // Form Validation
    (function () {
        'use strict';
        const forms = document.querySelectorAll('.needs-validation');
        Array.from(forms).forEach(function (form) {
            form.addEventListener('submit', function (event) {
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