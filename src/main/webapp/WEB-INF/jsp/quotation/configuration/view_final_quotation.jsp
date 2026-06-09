<!DOCTYPE html>
<html>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<head>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
/* Global Premium Reset & Typography */
body {
    max-width: 1000px;
    margin: 40px auto;
    padding: 40px;
    font-family: 'Outfit', 'Segoe UI', system-ui, sans-serif;
    color: #1e293b;
    line-height: 1.5;
    background-color: transparent;
}

/* Background image configuration */
.quotation-print-bg {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    z-index: -9999;
    opacity: 0.75; /* Perfect blend for the pink theme */
    pointer-events: none;
    object-fit: cover;
}

/* Tables & Borders Styling */
table {
    width: 100% !important;
    border-collapse: separate !important;
    border-spacing: 0 !important;
    margin-bottom: 24px !important;
    background-color: rgba(255, 255, 255, 0.85) !important; /* Glass effect */
    backdrop-filter: blur(8px) !important;
    border-radius: 12px !important;
    overflow: hidden !important;
    box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1) !important;
    border: 1px solid rgba(255, 255, 255, 0.6) !important;
}

table, th, td {
    border: 1px solid rgba(0, 0, 0, 0.05) !important;
}

th {
    background-color: rgba(255, 255, 255, 0.95) !important; 
    color: #0284c7 !important; /* Sky blue for headers */
    font-weight: 700 !important;
    text-transform: uppercase !important;
    font-size: 0.85rem !important;
    letter-spacing: 0.05em !important;
    padding: 14px 16px !important;
    white-space: nowrap !important;
    text-align: center !important;
}

td {
    padding: 14px 16px !important;
    color: #334155 !important;
    font-size: 0.95rem !important;
    text-align: center !important;
    vertical-align: middle !important;
}

/* Modern styling for hr, headings and fonts */
h1, h2, h3, h4, h5, h6 {
    color: #0284c7 !important;
    font-weight: 800 !important;
    margin-top: 20px;
    margin-bottom: 10px;
}

h2 {
    font-size: 1.5rem !important;
}

hr {
    border: 0 !important;
    height: 1px !important;
    background: linear-gradient(to right, rgba(0,0,0,0), rgba(2, 132, 199, 0.2), rgba(0,0,0,0)) !important;
    margin: 24px 0 !important;
}

/* Redefining color accents to match the modern theme */
td[style*="background-color:pink"],
th[style*="background-color:pink"],
td[style*="background-color: pink"],
th[style*="background-color: pink"] {
    background-color: rgba(240, 249, 255, 0.9) !important; 
    font-weight: 700 !important;
    color: #0284c7 !important;
}

td[style*="background-color:yellow"],
td[style*="background-color: yellow"] {
    background-color: rgba(224, 242, 254, 0.95) !important; /* Light sky blue */
    color: #0284c7 !important;
    font-weight: 700 !important;
}

table[style*="background-color:#FFFACD"] {
    background-color: rgba(255, 255, 255, 0.7) !important;
}

th[style*="background-color:blue"],
td[style*="background-color:blue"] {
    background-color: rgba(14, 165, 233, 0.9) !important; /* Solid sky blue for main headers */
    color: white !important;
    font-size: 1.05rem !important;
    letter-spacing: 0.05em !important;
    border: none !important;
}

td[style*="background-color:lightblue"] {
    background-color: rgba(186, 230, 253, 0.8) !important; /* Soft blue highlights */
    color: #0284c7 !important;
    font-weight: 600 !important;
}

/* Media Print Configuration for A4 PDF */
@media print {
    #Printbox, a[href*="send_whatsapp_quotation"], input[type="button"] {
        display: none !important;
    }
    
    @page {
        size: A4;
        margin: 0; 
    }
    
    html, body {
        background-color: transparent !important;
    }
    
    body {
        max-width: none !important;
        margin: 20mm 15mm !important; 
        padding: 0 !important;
    }
    
    .quotation-print-bg {
        position: fixed;
        top: 0;
        left: 0;
        width: 100vw;
        height: 100vh;
        z-index: -9999;
        opacity: 0.55; /* Slightly lighter for printing */
        object-fit: cover;
        -webkit-print-color-adjust: exact;
        print-color-adjust: exact;
    }
}
</style>
</head>
<body>
<img class="quotation-print-bg" src="${pageContext.request.contextPath}/resources/images/revamped/quotation_print_bg.png" alt="background">
<form:form modelAttribute="MANUAL_CNF" action="create_update_generate_manual_configuration_quotation">

<%@ include file="subcomponents/_qtn_header_config.jsp" %>
<hr>
<c:if test="${QTN_OBJ.flight eq true}">
	<%@ include file="subcomponents/_qtn_flight_config.jsp" %>
</c:if>
<c:if test="${QTN_OBJ.hotel eq true}">
	<%@ include file="subcomponents/_qtn_hotel_config.jsp" %>
</c:if>
 
<c:if test="${QTN_OBJ.transfers eq true}">
	<%@ include file="subcomponents/_qtn_transfers_config.jsp" %>
</c:if>

<c:if test="${QTN_OBJ.sightseeing eq true}">
	<%@ include file="subcomponents/_qtn_sightseeing_config.jsp" %>
</c:if>

<c:if test="${QTN_OBJ.visa eq true}">
	<%@ include file="subcomponents/_qtn_visa_config.jsp" %>
</c:if>

<c:if test="${QTN_OBJ.insurance eq true}">
	<%@ include file="subcomponents/_qtn_insurance_config.jsp" %>
</c:if>

<c:if test="${QTN_OBJ.cruise eq true}">
	<%@ include file="subcomponents/_qtn_cruise_config.jsp" %>
</c:if>

<c:if test="${QTN_OBJ.tourPackage eq true}">
<%@ include file="subcomponents/_qtn_tourpackage_config.jsp" %>
</c:if>

<c:if test="${QTN_OBJ.others eq true}">
<%@ include file="subcomponents/_qtn_others_config.jsp" %>
</c:if>




<c:if test="${not empty MANUAL_CNF.remarks }">
<table style="width:100%;" >
	<tr><th>Remarks</th></tr>
	<tr>
	<td>
	<p align="left" style="white-space: pre-line">${MANUAL_CNF.remarks}</p>
	</td>
	</tr>
</table>

</c:if>
<%@ include file="subcomponents/_qtn_costing_config.jsp" %>
<%@ include file="subcomponents/_qtn_tnc_config.jsp" %>
<%@ include file="subcomponents/_qtn_itinerary_config.jsp" %>
<p align="right">
    <a href="send_whatsapp_quotation?leadId=${LEAD_OBJ.leadId}&quotationId=${QTN_OBJ.quotationId}" style="text-decoration:none;">
        <input type="button" value="Share on WhatsApp" style="background:#25D366; color:white; border:none; padding:5px 10px; cursor:pointer; border-radius:3px;"/>
    </a>
    <input type="button" id="Printbox" value="print" onclick="javascript:window.print();" /> 
</p>
</form:form> 



</body>
</html>
  