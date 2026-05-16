<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>
        <c:choose>
            <c:when test="${not empty itinerary.id}">Edit Itinerary</c:when>
            <c:otherwise>Create Itinerary</c:otherwise>
        </c:choose>
    </title>
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
            width: 100%;
            display: block; /* Override global flex if necessary */
        }

        .container-custom {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05), 0 1px 3px rgba(0,0,0,0.1);
        }

        h2.title-main {
            text-align: center;
            color: #1a202c;
            font-size: 28px;
            margin-top: 0;
            margin-bottom: 30px;
            font-weight: 700;
        }

        label.custom-label {
            font-weight: 600;
            color: #4a5568;
            display: inline-block;
            margin-bottom: 8px;
        }

        .custom-input, .custom-textarea {
            width: 100%;
            padding: 12px 16px;
            margin-bottom: 20px;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
            background: #f8fafc;
            font-family: 'Inter', sans-serif;
            font-size: 15px;
            transition: all 0.2s ease;
            box-sizing: border-box;
        }

        .custom-input:focus, .custom-textarea:focus {
            outline: none;
            border-color: #3182ce;
            box-shadow: 0 0 0 3px rgba(49,130,206,0.1);
            background: white;
        }

        .btn-add-day {
            background: #ebf8ff;
            color: #3182ce;
            padding: 12px 20px;
            border: 2px dashed #63b3ed;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            font-size: 15px;
            transition: all 0.2s;
            width: 100%;
            margin-top: 10px;
            font-family: 'Inter', sans-serif;
        }

        .btn-add-day:hover {
            background: #bee3f8;
            border-color: #3182ce;
        }

        .btn-submit-custom {
            background: #1a202c;
            color: white;
            padding: 14px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            font-size: 16px;
            width: 100%;
            margin-top: 30px;
            transition: all 0.2s;
            font-family: 'Inter', sans-serif;
        }

        .btn-submit-custom:hover {
            background: #2d3748;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .day-card {
            border: 1px solid #e2e8f0;
            padding: 24px;
            margin-bottom: 20px;
            border-radius: 12px;
            background: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.02);
            transition: border-color 0.2s;
            position: relative;
        }

        .day-card h4 {
            margin-top: 0;
            margin-bottom: 15px;
            color: #2b6cb0;
            font-size: 18px;
            border-bottom: 1px solid #edf2f7;
            padding-bottom: 10px;
        }

        .section-title {
            color: #2d3748;
            margin-top: 30px;
            border-bottom: 2px solid #edf2f7;
            padding-bottom: 10px;
            font-size: 20px;
        }

        .btn-remove-day {
            position: absolute;
            top: 12px;
            right: 12px;
            background: #fff5f5;
            color: #e53e3e;
            border: 1px solid #feb2b2;
            border-radius: 6px;
            padding: 4px 10px;
            cursor: pointer;
            font-weight: 600;
            font-size: 13px;
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
            <div style="background: #f0fff4; border: 1px solid #9ae6b4; border-radius: 8px; padding: 15px; margin-bottom: 25px; display: flex; align-items: flex-start; gap: 15px; overflow-wrap: anywhere;">
                <div style="background: #38a169; color: white; width: 40px; height: 40px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 20px; flex-shrink: 0;">
                    <i class="fas fa-file-invoice"></i>
                </div>
                <div style="flex: 1; min-width: 0;">
                    <div style="font-size: 11px; color: #2f855a; font-weight: 700; text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 2px;">Linked Quotation</div>
                    <div style="font-size: 15px; color: #1a202c; font-weight: 700; line-height: 1.4;">${linkedQuotationName} <span style="color: #718096; font-weight: 400; font-size: 13px;">(ID: ${linkedQuotationId})</span></div>
                </div>
            </div>
        </c:if>

        <h2 class="title-main">
            <c:choose>
                <c:when test="${not empty itinerary.id}">✏️ Edit Itinerary</c:when>
                <c:otherwise>➕ Create Itinerary</c:otherwise>
            </c:choose>
        </h2>

        <form id="itineraryForm" action="${pageContext.request.contextPath}/itinerary/save" method="post">
            <input type="hidden" name="leadId" value="${leadId}" />
            <input type="hidden" name="quotationId" value="${quotationId}" />
            <c:if test="${not empty itinerary.itineraryId}">
                <input type="hidden" name="itineraryId" value="${itinerary.itineraryId}" />
            </c:if>

            <label class="custom-label">Itinerary Title</label>
            <input type="text" name="title" value="${itinerary.title}" class="custom-input" required placeholder="e.g. 5 Days in Switzerland" />

            <label class="custom-label">Description</label>
            <textarea name="description" rows="4" class="custom-textarea" placeholder="Briefly describe the overall trip...">${itinerary.description}</textarea>

            <h3 class="section-title">Daily Schedule</h3>
            <div id="dayContainer">
                <c:if test="${not empty itinerary.days}">
                    <c:forEach var="day" items="${itinerary.days}" varStatus="status">
                        <div class="day-card" data-day-index="${status.index}">
                            <button type="button" class="btn-remove-day" onclick="removeDay(this)">✕ Remove</button>
                            <h4>Day ${status.index + 1}</h4>
                            <input type="hidden" name="days[${status.index}].dayNumber" value="${day.dayNumber != null ? day.dayNumber : status.index + 1}" />
                            <label class="custom-label">Title</label>
                            <input type="text" name="days[${status.index}].title" value="${day.title}" class="custom-input" required placeholder="e.g. Arrival & City Tour" />
                            <label class="custom-label">Description</label>
                            <textarea name="days[${status.index}].description" rows="3" class="custom-textarea" required placeholder="Describe this day's activities...">${day.description}</textarea>
                        </div>
                    </c:forEach>
                </c:if>
            </div>

            <button type="button" class="btn-add-day" onclick="addDay()">+ Add Another Day</button>

            <button type="submit" class="btn-submit-custom">
                <c:choose>
                    <c:when test="${not empty itinerary.itineraryId}">Update Itinerary</c:when>
                    <c:otherwise>Save Itinerary</c:otherwise>
                </c:choose>
            </button>
        </form>
    </div>
</div>


<script>
var dayCount = 0;
(function() {
    var existing = document.querySelectorAll('#dayContainer .day-card');
    dayCount = existing.length;
    if (dayCount === 0) { addDay(); }
})();

function addDay() {
    var container = document.getElementById("dayContainer");
    var index = dayCount;
    dayCount++;
    var card = document.createElement("div");
    card.className = "day-card";
    card.setAttribute("data-day-index", index);
    card.innerHTML = 
        '<button type="button" class="btn-remove-day" onclick="removeDay(this)">✕ Remove</button>' +
        '<h4>Day ' + (index + 1) + '</h4>' +
        '<input type="hidden" name="days[' + index + '].dayNumber" value="' + (index + 1) + '" />' +
        '<label class="custom-label">Title</label>' +
        '<input type="text" name="days[' + index + '].title" class="custom-input" required placeholder="e.g. Arrival & City Tour" />' +
        '<label class="custom-label">Description</label>' +
        '<textarea name="days[' + index + '].description" class="custom-textarea" rows="3" required placeholder="Describe this day\'s activities..."></textarea>';
    container.appendChild(card);
}

function removeDay(btn) {
    btn.closest('.day-card').remove();
    renumberDays();
}

function renumberDays() {
    var cards = document.querySelectorAll('#dayContainer .day-card');
    dayCount = cards.length;
    cards.forEach((card, i) => {
        card.setAttribute("data-day-index", i);
        card.querySelector("h4").textContent = "Day " + (i + 1);
        
        // Update names for all inputs within this card
        var inputs = card.querySelectorAll('input, textarea');
        inputs.forEach(input => {
            var name = input.getAttribute('name');
            if (name) {
                if (name.includes('.dayNumber')) {
                    input.name = "days[" + i + "].dayNumber";
                    input.value = (i + 1);
                } else if (name.includes('.title')) {
                    input.name = "days[" + i + "].title";
                } else if (name.includes('.description')) {
                    input.name = "days[" + i + "].description";
                }
            }
        });
    });
}
</script>
</body>
</html>