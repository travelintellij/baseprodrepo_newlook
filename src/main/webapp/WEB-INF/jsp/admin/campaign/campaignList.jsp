<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Campaign Management | UdanChoo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
    <style>
        body::before {
            content: "";
            background-image: url(${pageContext.request.contextPath}/resources/images/revamped/capture_lead_bg.jpg);
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
        .sync-result { margin-top: 8px; padding: 6px 12px; border-radius: 4px; display: none; font-size: 12px; font-weight: 600; }
        .sync-result.success { background: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .sync-result.error   { background: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
        .badge-active   { background: #d4edda; color: #155724; padding: 2px 8px; border-radius: 10px; font-size: 11px; font-weight: 600; }
        .badge-inactive { background: #f8d7da; color: #721c24; padding: 2px 8px; border-radius: 10px; font-size: 11px; font-weight: 600; }
        .camp-action-btn { background: #32cd32; color: white; border: none; padding: 4px 12px; border-radius: 3px; font-size: 12px; cursor: pointer; }
        .camp-action-btn:hover { background: #28a745; }
        .camp-delete-btn { background: #dc3545; color: white; padding: 4px 12px; border-radius: 3px; font-size: 12px; text-decoration: none; }
        .camp-delete-btn:hover { background: #c82333; color: white; }
        .camp-header-btns a { margin-left: 8px; }
    </style>
</head>
<body>
<div class="container">
    <div class="manage-client-wrapper bs">
        <div style="display:flex; justify-content:space-between; align-items:center;">
            <h1 class="search-clients"><i class="fa fa-bullhorn" style="color:#6082B6"></i> Campaign Management</h1>
            <div class="camp-header-btns">
                <a href="${pageContext.request.contextPath}/campaign/add"
                   style="background:#6082B6;color:white;padding:6px 14px;border-radius:3px;font-size:13px;text-decoration:none;">
                    <i class="fa fa-plus"></i> Add Campaign Form
                </a>
                <a href="${pageContext.request.contextPath}/campaign/central-config"
                   style="background:#FABA08;color:black;padding:6px 14px;border-radius:3px;font-size:13px;text-decoration:none;">
                    <i class="fa fa-cog"></i> Meta API Settings
                </a>
            </div>
        </div>

        <font color="green"> ${Success} </font>
        <font color="red"> ${Error}</font>
    </div>

    <div class="search-clients-sec bs">
        <table class="sc-table">
            <thead style="background:#6082B6;">
                <tr style="height:50px; color:black;">
                    <th class="sc-th" style="width:50px;">#</th>
                    <th class="sc-th">Form Name</th>
                    <th class="sc-th">Campaign Name</th>
                    <th class="sc-th" style="width:100px;">Type</th>
                    <th class="sc-th">Form ID</th>
                    <th class="sc-th" style="width:90px;">Status</th>
                    <th class="sc-th" style="width:220px;">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${empty campaigns}">
                        <tr>
                            <td colspan="7" style="text-align:center; color:#888; padding:30px;
                                border-bottom:2px solid black; border-right:2px solid black; border-left:2px solid black;">
                                No campaign forms added yet.
                                <a href="${pageContext.request.contextPath}/campaign/add">Add one now</a>.
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="c" items="${campaigns}" varStatus="status">
                            <tr>
                                <td style="border-bottom:2px solid black;border-right:2px solid black;border-left:2px solid black">
                                    ${status.index + 1}
                                </td>
                                <td style="border-bottom:2px solid black;border-right:2px solid black;">
                                    <strong>${c.formName}</strong>
                                </td>
                                <td style="border-bottom:2px solid black;border-right:2px solid black;">
                                    ${c.campaignName}
                                </td>
                                <td style="border-bottom:2px solid black;border-right:2px solid black;">
                                    <c:choose>
                                        <c:when test="${c.formType == 'META'}">
                                            <i class="fab fa-facebook" style="color:#1877F2"></i> Meta
                                        </c:when>
                                        <c:otherwise>${c.formType}</c:otherwise>
                                    </c:choose>
                                </td>
                                <td style="border-bottom:2px solid black;border-right:2px solid black;">
                                    <small style="color:#555; word-break:break-all;">${c.formId}</small>
                                </td>
                                <td style="border-bottom:2px solid black;border-right:2px solid black;">
                                    <c:choose>
                                        <c:when test="${c.active}"><span class="badge-active">Active</span></c:when>
                                        <c:otherwise><span class="badge-inactive">Inactive</span></c:otherwise>
                                    </c:choose>
                                </td>
                                <td style="border-bottom:2px solid black;border-right:2px solid black;">
                                    <button class="camp-action-btn" onclick="syncLeads(${c.campaignFormId}, this)">
                                        <i class="fa fa-sync"></i> Sync Leads
                                    </button>
                                    &nbsp;
                                    <a href="${pageContext.request.contextPath}/campaign/delete/${c.campaignFormId}"
                                       class="camp-delete-btn"
                                       onclick="return confirm('Are you sure you want to delete this campaign form?')">
                                        <i class="fa fa-trash"></i> Delete
                                    </a>
                                    <div id="result-${c.campaignFormId}" class="sync-result"></div>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</div>

<script>
function syncLeads(campaignFormId, btn) {
    var resultDiv = document.getElementById('result-' + campaignFormId);
    resultDiv.style.display = 'none';
    btn.disabled = true;
    btn.innerHTML = '<i class="fa fa-spinner fa-spin"></i> Syncing...';

    $.ajax({
        url: '${pageContext.request.contextPath}/sync_social_leads',
        method: 'GET',
        data: { campaignFormId: campaignFormId },
        success: function(response) {
            resultDiv.style.display = 'block';
            if (response.success) {
                resultDiv.className = 'sync-result success';
                resultDiv.innerHTML = '<i class="fa fa-check-circle"></i> ' + response.message
                    + (response.newLeadsImported > 0 ? ' | Total: ' + response.totalImported : '');
            } else {
                resultDiv.className = 'sync-result error';
                resultDiv.innerHTML = '<i class="fa fa-exclamation-circle"></i> ' + response.message;
            }
        },
        error: function() {
            resultDiv.style.display = 'block';
            resultDiv.className = 'sync-result error';
            resultDiv.innerHTML = '<i class="fa fa-exclamation-triangle"></i> Request failed. Check server logs.';
        },
        complete: function() {
            btn.disabled = false;
            btn.innerHTML = '<i class="fa fa-sync"></i> Sync Leads';
        }
    });
}
</script>
</body>
</html>
