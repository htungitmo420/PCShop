<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <button type="button" id="sidebarToggle" class="btn btn-dark me-3">
            <i class="fas fa-bars"></i>
        </button>

        <span class="navbar-brand mb-0 h1">NHT-PCSHOP</span>

        <div class="ms-auto d-flex align-items-center">
            <span class="text-white me-3 d-none d-md-inline">Welcome, Nguyễn Hoàng Tùng</span>
            <div class="dropdown">
                <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
                   id="dropdownUser" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-user-circle fa-lg"></i>
                </a>
                <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="dropdownUser">
                    <li><a class="dropdown-item" href="#"><i class="fas fa-user me-2"></i>Profile</a></li>
                    <li><a class="dropdown-item" href="#"><i class="fas fa-cog me-2"></i>Settings</a></li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li><a class="dropdown-item" href="/logout"><i class="fas fa-sign-out-alt me-2"></i>Sign out</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
