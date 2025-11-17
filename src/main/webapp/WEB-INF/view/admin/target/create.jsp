<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Create Audience - NHT-PCSHOP</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
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
                        <h1><i class="fas fa-user-friends me-2"></i>Audience Management</h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-0 bg-transparent p-0">
                                <li class="breadcrumb-item">
                                    <a href="/admin"><i class="fas fa-home me-1"></i>Dashboard</a>
                                </li>
                                <li class="breadcrumb-item">
                                    <a href="/admin/audience">Audience</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Create</li>
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
                                <i class="fas fa-plus-circle"></i>
                            </span>
                        </div>
                        <div>
                            <h3 class="mb-1"><i class="fas fa-user-friends me-2"></i>Create New Audience</h3>
                            <p class="text-muted mb-0">Add a new audience to the system</p>
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

                    <%--@elvariable id="newTarget" type="vn.nhtw420.pcshop.domain.Target"--%>
                    <form:form method="post"
                               action="/admin/audience/create"
                               modelAttribute="newTarget"
                               class="needs-validation"
                               novalidate="novalidate">

                        <div class="row g-4">

                            <!-- Audience Name -->
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-label required">
                                        <i class="fas fa-user-pen me-2"></i>Audience Name
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <i class="fas fa-user-friends"></i>
                                        </span>
                                        <form:input path="name" type="text"
                                                    class="form-control"
                                                    placeholder="Enter audience name"
                                                    required="required"/>
                                        <div class="invalid-feedback">
                                            Please provide a valid audience name.
                                        </div>
                                    </div>
                                    <small class="text-muted">
                                        <i class="fas fa-info-circle me-1"></i>Audience name should be unique
                                    </small>
                                </div>
                            </div>

                        </div>

                        <!-- Form Actions -->
                        <div class="form-actions mt-4">
                            <a href="/admin/audience" class="btn-secondary">
                                <i class="fas fa-arrow-left me-2"></i>Cancel
                            </a>
                            <button type="submit" class="btn-primary">
                                <i class="fas fa-save me-2"></i>Create Audience
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
        let forms = document.querySelectorAll('.needs-validation');
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
