<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Link Existing Itinerary</title>
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
            text-align: center;
            margin-bottom: 40px;
        }

        h2.title-main {
            margin: 0;
            color: #1a202c;
            font-size: 32px;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }

        .itinerary-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 25px;
        }

        .itinerary-card {
            background: white;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05), 0 1px 3px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            display: flex;
            flex-direction: column;
            border: 1px solid transparent;
        }

        .itinerary-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.08);
            border-color: #48bb78;
        }

        .card-title {
            font-size: 22px;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 12px;
        }

        .card-meta {
            font-size: 14px;
            color: #718096;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .day-badge {
            background: #f0fff4;
            color: #38a169;
            padding: 4px 10px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 12px;
            border: 1px solid #c6f6d5;
        }

        .card-description {
            color: #4a5568;
            font-size: 15px;
            line-height: 1.6;
            margin-bottom: 30px;
            flex-grow: 1;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .card-actions {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .btn-action-custom {
            padding: 12px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: all 0.2s;
            cursor: pointer;
            font-family: 'Inter', sans-serif;
            border: 1px solid transparent;
        }

        .btn-view-custom {
            background: #fff;
            border-color: #3182ce;
            color: #3182ce;
        }

        .btn-view-custom:hover {
            background: #ebf8ff;
            box-shadow: 0 4px 10px rgba(49,130,206,0.15);
        }

        .btn-link-custom {
            background: #1a202c;
            color: white;
            border: none;
        }

        .btn-link-custom:hover {
            background: #2d3748;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            transform: scale(1.02);
        }

        .empty-state {
            grid-column: 1 / -1;
            background: white;
            padding: 80px;
            text-align: center;
            border-radius: 16px;
            border: 2px dashed #cbd5e0;
            color: #718096;
        }

        .empty-state i {
            font-size: 56px;
            margin-bottom: 25px;
            color: #cbd5e0;
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
        <c:if test="${not empty linkedQuotationId}">
            <div style="background: #fffaf0; border: 1px solid #fbd38d; border-radius: 12px; padding: 20px; margin-bottom: 40px; display: flex; align-items: center; gap: 20px; box-shadow: 0 4px 6px rgba(221,107,32,0.05);">
                <div style="background: #dd6b20; color: white; width: 50px; height: 50px; border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 24px;">
                    <i class="fas fa-file-invoice"></i>
                </div>
                <div>
                    <div style="font-size: 14px; color: #9c4221; font-weight: 600; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 4px;">Linking Itinerary for Quotation</div>
                    <div style="font-size: 18px; color: #1a202c; font-weight: 700;">${linkedQuotationName} <span style="color: #718096; font-weight: 400; font-size: 15px; margin-left: 10px;">(Quotation ID: ${linkedQuotationId})</span></div>
                </div>
            </div>
        </c:if>

        <div class="page-header">
            <h2 class="title-main"><i class="fas fa-link"></i> Link Existing Itinerary</h2>
            <p style="color: #718096; margin-top: 10px;">Select an itinerary to associate it with this lead.</p>
        </div>

        <div class="itinerary-grid">
            <c:choose>
                <c:when test="${empty itineraryList}">
                    <div class="empty-state">
                        <i class="fas fa-search"></i>
                        <p style="font-size: 18px; margin-bottom: 20px;">No itineraries available to link.</p>
                        <a href="${pageContext.request.contextPath}/itinerary/create?leadId=${leadId}" class="btn-action-custom btn-view-custom" style="width: 200px; margin: 0 auto;">
                            <i class="fas fa-plus"></i> Create New One
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach var="it" items="${itineraryList}">
                        <div class="itinerary-card">
                            <c:if test="${not empty it.linkedQuotations}">
                                <div style="background: #f0fff4; padding: 12px 15px; border-radius: 10px; border: 1px solid #c6f6d5; margin-bottom: 20px; display: flex; flex-direction: column; gap: 4px; overflow-wrap: anywhere;">
                                    <span style="font-size: 9px; color: #2f855a; font-weight: 700; text-transform: uppercase; letter-spacing: 0.5px;">Linked Quotations</span>
                                    <div style="display: flex; flex-wrap: wrap; gap: 8px;">
                                        <c:forEach var="qtn" items="${it.linkedQuotations}">
                                            <span style="font-size: 13px; color: #1a202c; font-weight: 600; display: flex; align-items: center; gap: 4px; line-height: 1.3;">
                                                <i class="fas fa-file-invoice" style="color: #38a169; font-size: 12px;"></i>
                                                ${qtn.name} <small style="color: #718096; font-weight: 400; font-size: 11px;">(#${qtn.id})</small>
                                            </span>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:if>
                            <div class="card-title">${it.title}</div>
                            <div class="card-meta">
                                <span class="day-badge"><i class="far fa-calendar-alt"></i> ${it.totalDays} Days</span>
                            </div>
                            <div class="card-description">
                                ${not empty it.description ? it.description : "This itinerary has no description provided."}
                            </div>
                            <div class="card-actions">
                                <a href="${pageContext.request.contextPath}/itinerary/preview/${it.id}?leadId=${leadId}&mode=link&quotationId=${quotationId}" class="btn-action-custom btn-view-custom">
                                    <i class="fas fa-eye"></i> View Full Details
                                </a>

                                <form action="${pageContext.request.contextPath}/itinerary/link_existing_itinerary_action" method="post" style="display:contents;">
                                    <input type="hidden" name="leadId" value="${leadId}" />
                                    <input type="hidden" name="itineraryId" value="${it.id}" />
                                    <input type="hidden" name="quotationId" value="${quotationId}" />
                                    <button type="submit" class="btn-action-custom btn-link-custom">
                                        <i class="fas fa-link"></i> Link to Lead
                                    </button>
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>

        <div style="text-align: center; margin-top: 30px;">
            <a href="javascript:history.back()" style="color: #718096; text-decoration: none; font-weight: 500;">
                <i class="fas fa-arrow-left"></i> Return to List
            </a>
        </div>
    </div>
</div>


</body>
</html>