<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>User - NHT-PCSHOP</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet"/>
</head>
<body>
<div class="wrapper">
    <jsp:include page="../layout/header.jsp"/>
    <jsp:include page="../layout/sidebar.jsp"/>

    <main id="main-content" class="main-content">
        <div class="container-fluid p-4">
            <h1 class="mb-1">Users</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Users</li>
                </ol>
            </nav>

            <div class="container mt-5">
                <div class="row">
                    <div class="col-12 mx-auto">
                        <div class="d-flex justify-content-between">
                            <h3>Delete User with ID ${id}</h3>
                        </div>

                        <hr/>
                        <div class="alert alert-danger">
                            You are going to delete this user. Are you sure?
                        </div>
                        <%--@elvariable id="newUser" type="vn"--%>
                        <form:form method="post" modelAttribute="newUser" action="/admin/user/delete">
                            <div class="mb-3" style="display: none">
                                <label class="form-label">ID:</label>
                                <form:hidden path="id"/>
                            </div>
                            <button type="submit" class="btn btn-danger">Confirm!</button>
                            <a class="btn btn-success" href="<c:url value='/admin/user'/>">Cancel</a>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>

        <div class="site-footer">
            <jsp:include page="../layout/footer.jsp"/>
        </div>
    </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/js/scripts.js'/>"></script>
</body>
</html>
