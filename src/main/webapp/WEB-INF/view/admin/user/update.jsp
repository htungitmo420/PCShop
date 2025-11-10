<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Update User - NHT-PCSHOP</title>

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
                    <h1><i class="fas fa-user-edit me-2"></i>Update User</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="/admin"><i class="fas fa-home me-1"></i>Dashboard</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/admin/user">Users</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Update #${newUser.id}</li>
                        </ol>
                    </nav>
                </div>

                <!-- Form Card -->
                <div class="form-card">
                    <div class="form-header">
                        <h3><i class="fas fa-edit me-2"></i>Edit User Information</h3>
                        <p class="text-muted mb-0">Update user details below</p>
                    </div>
                    <%--@elvariable id="newUser" type="vn"--%>
                    <form:form method="post" action="/admin/user/update" modelAttribute="newUser"
                               enctype="multipart/form-data" class="needs-validation" novalidate="novalidate">
                        <!-- Hidden ID -->
                        <form:hidden path="id"/>

                        <div class="row g-4">
                            <!-- Email (readonly) -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-envelope me-2"></i>Email
                                    </label>
                                    <form:input path="email" type="email" class="form-control"
                                                readonly="true"/>
                                    <small class="text-muted">Email cannot be changed</small>
                                </div>
                            </div>

                            <!-- Phone Number -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-phone me-2"></i>Phone Number
                                    </label>
                                    <form:input path="phoneNumber" type="tel" class="form-control"
                                                placeholder="+84 xxx xxx xxx"/>
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

                            <!-- Role -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label required">
                                        <i class="fas fa-user-tag me-2"></i>Role
                                    </label>
                                    <form:select path="role.id" class="form-select" required="required">
                                        <c:forEach items="${roles}" var="r">
                                            <form:option value="${r.id}">${r.name}</form:option>
                                        </c:forEach>
                                    </form:select>
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

                            <!-- Avatar Upload -->
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-image me-2"></i>Avatar
                                    </label>
                                    <input type="file" class="form-control" name="imageFile"
                                           accept="image/*" id="avatarFile"/>
                                    <small class="text-muted">Accepted: JPG, PNG, GIF (Max 2MB)</small>
                                </div>
                            </div>

                            <!-- Current Avatar Preview -->
                            <c:if test="${not empty newUser.avatar}">
                                <div class="col-12">
                                    <div class="current-avatar">
                                        <label class="form-label">Current Avatar:</label>
                                        <div class="avatar-preview">
                                            <img src="<c:url value='/images/avatar/${newUser.avatar}'/>"
                                                 alt="Current avatar" id="currentAvatar"/>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                            <!-- New Avatar Preview -->
                            <div class="col-12">
                                <div class="avatar-preview-container" style="display: none;">
                                    <label class="form-label">New Avatar Preview:</label>
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
                                <i class="fas fa-save me-2"></i>Update User
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