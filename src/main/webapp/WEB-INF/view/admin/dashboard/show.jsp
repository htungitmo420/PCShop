<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - NHT-PCSHOP</title>

    <link href="<c:url value='/resources/admin/css/admin-layout.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/resources/admin/css/admin-user.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/resources/admin/css/product-show.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/resources/admin/css/product-form.css'/>" rel="stylesheet"/>
</head>
<body>
<div class="wrapper">
    <!-- Header -->
    <jsp:include page="../layout/header.jsp"/>

    <!-- Sidebar -->
    <jsp:include page="../layout/sidebar.jsp"/>

    <!-- Main Content -->
    <main id="main-content" class="main-content">
        <div class="container-fluid p-4">
            <h1 class="mb-1">Dashboard</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
            </nav>

            <!-- Dashboard Cards -->
            <div class="row g-4 mb-4">
                <div class="col-xl-3 col-md-6">
                    <div class="card dashboard-card card-primary">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 class="text-uppercase mb-1">Users</h6>
                                    <h2 class="mb-0">1,234</h2>
                                </div>
                                <i class="fas fa-users fa-3x opacity-50"></i>
                            </div>
                        </div>
                        <div class="card-footer">
                            <a href="/admin/user" class="text-white text-decoration-none">
                                View Details <i class="fas fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6">
                    <div class="card dashboard-card card-warning">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 class="text-uppercase mb-1">Products</h6>
                                    <h2 class="mb-0">567</h2>
                                </div>
                                <i class="fas fa-laptop fa-3x opacity-50"></i>
                            </div>
                        </div>
                        <div class="card-footer">
                            <a href="/admin/product" class="text-white text-decoration-none">
                                View Details <i class="fas fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6">
                    <div class="card dashboard-card card-success">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 class="text-uppercase mb-1">Orders</h6>
                                    <h2 class="mb-0">890</h2>
                                </div>
                                <i class="fas fa-shopping-cart fa-3x opacity-50"></i>
                            </div>
                        </div>
                        <div class="card-footer">
                            <a href="/admin/order" class="text-white text-decoration-none">
                                View Details <i class="fas fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6">
                    <div class="card dashboard-card card-danger">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 class="text-uppercase mb-1">Revenue</h6>
                                    <h2 class="mb-0">$12.5K</h2>
                                </div>
                                <i class="fas fa-dollar-sign fa-3x opacity-50"></i>
                            </div>
                        </div>
                        <div class="card-footer">
                            <a href="#" class="text-white text-decoration-none">
                                View Details <i class="fas fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Charts -->
            <div class="row g-4 mb-4">
                <div class="col-xl-6">
                    <div class="card chart-card">
                        <div class="card-header">
                            <i class="fas fa-chart-area me-2"></i>
                            Area Chart Example
                        </div>
                        <div class="card-body">
                            <canvas id="areaChart" height="200"></canvas>
                        </div>
                    </div>
                </div>

                <div class="col-xl-6">
                    <div class="card chart-card">
                        <div class="card-header">
                            <i class="fas fa-chart-bar me-2"></i>
                            Bar Chart Example
                        </div>
                        <div class="card-body">
                            <canvas id="barChart" height="200"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="../layout/footer.jsp"/>
    </main>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/js/scripts.js'/>"></script>
</body>
</html>
