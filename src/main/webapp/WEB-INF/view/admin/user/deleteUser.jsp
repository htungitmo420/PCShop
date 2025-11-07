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
    <title>Delete User</title>
</head>
<body>
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
</body>
</html>