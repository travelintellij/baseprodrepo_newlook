<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Itinerary List</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">

    <style>
        body {
            background: linear-gradient(135deg, #f0f4f8, #e2e8f0);
            font-family: 'Inter', sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .main-content {
            margin-top: 120px;
            padding: 40px 20px;
            min-height: 80vh;
        }

        .container-custom {
            max-width: 1000px;
            margin: 0 auto;
            background: white;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05), 0 1px 3px rgba(0,0,0,0.1);
        }

        h2.title-main {
            color: #1a202c;
            font-size: 28px;
            margin-top: 0;
            margin-bottom: 25px;
            font-weight: 700;
        }

        .header-action {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            border-bottom: 2px solid #edf2f7;
            padding-bottom: 20px;
        }

        .btn-create-custom {
            background: #3182ce;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            font-size: 15px;
            text-decoration: none;
            transition: all 0.2s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-create-custom:hover {
            background: #2b6cb0;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(49, 130, 206, 0.2);
        }

        table.custom-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .custom-table th, .custom-table td {
            padding: 16px;
            text-align: left;
            border-bottom: 1px solid #edf2f7;
        }

        .custom-table th {
            background: #f8fafc;
            color: #4a5568;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 13px;
            letter-spacing: 0.05em;
        }

        .custom-table tr:hover {
            background: #f7fafc;
        }

        .custom-table td {
            color: #2d3748;
            font-size: 15px;
        }

        .btn-action-small {
            padding: 6px 12px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            transition: all 0.2s;
            border: 1px solid #e2e8f0;
            color: #4a5568;
            background: white;
        }

        .btn-action-small:hover {
            background: #f7fafc;
            border-color: #cbd5e0;
        }

        .btn-view-small {
            color: #3182ce;
            border-color: #3182ce;
        }

        .btn-view-small:hover {
            background: #ebf8ff;
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #718096;
            font-size: 16px;
            background: #f8fafc;
            border-radius: 12px;
            border: 1px dashed #cbd5e0;
        }

    </style>
</head>
<body>

<jsp:include page="menu/MenuBuilder.jsp" />

<main class="main-content">
    <div class="container-custom">
        <!-- Navigation Header -->
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px; padding-bottom: 15px; border-bottom: 1px solid #e2e8f0;">
            <a href="javascript:history.back()" style="display: flex; align-items: center; gap: 8px; color: #4a5568; text-decoration: none; font-weight: 600; font-size: 14px; transition: color 0.2s;" onmouseover="this.style.color='#2d3748'" onmouseout="this.style.color='#4a5568'">
                <i class="fas fa-arrow-left"></i> Back
            </a>
            <div style="text-align: right;">
                <div style="font-size: 11px; color: #718096; font-weight: 700; text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 2px;">Lead Context</div>
                <div style="font-size: 15px; color: #1a202c; font-weight: 700;">
                    <i class="fas fa-user-circle" style="color: #3182ce; margin-right: 5px;"></i>
                    ${leadName} <span style="color: #718096; font-weight: 400; font-size: 13px;">(ID: ${leadId})</span>
                </div>
            </div>
        </div>
        <div class="header-action">
            <h2 class="title-main">🗺️ All Itineraries</h2>
            <a href="${pageContext.request.contextPath}/itinerary/create?leadId=${leadId}" class="btn-create-custom">
                <i class="fas fa-plus"></i> Create New
            </a>
        </div>

        <c:choose>
            <c:when test="${empty itineraryList}">
                <div class="empty-state">
                    <i class="fas fa-folder-open fa-3x" style="margin-bottom: 15px; opacity: 0.3;"></i>
                    <p>No itineraries found for this lead. Click "Create New" to get started!</p>
                </div>
            </c:when>
            <c:otherwise>
                <table class="custom-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th style="text-align: right;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="it" items="${itineraryList}">
                            <tr>
                                <td style="font-weight:600; color:#3182ce;">#${it.id}</td>
                                <td style="font-weight:500;">
                                    <div>${it.title}</div>
                                    <c:if test="${not empty it.linkedQuotations}">
                                        <div style="margin-top: 8px; display: flex; flex-wrap: wrap; gap: 5px;">
                                            <c:forEach var="qtn" items="${it.linkedQuotations}">
                                                <span title="Linked Quotation" style="background: #ebf8ff; color: #2b6cb0; font-size: 11px; padding: 2px 8px; border-radius: 4px; border: 1px solid #bee3f8; font-weight: 600;">
                                                    <i class="fas fa-file-invoice" style="font-size: 10px; margin-right: 3px;"></i>
                                                    ${qtn.name} (#${qtn.id})
                                                </span>
                                            </c:forEach>
                                        </div>
                                    </c:if>
                                </td>
                                <td style="color:#718096; max-width: 300px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                    ${it.description}
                                </td>
                                <td style="text-align: right; display: flex; gap: 8px; justify-content: flex-end;">
                                    <a href="${pageContext.request.contextPath}/itinerary/preview/${it.id}?leadId=${leadId}" class="btn-action-small btn-view-small">
                                        <i class="fas fa-eye"></i> View
                                    </a>
                                    <a href="${pageContext.request.contextPath}/itinerary/edit/${it.id}?leadId=${leadId}" class="btn-action-small">
                                        <i class="fas fa-edit"></i> Edit
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</div>


</body>
</html>