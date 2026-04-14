<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meta API Settings | UdanChoo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
    <style>
        body::before {
            content: "";
            background-image: url(${pageContext.request.contextPath}/resources/images/revamped/view_myprofile_bg.jpg);
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
        .helper-text  { font-size: 11px; color: #555; margin-top: 3px; }
        .section-label {
            font-size: 13px; font-weight: bold; color: #6082B6;
            margin: 18px 0 10px;
            border-left: 3px solid #6082B6;
            padding-left: 8px;
        }
        .token-wrapper { position: relative; }
        .token-toggle  {
            position: absolute; right: 8px; top: 50%;
            transform: translateY(-50%);
            cursor: pointer; color: #888; font-size: 13px;
        }
        .test-result { margin-top: 12px; padding: 10px 14px; border-radius: 4px; display: none; font-size: 12px; font-weight: 600; }
        .test-result.success { background: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .test-result.error   { background: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
    </style>
</head>
<body>
<div class="container">
    <div class="anc-wrapper bs">
        <h1 class="anc-heading"><i class="fa fa-cog" style="color:#6082B6"></i> Meta API Configuration</h1>
        <p style="color:#555; font-size:12px; margin-bottom:15px;">
            Configure your Facebook/Instagram Lead Ads API credentials. Settings are stored in the database.
        </p>

        <form:form action="${pageContext.request.contextPath}/campaign/central-config/save"
                   method="POST" modelAttribute="config">
            <form:hidden path="id"/>

            <div class="section-label"><i class="fab fa-facebook"></i> Meta API Credentials</div>

            <div class="anc-fir-li">
                <div class="anc-cn anc-com">
                    <label for="metaPageAccessToken" style="font-weight:600">Page Access Token *</label>
                    <div class="token-wrapper">
                        <form:input path="metaPageAccessToken" id="metaPageAccessToken"
                            class="contact" type="password"
                            placeholder="Enter your permanent Meta Page Access Token"/>
                        <span class="token-toggle" onclick="toggleToken()">
                            <i class="fa fa-eye" id="tokenEyeIcon"></i>
                        </span>
                    </div>
                    <p class="helper-text">Use a <strong>never-expiring permanent token</strong> from Meta Business Suite.</p>
                </div>

                <div class="anc-cn anc-com">
                    <label for="metaAppId" style="font-weight:600">App ID</label>
                    <form:input path="metaAppId" id="metaAppId" class="contact"
                        placeholder="e.g. 1234567890123456"/>
                </div>

                <div class="anc-cn anc-com">
                    <label for="metaAppSecret" style="font-weight:600">App Secret</label>
                    <form:input path="metaAppSecret" id="metaAppSecret" class="contact"
                        type="password" placeholder="Your Meta App Secret"/>
                </div>

                <div class="anc-cn anc-com">
                    <label for="metaGraphApiVersion" style="font-weight:600">Graph API Version</label>
                    <form:input path="metaGraphApiVersion" id="metaGraphApiVersion" class="contact"
                        placeholder="e.g. v19.0"/>
                    <p class="helper-text">Default: v19.0</p>
                </div>
            </div>

            <div class="anc-sec-li">
                <div class="anc-cn anc-com">
                    <label for="metaLeadFormId" style="font-weight:600">Default Lead Form ID</label>
                    <form:input path="metaLeadFormId" id="metaLeadFormId" class="contact"
                        placeholder="e.g. 1234567890123456"/>
                    <p class="helper-text">Used for connection testing. Campaign forms use their own Form IDs.</p>
                </div>

                <div class="anc-cn anc-com">
                    <label for="defaultLeadOwnerId" style="font-weight:600">Default Lead Owner (User ID)</label>
                    <form:input path="defaultLeadOwnerId" id="defaultLeadOwnerId" class="contact"
                        type="number" placeholder="e.g. 1"/>
                    <p class="helper-text">Auto-imported leads are assigned to this user ID.</p>
                </div>
            </div>

            <div id="testResult" class="test-result"></div>

            <div class="anc-btns">
                <input type="submit" value="Save Settings"
                       style="border:none;outline:none;background:#32cd32;color:white;">
                <button type="button"
                        onclick="testConnection()"
                        style="background:#6082B6;color:white;border:none;padding:6px 14px;
                               border-radius:3px;cursor:pointer;font-size:13px;">
                    <i class="fa fa-plug"></i> Test Connection
                </button>
                <a href="${pageContext.request.contextPath}/campaign/list">Back to List</a>
            </div>

        </form:form>
    </div>
</div>

<script>
function toggleToken() {
    var input = document.getElementById('metaPageAccessToken');
    var icon  = document.getElementById('tokenEyeIcon');
    if (input.type === 'password') {
        input.type = 'text';
        icon.className = 'fa fa-eye-slash';
    } else {
        input.type = 'password';
        icon.className = 'fa fa-eye';
    }
}

function testConnection() {
    var resultDiv = document.getElementById('testResult');
    resultDiv.style.display = 'block';
    resultDiv.className = 'test-result';
    resultDiv.innerHTML = '<i class="fa fa-spinner fa-spin"></i> Testing connection to Meta API...';

    $.ajax({
        url: '${pageContext.request.contextPath}/test_social_connection',
        method: 'GET',
        success: function(response) {
            if (response.success) {
                resultDiv.className = 'test-result success';
                resultDiv.innerHTML = '<i class="fa fa-check-circle"></i> <strong>Connected!</strong> '
                    + 'Form: <strong>' + response.formName + '</strong> | '
                    + 'Status: ' + response.formStatus + ' | '
                    + 'Form ID: ' + response.formId;
            } else {
                resultDiv.className = 'test-result error';
                resultDiv.innerHTML = '<i class="fa fa-times-circle"></i> ' + response.message;
            }
        },
        error: function() {
            resultDiv.className = 'test-result error';
            resultDiv.innerHTML = '<i class="fa fa-exclamation-triangle"></i> Test failed. Check server logs.';
        }
    });
}
</script>
</body>
</html>
