<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User - NHT-PCSHOP</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Custom CSS -->
    <link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet">
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
            <h1 class="mb-1">Users</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Users</li>
                </ol>
            </nav>

            <!-- Page content: replace with real user table/list -->
            <div class="mt-5">
                <div class="row">
                    <div class="col-md-6 col-12 mx-auto">
                        <h3>Create a User</h3>
                        <hr/>
                        <%--@elvariable id="newUser" type="vn"--%>
                        <form:form method="post" action="/admin/user/create" modelAttribute="newUser">
                            <div class="mb-3">
                                <label class="form-label">Email address</label>
                                <form:input type="email" class="form-control" aria-describedby="emailHelp"
                                            path="email"/>
                                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <form:input type="password" class="form-control" path="password"/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Phone Number</label>
                                <form:input type="tel" class="form-control" path="phoneNumber"/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <form:input type="text" class="form-control" path="fullName"/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Address</label>
                                <form:input type="text" class="form-control" path="address"/>
                            </div>
                            <button type="submit" class="btn btn-primary">Create!</button>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <div class="site-footer">
            <jsp:include page="../layout/footer.jsp"/>
        </div>
    </main>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/js/scripts.js'/>"></script>
</body>
</html>
