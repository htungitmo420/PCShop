<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<link rel="stylesheet" href="<c:url value='/webjars/bootstrap/5.3.3/css/bootstrap.min.css'/>"/>
<script src="<c:url value='/webjars/bootstrap/5.3.3/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/webjars/jquery/3.7.1/jquery.min.js'/>"></script>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Create a User</title>
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 col-12 mx-auto">
                <h3>Create a User</h3>
                <hr />
                <%--@elvariable id="newUser" type="vn"--%>
                <form:form method="post" action="/admin/user/create1" modelAttribute="newUser">
                    <div class="mb-3">
                        <label class="form-label">Email address</label>
                        <form:input type="email" class="form-control" aria-describedby="emailHelp" path="Email"/>
                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <form:input type="password" class="form-control" path="Password"/>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Phone Number</label>
                        <form:input type="tel" class="form-control" path="PhoneNumber"/>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <form:input type="text" class="form-control" path="FullName"/>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Address</label>
                        <form:input type="text" class="form-control" path="Address"/>
                    </div>
                    <button type="submit" class="btn btn-primary">Create!</button>
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>