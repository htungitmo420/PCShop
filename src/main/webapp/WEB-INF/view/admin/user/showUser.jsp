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
    <title>User Detail</title>
</head>
<body>
<div class="container my-5">
    <div class="row">
        <div class="col-12 mx-auto">
            <div class="d-flex justify-content-between">
                <h3>Table Users ID: ${id}</h3>
            </div>
            <div>
                <hr/>
                <div class="card" style="width: 60%;">
                    <div class="card-header">
                        User Information
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">ID: ${user.id}</li>
                        <li class="list-group-item">Email: ${user.email}</li>
                        <li class="list-group-item">Full Name: ${user.fullName}</li>
                        <li class="list-group-item">Address: ${user.address}</li>
                    </ul>
                </div>
                <a href="/admin/user" class="btn btn-success mt-3">Back</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>