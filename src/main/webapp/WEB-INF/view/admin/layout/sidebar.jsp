<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<nav id="sidebar" class="sidebar">
    <div class="sidebar-content">
        <ul class="list-unstyled components">
            <li class="sidebar-heading">
                <span class="heading-text">FEATURES</span>
            </li>

            <li class="active">
                <a href="/admin" data-tooltip="Dashboard">
                    <i class="fas fa-tachometer-alt"></i>
                    <span class="menu-text">Dashboard</span>
                </a>
            </li>

            <li>
                <a href="/admin/user" data-tooltip="Users">
                    <i class="fas fa-users"></i>
                    <span class="menu-text">User</span>
                </a>
            </li>

            <li>
                <a href="/admin/product" data-tooltip="Products">
                    <i class="fas fa-laptop"></i>
                    <span class="menu-text">Product</span>
                </a>
            </li>

            <li>
                <a href="/admin/order" data-tooltip="Orders">
                    <i class="fas fa-shopping-cart"></i>
                    <span class="menu-text">Order</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="sidebar-footer">
        <div class="small text-center">Logged in as:</div>
        <div class="fw-bold text-center">Hỏi Dân IT</div>
    </div>
</nav>

<!-- Overlay for mobile -->
<div id="sidebar-overlay" class="sidebar-overlay"></div>
