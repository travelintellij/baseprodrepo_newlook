<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage & Duplicate Itineraries</title>
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
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        h2.title-main {
            margin: 0;
            color: #1a202c;
            font-size: 28px;
            font-weight: 700;
        }

        .btn-create-custom {
            background: #3182ce;
            color: white;
            padding: 12px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s;
        }

        .btn-create-custom:hover {
            background: #2b6cb0;
            box-shadow: 0 4px 12px rgba(49,130,206,0.2);
        }

        .itinerary-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 25px;
        }

        .itinerary-card {
            background: white;
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05), 0 1px 3px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            display: flex;
            flex-direction: column;
            border: 1px solid transparent;
        }

        .itinerary-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 20px rgba(0,0,0,0.08);
            border-color: #cbd5e0;
        }

        .card-title {
            font-size: 20px;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 10px;
        }

        .card-meta {
            font-size: 13px;
            color: #718096;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .card-description {
            color: #4a5568;
            font-size: 14px;
            line-height: 1.5;
            margin-bottom: 25px;
            flex-grow: 1;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .card-actions {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }

        .btn-action-custom {
            padding: 10px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            transition: all 0.2s;
            border: 1px solid #e2e8f0;
            cursor: pointer;
            font-family: 'Inter', sans-serif;
        }

        .btn-view-custom {
            background: #fff;
            color: #3182ce;
            grid-column: span 2;
            margin-bottom: 5px;
            border-color: #3182ce;
        }

        .btn-view-custom:hover {
            background: #ebf8ff;
        }

        .btn-edit-custom {
            background: #f7fafc;
            color: #4a5568;
        }

        .btn-edit-custom:hover {
            background: #edf2f7;
            border-color: #cbd5e0;
        }

        .btn-duplicate-custom {
            background: #1a202c;
            color: white;
            border: none;
        }

        .btn-duplicate-custom:hover {
            background: #2d3748;
        }

        .empty-state {
            grid-column: 1 / -1;
            background: white;
            padding: 60px;
            text-align: center;
            border-radius: 16px;
            border: 2px dashed #cbd5e0;
            color: #718096;
        }

    </style>
</head>
<body>

<jsp:include page="menu/MenuBuilder.jsp" />

<div class="main-content">
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
        <c:if test="${not empty linkedQuotationId}">
            <div style="background: #ebf8ff; border: 1px solid #90cdf4; border-radius: 12px; padding: 20px; margin-bottom: 30px; display: flex; align-items: center; gap: 20px; box-shadow: 0 4px 6px rgba(49,130,206,0.05);">
                <div style="background: #3182ce; color: white; width: 50px; height: 50px; border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 24px;">
                    <i class="fas fa-file-invoice"></i>
                </div>
                <div>
                    <div style="font-size: 14px; color: #2b6cb0; font-weight: 600; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 4px;">Duplicating Itinerary for Quotation</div>
                    <div style="font-size: 18px; color: #1a202c; font-weight: 700;">${linkedQuotationName} <span style="color: #718096; font-weight: 400; font-size: 15px; margin-left: 10px;">(Quotation ID: ${linkedQuotationId})</span></div>
                </div>
            </div>
        </c:if>

        <div class="page-header">
            <h2 class="title-main">📋 Select Itinerary to Duplicate</h2>
            <a href="${pageContext.request.contextPath}/itinerary/create?leadId=${leadId}" class="btn-create-custom">
                <i class="fas fa-plus"></i> Create New
            </a>
        </div>

        <div class="itinerary-grid">
            <c:choose>
                <c:when test="${empty itineraryList}">
                    <div class="empty-state">
                        <i class="fas fa-folder-open"></i>
                        <p>No itineraries available for this lead yet.</p>
                        <a href="${pageContext.request.contextPath}/itinerary/create?leadId=${leadId}" style="color: #3182ce; font-weight: 600;">Create the first one here</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach var="it" items="${itineraryList}">
                        <div class="itinerary-card">
                            <c:if test="${not empty it.linkedQuotations}">
                                <div style="background: #ebf8ff; padding: 12px 15px; border-radius: 10px; border: 1px solid #bee3f8; margin-bottom: 20px; display: flex; flex-direction: column; gap: 4px; overflow-wrap: anywhere;">
                                    <span style="font-size: 9px; color: #2b6cb0; font-weight: 700; text-transform: uppercase; letter-spacing: 0.5px;">Linked Quotations</span>
                                    <div style="display: flex; flex-wrap: wrap; gap: 8px;">
                                        <c:forEach var="qtn" items="${it.linkedQuotations}">
                                            <span style="font-size: 13px; color: #1a202c; font-weight: 600; display: flex; align-items: center; gap: 4px; line-height: 1.3;">
                                                <i class="fas fa-file-invoice" style="color: #3182ce; font-size: 12px;"></i>
                                                ${qtn.name} <small style="color: #718096; font-weight: 400; font-size: 11px;">(#${qtn.id})</small>
                                            </span>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:if>
                            <div class="card-title">${it.title}</div>
                            <div class="card-meta">
                                <i class="far fa-calendar-alt"></i> ${it.totalDays} Days
                            </div>
                            <div class="card-description">
                                ${not empty it.description ? it.description : "No description provided."}
                            </div>
                            <div class="card-actions">
                                <a href="${pageContext.request.contextPath}/itinerary/preview/${it.id}?leadId=${leadId}&mode=duplicate&quotationId=${quotationId}" class="btn-action-custom btn-view-custom">
                                    <i class="fas fa-eye"></i> View Full Details
                                </a>

                                <a href="${pageContext.request.contextPath}/itinerary/edit/${it.id}?leadId=${leadId}" class="btn-action-custom btn-edit-custom">
                                    <i class="fas fa-edit"></i> Edit
                                </a>

                                <form action="${pageContext.request.contextPath}/itinerary/duplicate_itinerary_action" method="post" style="display:contents;">
                                    <input type="hidden" name="leadId" value="${leadId}" />
                                    <input type="hidden" name="itineraryId" value="${it.id}" />
                                    <input type="hidden" name="quotationId" value="${quotationId}" />
                                    <button type="submit" class="btn-action-custom btn-duplicate-custom">
                                        <i class="fas fa-copy"></i> Duplicate
                                    </button>
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>


</body>
</html>