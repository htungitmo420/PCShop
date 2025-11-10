<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="uri" value="${pageContext.request.requestURI}"/>
<aside class="sidebar">
    <div class="nav-title">Management</div>

    <a class="nav-link ${fn:contains(uri, '/admin/user') ? 'active' : ''}" href="/admin/user">
        <i class="fa-solid fa-users"></i> <span>Users</span>
    </a>
    <a class="nav-link ${fn:contains(uri, '/admin/product') ? 'active' : ''}" href="/admin/product">
        <i class="fa-solid fa-box"></i> <span>Products</span>
    </a>
    <a class="nav-link ${fn:contains(uri, '/admin/order') ? 'active' : ''}" href="/admin/order">
        <i class="fa-solid fa-receipt"></i> <span>Orders</span>
    </a>

    <div class="nav-title" style="margin-top:1rem;">Shortcuts</div>
    <a class="nav-link" href="/admin/settings"><i class="fa-solid fa-gear"></i> Settings</a>
    <a class="nav-link" href="/"><i class="fa-solid fa-arrow-left"></i> Back to site</a>
</aside>
