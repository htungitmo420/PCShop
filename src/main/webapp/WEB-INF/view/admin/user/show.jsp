<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>User Management - NHT-PCSHOP</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link href="<c:url value='/resources/admin/css/admin-layout.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/resources/admin/css/admin-user.css'/>" rel="stylesheet"/>
</head>
<body>
<div class="app">
    <jsp:include page="../layout/header.jsp"/>
    <jsp:include page="../layout/sidebar.jsp"/>

    <div class="with-sidebar">
        <main id="main-content">
            <div class="container-fluid p-4">
                <div class="page-header">
                    <h1><i class="fas fa-users-cog me-2"></i>User Management</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="/admin"><i class="fas fa-home me-1"></i>Dashboard</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Users</li>
                        </ol>
                    </nav>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="stats-card">
                            <div class="stats-icon">
                                <i class="fas fa-users"></i>
                            </div>
                            <div class="stats-content">
                                <h4>${users.size()}</h4>
                                <p>Total Users</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-container">
                    <div class="card-header-custom">
                        <h3><i class="fas fa-table"></i> User List</h3>
                        <a href="/admin/user/create" class="btn-create">
                            <i class="fas fa-plus-circle me-2"></i>Create New User
                        </a>
                    </div>

                    <c:choose>
                        <c:when test="${empty users}">
                            <div class="empty-state">
                                <i class="fas fa-users-slash"></i>
                                <h3>No Users Found</h3>
                                <p>Start by creating your first user</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="table-wrapper">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th><i class="fas fa-hashtag me-2"></i>ID</th>
                                        <th><i class="fas fa-envelope me-2"></i>Email</th>
                                        <th><i class="fas fa-user me-2"></i>Full Name</th>
                                        <th><i class="fas fa-user-tag me-2"></i>Role</th>
                                        <th><i class="fas fa-cogs me-2"></i>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="user" items="${users}">
                                        <tr>
                                            <th>${user.id}</th>
                                            <td>${user.email}</td>
                                            <td><strong>${user.fullName}</strong></td>
                                            <td>
                                                <span class="badge-role ${user.role.name == 'ADMIN' ? 'badge-admin' : 'badge-user'}">
                                                    <i class="fas ${user.role.name == 'ADMIN' ? 'fa-crown' : 'fa-user'} me-1"></i>
                                                    ${user.role.name}
                                                </span>
                                            </td>
                                            <td>
                                                <div class="action-buttons">
                                                    <a href="/admin/user/${user.id}" class="btn-action btn-view">
                                                        <i class="fas fa-eye"></i> View
                                                    </a>
                                                    <a href="/admin/user/update/${user.id}" class="btn-action btn-edit">
                                                        <i class="fas fa-edit"></i> Edit
                                                    </a>
                                                    <a href="/admin/user/delete/${user.id}"
                                                       class="btn-action btn-delete">
                                                        <i class="fas fa-trash"></i> Delete
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
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
