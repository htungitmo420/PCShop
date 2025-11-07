<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<link rel="stylesheet" href="<c:url value='/webjars/bootstrap/5.3.3/css/bootstrap.min.css'/>"/>
<script src="<c:url value='/webjars/bootstrap/5.3.3/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/webjars/jquery/3.7.1/jquery.min.js'/>"></script>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Table User</title>
</head>
<body>
<div class="container my-5">
    <div class="row">
        <div class="col-12 mx-auto">
            <div class="d-flex justify-content-between">
                <h3>Table Users</h3>
                <a href="/admin/user/create" class="btn btn-primary">Create a User!</a>
            </div>

            <hr/>
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Full Name</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <th>${user.id}</th>
                        <td>${user.email}</td>
                        <td>${user.fullName}</td>
                        <td>
                            <a href="/admin/user/${user.id}" class="btn btn-success">View</a>
                            <a href="/admin/user/update/${user.id}" class="btn btn-warning mx-2">Update</a>
                            <a href="/admin/user/delete/${user.id}" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>