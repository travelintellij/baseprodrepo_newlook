<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Preview Itinerary - ${itinerary.title}</title>
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

        .preview-container {
            max-width: 900px;
            margin: 0 auto;
            background: white;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        }

        .header {
            border-bottom: 2px solid #edf2f7;
            margin-bottom: 30px;
            padding-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        h2.preview-title {
            margin: 0;
            color: #1a202c;
            font-size: 28px;
            font-weight: 700;
        }

        .back-link {
            color: #3182ce;
            text-decoration: none;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .description-box {
            background: #f8fafc;
            padding: 20px;
            border-radius: 12px;
            border-left: 4px solid #3182ce;
            margin-bottom: 40px;
            font-size: 16px;
            line-height: 1.6;
            color: #4a5568;
        }

        .itinerary-day {
            margin-bottom: 30px;
            position: relative;
            padding-left: 60px;
        }

        .day-number-circle {
            position: absolute;
            left: 0;
            top: 0;
            width: 44px;
            height: 44px;
            background: #3182ce;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 18px;
            box-shadow: 0 4px 10px rgba(49,130,206,0.3);
        }

        .day-content {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            border: 1px solid #e2e8f0;
            transition: transform 0.2s;
        }

        .day-content:hover {
            transform: translateX(5px);
            border-color: #cbd5e0;
        }

        .day-title {
            font-weight: 700;
            font-size: 18px;
            color: #2d3748;
            margin-bottom: 10px;
        }

        .day-description {
            color: #718096;
            line-height: 1.5;
        }

        .actions {
            margin-top: 40px;
            display: flex;
            gap: 15px;
            justify-content: center;
        }

        .btn-preview {
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s;
            border: none;
            cursor: pointer;
            font-family: 'Inter', sans-serif;
        }

        .btn-edit-preview {
            background: #edf2f7;
            color: #4a5568;
        }

        .btn-edit-preview:hover {
            background: #e2e8f0;
        }

        .btn-primary-preview {
            background: #1a202c;
            color: white;
        }

        .btn-primary-preview:hover {
            background: #2d3748;
        }

        .btn-link-preview {
            background: #48bb78;
            color: white;
        }

        .btn-link-preview:hover {
            background: #38a169;
        }

        .empty-days {
            text-align: center;
            padding: 40px;
            color: #a0aec0;
            font-style: italic;
        }

    </style>
</head>
<body>

<jsp:include page="menu/MenuBuilder.jsp" />

<main class="main-content">
    <div class="preview-container">
        <!-- Navigation Header -->
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px; padding-bottom: 15px; border-bottom: 1px solid #e2e8f0;">
            <a href="javascript:history.back()" style="display: flex; align-items: center; gap: 8px; color: #4a5568; text-decoration: none; font-weight: 600; font-size: 14px; transition: color 0.2s;" onmouseover="this.style.color='#2d3748'" onmouseout="this.style.color='#4a5568'">
                <i class="fas fa-arrow-left"></i> Back
            </a>
            <div style="text-align: right;">
                <div style="font-size: 11px; color: #718096; font-weight: 700; text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 2px;">Lead Context</div>
                <div style="font-size: 15px; color: #1a202c; font-weight: 700;">
                    <i class="fas fa-user-circle" style="color: #3182ce; margin-right: 5px;"></i>
                    <c:choose>
                        <c:when test="${not empty leadName}">${leadName}</c:when>
                        <c:otherwise>Lead</c:otherwise>
                    </c:choose> 
                    <span style="color: #718096; font-weight: 400; font-size: 13px;">(ID: ${leadId})</span>
                </div>
            </div>
        </div>
        <c:if test="${not empty linkedQuotationId}">
            <div style="background: #ebf8ff; border: 1px solid #90cdf4; border-radius: 8px; padding: 15px; margin-bottom: 25px; display: flex; align-items: flex-start; gap: 15px; overflow-wrap: anywhere;">
                <div style="background: #3182ce; color: white; width: 40px; height: 40px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 20px; flex-shrink: 0;">
                    <i class="fas fa-file-invoice"></i>
                </div>
                <div style="flex: 1; min-width: 0;">
                    <div style="font-size: 11px; color: #2b6cb0; font-weight: 700; text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 2px;">Linked Quotation</div>
                    <div style="font-size: 15px; color: #1a202c; font-weight: 700; line-height: 1.4;">${linkedQuotationName} <span style="color: #718096; font-weight: 400; font-size: 13px;">(ID: ${linkedQuotationId})</span></div>
                </div>
            </div>
        </c:if>

        <div class="header">
            <h2 class="preview-title">${itinerary.title}</h2>
            <a href="javascript:history.back()" class="back-link">
                <i class="fas fa-arrow-left"></i> Back
            </a>
        </div>

        <div class="description-box">
            ${itinerary.description}
        </div>

        <c:choose>
            <c:when test="${not empty itinerary.days}">
                <c:forEach items="${itinerary.days}" var="day">
                    <div class="itinerary-day">
                        <div class="day-number-circle">${day.dayNumber}</div>
                        <div class="day-content">
                            <div class="day-title">${day.title}</div>
                            <div class="day-description">${day.description}</div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="empty-days">No days added to this itinerary yet.</div>
            </c:otherwise>
        </c:choose>

        <div class="actions">
            <%-- Only show Edit if not in link mode --%>
            <c:if test="${mode ne 'link'}">
                <a href="${pageContext.request.contextPath}/itinerary/edit/${itinerary.itineraryId}?leadId=${leadId}" class="btn-preview btn-edit-preview">
                    <i class="fas fa-edit"></i> Edit Itinerary
                </a>
            </c:if>

            <c:choose>
                <c:when test="${mode eq 'link'}">
                    <form action="${pageContext.request.contextPath}/itinerary/link_existing_itinerary_action" method="POST" style="display:inline;">
                        <input type="hidden" name="leadId" value="${leadId}" />
                        <input type="hidden" name="itineraryId" value="${itinerary.itineraryId}" />
                        <input type="hidden" name="quotationId" value="${quotationId}" />
                        <button type="submit" class="btn-preview btn-link-preview">
                            <i class="fas fa-link"></i> Link Itinerary Now
                        </button>
                    </form>
                </c:when>
                <c:otherwise>
                    <form action="${pageContext.request.contextPath}/itinerary/duplicate_itinerary_action" method="POST" style="display:inline;">
                        <input type="hidden" name="leadId" value="${leadId}" />
                        <input type="hidden" name="itineraryId" value="${itinerary.itineraryId}" />
                        <input type="hidden" name="quotationId" value="${quotationId}" />
                        <button type="submit" class="btn-preview btn-primary-preview">
                            <i class="fas fa-copy"></i> Duplicate Now
                        </button>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</main>


</body>
</html>
