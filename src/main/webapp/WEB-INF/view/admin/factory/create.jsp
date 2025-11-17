<!-- src/main/java/vn/nhtw420/pcshop/domain/factory/create.jsp -->
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Create Factory</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link href="<c:url value='/resources/admin/css/admin-layout.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/resources/admin/css/admin-form.css'/>" rel="stylesheet"/>
</head>
<body>
<div class="app">
    <jsp:include page="../layout/header.jsp"/>
    <jsp:include page="../layout/sidebar.jsp"/>

    <div class="with-sidebar">
        <main id="main-content">
            <div class="container-fluid p-4">

                <div class="page-header form-header mb-4">
                    <div>
                        <h1><i class="fas fa-industry me-2"></i>Factory Management</h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-0 bg-transparent p-0">
                                <li class="breadcrumb-item"><a href="/admin"><i
                                        class="fas fa-home me-1"></i>Dashboard</a></li>
                                <li class="breadcrumb-item"><a href="/admin/manufacturer">Factory</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Create</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <!-- Form Card -->
                <div class="form-card">
                    <div class="form-header d-flex align-items-center mb-3">
                        <div class="me-3">
                            <span class="bg-primary text-white rounded-circle d-inline-flex align-items-center justify-content-center"
                                  style="width:44px;height:44px;"><i class="fas fa-plus-circle"></i></span>
                        </div>
                        <div>
                            <h3 class="mb-0">Create New Factory</h3>
                            <p class="text-muted mb-0">Add a new manufacturer to the system</p>
                        </div>
                    </div>

                    <!-- Error Message -->
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="fas fa-exclamation-triangle me-2"></i>
                            <strong>Error!</strong> ${errorMessage}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <%--@elvariable id="newFactory" type="vn"--%>
                    <form:form modelAttribute="newFactory" method="post" class="row g-3">
                        <div class="col-12 col-md-8">
                            <label class="form-label required">Factory Name</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-building"></i></span>
                                <form:input path="name" class="form-control" placeholder="e.g. Apple, Samsung"
                                            required="required"/>
                            </div>
                        </div>

                        <div class="col-12 col-md-4 d-flex align-items-end">
                            <div class="w-100 d-flex justify-content-end gap-2">
                                <a href="/admin/manufacturer" class="btn-secondary btn">Cancel</a>
                                <button type="submit" class="btn-primary btn">
                                    <i class="fas fa-check me-2"></i>Create Factory
                                </button>
                            </div>
                        </div>
                    </form:form>
                </div>

            </div>
            <jsp:include page="../layout/footer.jsp"/>
        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/admin/js/scripts.js'/>"></script>
</body>
</html>
