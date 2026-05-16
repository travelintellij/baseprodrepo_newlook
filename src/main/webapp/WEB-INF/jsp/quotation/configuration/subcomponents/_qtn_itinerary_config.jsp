<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${not empty LINKED_ITINERARY}">
    <div class="itinerary-section" style="margin-top: 20px; page-break-before: auto;">
        <h2 style="background-color: #333; color: #fff; padding: 10px; margin-bottom: 15px; font-size: 18px;">Itinerary: ${LINKED_ITINERARY.title}</h2>
        <c:if test="${not empty LINKED_ITINERARY.description}">
            <p style="font-style: italic; margin-bottom: 15px; color: #555;">${LINKED_ITINERARY.description}</p>
        </c:if>
        
        <table style="width: 100%; border-collapse: collapse; margin-top: 10px;">
            <c:forEach items="${LINKED_ITINERARY.days}" var="day">
                <tr style="border-bottom: 1px solid #ddd;">
                    <td style="width: 80px; vertical-align: top; padding: 10px; font-weight: bold; background-color: #f9f9f9;">
                        Day ${day.dayNumber}
                    </td>
                    <td style="padding: 10px; vertical-align: top;">
                        <div style="font-weight: bold; font-size: 16px; color: #d35400; margin-bottom: 5px;">${day.title}</div>
                        <div style="font-size: 14px; line-height: 1.6; color: #333; white-space: pre-line;">${day.description}</div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <hr>
</c:if>
