<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Audience Management - NHT-PCSHOP</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link href="<c:url value='/resources/admin/css/admin-layout.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/resources/admin/css/admin-user.css'/>" rel="stylesheet"/>
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
                    <h1><i class="fas fa-user-friends me-2"></i>Audience Management</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/admin"><i class="fas fa-home me-1"></i>Dashboard</a>
                            </li>
                            <li class="breadcrumb-item active">Audiences</li>
                        </ol>
                    </nav>
                </div>

                <!-- Stats -->
                <div class="row mb-4">
                    <div class="col-md-4">
                        <div class="stats-card">
                            <div class="stats-icon"><i class="fas fa-user-friends"></i></div>
                            <div class="stats-content">
                                <h4>${targets.size()}</h4>
                                <p>Total Audiences</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Factory List -->
                <div class="card-container">
                    <div class="card-header-custom">
                        <h3><i class="fas fa-table"></i> Audience List</h3>
                        <a href="/admin/audience/create" class="btn-create">
                            <i class="fas fa-plus-circle me-1"></i>Create New Audience
                        </a>
                    </div>
                    <c:choose>
                        <c:when test="${empty targets}">
                            <div class="empty-state-modern">
                                <i class="fas fa-user-friends fa-4x"></i>
                                <h3>No Audience Found</h3>
                                <p>Start by adding your first audience</p>
                            </div>
                        </c:when>

                        <c:otherwise>
                            <table class="table table-hover align-middle">
                                <thead>
                                <tr>
                                    <th style="width: 8%;">ID</th>
                                    <th style="width: 62%;">AUDIENCE NAME</th>
                                    <th style="width: 30%;">ACTIONS</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="t" items="${targets}">
                                    <tr>
                                        <td>${t.id}</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <i class="fas text-primary"></i>
                                                <strong>${t.name}</strong>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="action-buttons">
                                                <a href="/admin/audience/update/${t.id}"
                                                   class="btn-action btn-edit">
                                                    <i class="fas fa-edit"></i> Edit
                                                </a>
                                                <a href="/admin/audience/delete/${t.id}"
                                                   class="btn-action btn-delete">
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/admin/js/scripts.js'/>"></script>
</body>
</html>
