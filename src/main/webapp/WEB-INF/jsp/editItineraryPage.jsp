<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
    This page is no longer used directly.
    The edit flow now uses createItineraryPage.jsp for both create and edit.
    If this page is reached, it forwards to createItineraryPage logic.
--%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Itinerary</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>

        body {
            background: linear-gradient(135deg, #f0f4f8, #e2e8f0);
            font-family: 'Inter', sans-serif;
            margin: 0;
            padding: 40px 20px;
            color: #333;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05),
                        0 1px 3px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #1a202c;
            font-size: 28px;
            margin-top: 0;
            margin-bottom: 30px;
            font-weight: 700;
        }

        label {
            font-weight: 600;
            color: #4a5568;
            display: inline-block;
            margin-bottom: 8px;
        }

        input[type="text"],
        input[type="date"],
        textarea {

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

        input[type="text"]:focus,
        input[type="date"]:focus,
        textarea:focus {

            outline: none;
            border-color: #3182ce;
            box-shadow: 0 0 0 3px rgba(49,130,206,0.1);
            background: white;
        }

        .btn-add {
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
        }

        .btn-add:hover {
            background: #bee3f8;
            border-color: #3182ce;
        }

        .btn-submit {
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
        }

        .btn-submit:hover {
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

        .day-card:hover {
            border-color: #cbd5e0;
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

        .btn-remove {
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
            transition: all 0.2s;
        }

        .btn-remove:hover {
            background: #fed7d7;
            border-color: #fc8181;
        }

    </style>

</head>

<body>

<div class="container">

    <h2>✏️ Edit Itinerary</h2>

    <form id="itineraryForm"
          action="${pageContext.request.contextPath}/itinerary/save"
          method="post">

        <%-- HIDDEN FIELDS --%>
        <input type="hidden" name="leadId" value="${leadId}" />
        <c:if test="${not empty itinerary.id}">
            <input type="hidden" name="id" value="${itinerary.id}" />
        </c:if>

        <%-- TITLE --%>
        <label>Itinerary Title</label>

        <input type="text"
               name="title"
               value="${itinerary.title}"
               required
               placeholder="e.g. 5 Days in Switzerland" />

        <%-- DESCRIPTION --%>
        <label>Description</label>

        <textarea name="description"
                  rows="4"
                  placeholder="Briefly describe the overall trip...">${itinerary.description}</textarea>

        <%-- DAYS --%>
        <h3 class="section-title">Daily Schedule</h3>

        <div id="dayContainer">

            <%-- PRE-FILL existing days during edit using JSTL --%>
            <c:if test="${not empty itinerary.days}">
                <c:forEach var="day" items="${itinerary.days}" varStatus="status">

                    <div class="day-card" data-day-index="${status.index}">

                        <button type="button" class="btn-remove"
                                onclick="removeDay(this)">✕ Remove</button>

                        <h4>Day ${status.index + 1}</h4>

                        <%-- DAY NUMBER (hidden) --%>
                        <input type="hidden"
                               name="days_dayNumber"
                               value="${day.dayNumber != null ? day.dayNumber : status.index + 1}" />

                        <%-- DAY TITLE --%>
                        <label>Title</label>
                        <input type="text"
                               name="days_title"
                               value="${day.title}"
                               required
                               placeholder="e.g. Arrival & City Tour" />

                        <%-- DAY DESCRIPTION --%>
                        <label>Description</label>
                        <textarea name="days_description"
                                  rows="3"
                                  required
                                  placeholder="Describe this day's activities...">${day.description}</textarea>

                    </div>

                </c:forEach>
            </c:if>

        </div>

        <%-- ADD DAY BUTTON --%>
        <button type="button"
                class="btn-add"
                onclick="addDay()">

            + Add Another Day

        </button>

        <%-- SUBMIT --%>
        <button type="submit" class="btn-submit">

            <c:choose>
                <c:when test="${not empty itinerary.id}">Update Itinerary</c:when>
                <c:otherwise>Save Itinerary</c:otherwise>
            </c:choose>

        </button>

    </form>

</div>

<script>

// Track the current day count based on pre-filled days
var dayCount = 0;

// Count existing day cards on load
(function() {
    var existing = document.querySelectorAll('#dayContainer .day-card');
    dayCount = existing.length;

    // If no existing days (create mode), add one empty day
    if (dayCount === 0) {
        addDay();
    }
})();

function addDay() {

    var container = document.getElementById("dayContainer");
    var index = dayCount;
    dayCount++;

    var card = document.createElement("div");
    card.className = "day-card";
    card.setAttribute("data-day-index", index);

    card.innerHTML =
        '<button type="button" class="btn-remove" onclick="removeDay(this)">' +
            '\u2715 Remove</button>' +
        '<h4>Day ' + (index + 1) + '</h4>' +

        '<input type="hidden" name="days_dayNumber" value="' + (index + 1) + '" />' +

        '<label>Title</label>' +
        '<input type="text" name="days_title" required ' +
            'placeholder="e.g. Arrival &amp; City Tour" />' +

        '<label>Description</label>' +
        '<textarea name="days_description" rows="3" required ' +
            'placeholder="Describe this day\'s activities..."></textarea>';

    container.appendChild(card);
}

function removeDay(btn) {
    var card = btn.closest('.day-card');
    card.remove();
    renumberDays();
}

function renumberDays() {
    var cards = document.querySelectorAll('#dayContainer .day-card');
    dayCount = cards.length;

    for (var i = 0; i < cards.length; i++) {
        cards[i].setAttribute("data-day-index", i);
        cards[i].querySelector("h4").textContent = "Day " + (i + 1);
        cards[i].querySelector('input[name="days_dayNumber"]').value = (i + 1);
    }
}

</script>

</body>
</html>