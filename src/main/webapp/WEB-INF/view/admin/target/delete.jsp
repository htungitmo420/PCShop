<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Delete Audience - NHT-PCSHOP</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link href="<c:url value='/resources/admin/css/admin-layout.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/resources/admin/css/admin-delete.css'/>" rel="stylesheet"/>
</head>
<body>
<div class="app">
    <jsp:include page="../layout/header.jsp"/>
    <jsp:include page="../layout/sidebar.jsp"/>

    <div class="with-sidebar">
        <main id="main-content">
            <div class="container-fluid p-4">
                <!-- Page Header -->
                <div class="page-header delete-header">
                    <h1><i class="fas fa-user-times me-2"></i>Delete Audience</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="/admin"><i class="fas fa-home me-1"></i>Dashboard</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/admin/audience">Audience</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Delete #${id}</li>
                        </ol>
                    </nav>
                </div>

                <!-- Delete Confirmation Card -->
                <div class="delete-card">
                    <div class="delete-icon">
                        <i class="fas fa-exclamation-triangle"></i>
                    </div>

                    <div class="delete-header">
                        <h3>Delete Audience with ID ${id}</h3>
                        <p class="text-muted">This action cannot be undone</p>
                    </div>

                    <div class="alert-danger-custom">
                        <i class="fas fa-shield-alt me-2"></i>
                        <div>
                            <strong>Warning!</strong>
                            <p>You are going to permanently delete this user. Are you sure?</p>
                        </div>
                    </div>
                    <%--@elvariable id="newTarget" type="vn"--%>
                    <form:form method="post" action="/admin/audience/delete" modelAttribute="newTarget">
                        <form:hidden path="id"/>

                        <div class="delete-actions">
                            <a href="/admin/audience" class="btn-cancel">
                                <i class="fas fa-times me-2"></i>Cancel
                            </a>
                            <button type="submit" class="btn-delete">
                                <i class="fas fa-trash-alt me-2"></i>Confirm Delete
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
</body>
</html>