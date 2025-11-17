<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Update Factory - NHT-PCSHOP</title>

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
                <div class="page-header form-header mb-4">
                    <div>
                        <h1><i class="fas fa-industry me-2"></i>Update Factory</h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-0 bg-transparent p-0">
                                <li class="breadcrumb-item">
                                    <a href="/admin"><i class="fas fa-home me-1"></i>Dashboard</a>
                                </li>
                                <li class="breadcrumb-item">
                                    <a href="/admin/manufacturer">Factory</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Update #${newFactory.id}
                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <!-- Form Card -->
                <div class="form-card">
                    <div class="form-header d-flex align-items-center mb-4">
                        <div class="me-3">
                            <span class="bg-primary text-white rounded-circle d-inline-flex align-items-center justify-content-center"
                                  style="width:48px;height:48px;">
                                <i class="fas fa-edit"></i>
                            </span>
                        </div>
                        <div>
                            <h3 class="mb-1"><i class="fas fa-industry me-2"></i>Factory Information</h3>
                            <p class="text-muted mb-0">Update the factory details below</p>
                        </div>
                    </div>

                    <!-- Error Message -->
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="fas fa-exclamation-triangle me-2"></i>
                            <strong>Error!</strong> ${errorMessage}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <%--@elvariable id="newFactory" type="vn.nhtw420.pcshop.domain.Factory"--%>
                    <form:form method="post"
                               action="/admin/manufacturer/update"
                               modelAttribute="newFactory"
                               class="needs-validation"
                               novalidate="novalidate">

                        <!-- Hidden ID -->
                        <form:hidden path="id"/>

                        <div class="row g-4">

                            <!-- Factory ID Display -->
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-id-badge me-2"></i>Factory ID
                                    </label>
                                    <input type="text" class="form-control bg-light"
                                           value="${newFactory.id}" readonly/>
                                </div>
                            </div>

                            <!-- Factory Name -->
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label class="form-label required">
                                        <i class="fas fa-building me-2"></i>Factory Name
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <i class="fas fa-industry"></i>
                                        </span>
                                        <form:input path="name" type="text"
                                                    class="form-control"
                                                    placeholder="Enter factory name (e.g. Apple, Samsung)"
                                                    required="required"/>
                                        <div class="invalid-feedback">
                                            Please provide a valid factory name.
                                        </div>
                                    </div>
                                    <small class="text-muted">
                                        <i class="fas fa-info-circle me-1"></i>Factory name should be unique
                                    </small>
                                </div>
                            </div>

                        </div>

                        <!-- Form Actions -->
                        <div class="form-actions mt-4">
                            <a href="/admin/manufacturer" class="btn-secondary">
                                <i class="fas fa-arrow-left me-2"></i>Cancel
                            </a>
                            <button type="submit" class="btn-primary">
                                <i class="fas fa-save me-2"></i>Update Factory
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
    // Form validation
    (function () {
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')
        Array.prototype.slice.call(forms).forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }
                form.classList.add('was-validated')
            }, false)
        })
    })()
</script>
<script src="<c:url value='/resources/admin/js/scripts.js'/>"></script>
</body>
</html>
