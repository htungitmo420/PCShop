<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<header class="topbar">
    <div class="container-fluid">
        <div class="brand">
            <button class="burger" id="btnSidebar"><i class="fa-solid fa-bars"></i></button>
            <a href="/admin">NHT-PCSHOP</a>
        </div>

        <div class="user-menu">
            <span class="text-muted d-none d-md-inline">Welcome,</span>
            <strong class="d-none d-md-inline">
                <c:out value="${sessionScope.currentUser != null ? sessionScope.currentUser.fullName : 'Guest'}"/>
            </strong>
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <span class="avatar"><i class="fa-solid fa-user"></i></span>
                </button>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item" href="/admin"><i class="fas fa-dashboard me-2"></i>Dashboard</a></li>
                    <li><a class="dropdown-item" href="/profile"><i class="fas fa-user-circle me-2"></i>Profile</a></li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li><a class="dropdown-item text-danger" href="/logout"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>
