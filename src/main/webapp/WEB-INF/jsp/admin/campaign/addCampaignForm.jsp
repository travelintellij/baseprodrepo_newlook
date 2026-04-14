<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Campaign Form | UdanChoo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
    <style>
        body::before {
            content: "";
            background-image: url(${pageContext.request.contextPath}/resources/images/revamped/add_new_client.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            background-attachment: fixed;
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            opacity: 0.45;
            z-index: -1;
        }
        .helper-text { font-size: 11px; color: #555; margin-top: 3px; }
    </style>
</head>
<body>
<div class="container">
    <div class="anc-wrapper bs">
        <h1 class="anc-heading"><i class="fa fa-plus-circle" style="color:#6082B6"></i> Add Campaign Form</h1>

        <form:form action="${pageContext.request.contextPath}/campaign/save" method="POST" modelAttribute="campaign">

            <div class="anc-fir-li">
                <div class="anc-cn anc-com">
                    <label for="formName" style="font-weight:600">Form Name *</label>
                    <form:input path="formName" id="formName" class="contact"
                        placeholder="e.g. Goa Summer Campaign Form" required="true"/>
                </div>

                <div class="anc-cn anc-com">
                    <label for="formType" style="font-weight:600">Platform *</label>
                    <form:select path="formType" id="formType" required="true">
                        <form:option value="">-- Select Platform --</form:option>
                        <form:option value="META">Meta (Facebook / Instagram)</form:option>
                        <form:option value="GOOGLE">Google Ads</form:option>
                    </form:select>
                </div>

                <div class="anc-cn anc-com">
                    <label for="formId" style="font-weight:600">Form ID *</label>
                    <form:input path="formId" id="formId" class="contact"
                        placeholder="e.g. 1234567890123456" required="true"/>
                    <p class="helper-text">The unique Lead Form ID from Meta Business Suite or Google Ads.</p>
                </div>

                <div class="anc-cn anc-com">
                    <label for="active" style="font-weight:600">Status</label>
                    <form:select path="active" id="active">
                        <form:option value="true">Active</form:option>
                        <form:option value="false">Inactive</form:option>
                    </form:select>
                </div>
            </div>

            <div class="anc-sec-li">
                <div class="anc-cn anc-com" style="width:100%">
                    <label for="campaignName" style="font-weight:600">Campaign Name</label>
                    <form:input path="campaignName" id="campaignName" class="contact"
                        placeholder="e.g. Goa Summer 2025"/>
                </div>
            </div>

            <div class="anc-third-li">
                <div class="anc-cn anc-com-ta" style="width:100%">
                    <label for="description" style="font-weight:600">Description</label><br>
                    <form:textarea path="description" id="description" rows="3" cols="80"
                        placeholder="Brief description of this campaign form..." maxlength="500"/>
                </div>
            </div>

            <div class="anc-btns">
                <input type="submit" value="Save Campaign Form" style="border:none;outline:none;background:#32cd32;color:white;">
                <a href="${pageContext.request.contextPath}/campaign/list">Back to List</a>
            </div>

        </form:form>
    </div>
</div>
</body>
</html>
