<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>User Detail - NHT-PCSHOP</title>

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
                <!-- Page Header -->
                <div class="page-header detail-header">
                    <h1><i class="fas fa-user-circle me-2"></i>User Detail</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="/admin"><i class="fas fa-home me-1"></i>Dashboard</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/admin/user">Users</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Detail #${user.id}</li>
                        </ol>
                    </nav>
                </div>

                <!-- User Detail Card -->
                <div class="detail-card">
                    <div class="detail-header">
                        <div class="d-flex align-items-center gap-3">
                            <div class="user-avatar-large">
                                <c:choose>
                                    <c:when test="${not empty user.avatar}">
                                        <img src="<c:url value='/resources/admin/images/avatar/${user.avatar}'/>"
                                             alt="${avatar.fullName}"
                                             onerror="this.onerror=null; this.src='<c:url
                                                     value='/resources/images/no-image.png'/>'"/>
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fas fa-user"></i>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div>
                                <h3 class="mb-1">${user.fullName}</h3>
                                <p class="text-muted mb-0">
                                    <i class="fas fa-envelope me-2"></i>${user.email}
                                </p>
                            </div>
                        </div>
                        <div class="d-flex gap-2">
                            <a href="/admin/user/update/${user.id}" class="btn-edit">
                                <i class="fas fa-edit me-2"></i>Edit
                            </a>
                            <a href="/admin/user" class="btn-back">
                                <i class="fas fa-arrow-left me-2"></i>Back
                            </a>
                        </div>
                    </div>

                    <div class="detail-body">
                        <div class="row g-4">
                            <!-- Basic Information -->
                            <div class="col-12">
                                <div class="info-section">
                                    <h4 class="section-title">
                                        <i class="fas fa-info-circle me-2"></i>Basic Information
                                    </h4>
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <div class="info-item">
                                                <label><i class="fas fa-id-badge me-2"></i>User ID</label>
                                                <div class="info-value">${user.id}</div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="info-item">
                                                <label><i class="fas fa-user-tag me-2"></i>Role</label>
                                                <div class="info-value">
                                                    <c:choose>
                                                        <c:when test="${user.role.name == 'ADMIN'}">
                                                            <span class="badge-role badge-admin">
                                                                <i class="fas fa-crown"></i> ${user.role.name}
                                                            </span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge-role badge-user">
                                                                <i class="fas fa-user"></i> ${user.role.name}
                                                            </span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="info-item">
                                                <label><i class="fas fa-user me-2"></i>Full Name</label>
                                                <div class="info-value">${user.fullName}</div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="info-item">
                                                <label><i class="fas fa-envelope me-2"></i>Email</label>
                                                <div class="info-value">${user.email}</div>
                                            </div>
                                        </div>
                                        <c:if test="${not empty user.phoneNumber}">
                                            <div class="col-md-6">
                                                <div class="info-item">
                                                    <label><i class="fas fa-phone me-2"></i>Phone Number</label>
                                                    <div class="info-value">${user.phoneNumber}</div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>

                            <!-- Address Information -->
                            <c:if test="${not empty user.address}">
                                <div class="col-12">
                                    <div class="info-section">
                                        <h4 class="section-title">
                                            <i class="fas fa-map-marker-alt me-2"></i>Address
                                        </h4>
                                        <div class="info-item">
                                            <div class="info-value">${user.address}</div>
                                        </div>
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