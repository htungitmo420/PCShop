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
    <title>Update User</title>
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 col-12 mx-auto">
            <h3>Update User</h3>
            <hr/>
            <%--@elvariable id="newUser" type="vn"--%>
            <form:form method="post" action="/admin/user/update" modelAttribute="newUser">
                <div class="mb-3" style="display: none">
                    <label class="form-label">ID:</label>
                    <form:hidden path="id"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Email address</label>
                    <form:input type="email" class="form-control" aria-describedby="emailHelp" path="email"
                                readonly="true"/>
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
                <button type="submit" class="btn btn-warning">Update!</button>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>