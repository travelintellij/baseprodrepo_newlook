
    
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script> 
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<body>

    
    <form:form modelAttribute="LEAD_OBJ" action="form_view_editlead">
    <form:hidden path="leadId" />
    <div class="follow-up-pop-up container">
        <i class="fa-solid fa-xmark fa-xl cross-red"  style="color: red;"></i>
        
        <h1>Lead Details</h1>
        <div class="fupp-fir-line">
            <div class="fupp-1-d">
                <h3>Lead ID</h3>
                <p>Q-${String.format("%04d",LEAD_OBJ.leadId)}-${LEAD_OBJ.leadSourceShortName }</p>
            </div>
            <div class="fupp-1-d">
                <h3>Client</h3>
                <p>${LEAD_OBJ.contactName}</p>
            </div>
            <div class="fupp-1-d">
                <h3>Source</h3>
                <p>${LEAD_OBJ.sourceName}</p>
            </div>
            <div class="fupp-1-d">
                <h3>Destination</h3>
                <p>${LEAD_OBJ.destinationName}</p>
            </div>
        </div>
        <div class="fupp-2nd-line">
            <div class="fupp-1-d">
                <h3>Audts</h3>
                <p>${LEAD_OBJ.adults}</p>
            </div>
            <div class="fupp-1-d">
                <h3>Children</h3>
                <p>${LEAD_OBJ.children} (Age ${LEAD_OBJ.childrenAgeInfo} )</p>
            </div>
            <div class="fupp-1-d">
                <h3>Travel start date</h3>
                <fmt:formatDate value="${LEAD_OBJ.travelStartDate}" pattern="dd-MM-yyyy"/>
            </div>
            <div class="fupp-1-d">
                <h3>Travel end date</h3>
                <fmt:formatDate value="${LEAD_OBJ.travelEndDate}" pattern="dd-MM-yyyy" />
            </div>
        </div>
        <div class="fupp-3nd-line">
            <div class="fupp-1-d">
                <h3>Lead Source</h3>
                <p>${LEAD_OBJ.leadSourceName}</p>
            </div>
            <div class="fupp-1-d">
                <h3>Status</h3>
                <p>${LEAD_OBJ.statusName}</p>
            </div>
        </div>
        <div class="fupp-4th-line">
            <h2 class="fupp-srh">Services Requested</h2>
            <div class="fupp-sr">
                <h3>package</h3>
                <form:checkbox path="landPackage" name="landPackage;" disabled="true" style="background-color: red;" />
            </div>
            <div class="fupp-sr">
                <h3>flight</h3>
                <form:checkbox path="flight" name="flight" disabled="true" />
            </div>
            <div class="fupp-sr">
                <h3>Hotal</h3>
                <form:checkbox path="hotel" name="hotel" disabled="true" />
            </div>
            <div class="fupp-sr">
                <h3>Transfers</h3>
            <form:checkbox path="transfers" name="transfers" disabled="true" />
            </div>
            <div class="fupp-sr">
                <h3>sightseeing</h3>
                <form:checkbox path="sightseeing" name="sightseeing" disabled="true" />
            </div>
            <div class="fupp-sr">
                <h3>visa</h3>
                <form:checkbox path="visa" name="visa" disabled="true" />
            </div>
            <div class="fupp-sr">
                <h3>insurence</h3>
                <form:checkbox path="insurance" name="insurance" disabled="true" />
            </div>
            <div class="fupp-sr">
                <h3>cruise</h3>
            <form:checkbox path="cruise" name="cruise" disabled="true" />
            </div>
            <div class="fupp-sr">
                <h3>others</h3>
                <form:checkbox path="others" name="others" disabled="true" />
            </div>
        </div>
        <div class="fupp-5th-line">
            <h3>Remarks</h3>
            <p>${LEAD_OBJ.clientRemarks}</p>
        </div>
                 </div>
            </form:form>
     


</body>
</html>