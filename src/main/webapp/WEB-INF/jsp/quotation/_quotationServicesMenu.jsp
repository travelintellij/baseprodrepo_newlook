<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">

	<div class="quotationServicesMenu_table">
	<div style="color:black">
	<a  href="form_view_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:black;outline:none;border:none;width:auto;color:white;font-weight:bold;cursor:pointer;padding:5px 10px;border-radius:5px;white-space:nowrap;margin:0 5px;"  value="Quotation Summary" /></a>
	</div>
	<c:if test="${QTN_OBJ.flight eq true}">
			 <a href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:black;outline:none;border:none;width:auto;color:white;font-weight:bold;cursor:pointer;padding:5px 10px;border-radius:5px;white-space:nowrap;margin:0 5px;"   value="Flight"/></a>
	</c:if>
	
	<c:if test="${QTN_OBJ.hotel eq true}">
		 <a href="form_view_hotel_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:black;outline:none;border:none;width:auto;color:white;font-weight:bold;cursor:pointer;padding:5px 10px;border-radius:5px;white-space:nowrap;margin:0 5px;"   value="Hotel" /></a>
	</c:if>
	
	<c:if test="${QTN_OBJ.transfers eq true}">
		<a href="form_view_transfer_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:black;outline:none;border:none;width:auto;color:white;font-weight:bold;cursor:pointer;padding:5px 10px;border-radius:5px;white-space:nowrap;margin:0 5px;"   value="Transfers" /></a>
	</c:if>
	<c:if test="${QTN_OBJ.sightseeing eq true}">
		<a href="form_view_sightseeing_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:black;outline:none;border:none;width:auto;color:white;font-weight:bold;cursor:pointer;padding:5px 10px;border-radius:5px;white-space:nowrap;margin:0 5px;"   value="Sight Seeing" /></a>
	</c:if>
	<c:if test="${QTN_OBJ.visa eq true}">
		<a href="form_view_visa_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:black;outline:none;border:none;width:auto;color:white;font-weight:bold;cursor:pointer;padding:5px 10px;border-radius:5px;white-space:nowrap;margin:0 5px;"   value="Visa" /></a>
	</c:if>
	<c:if test="${QTN_OBJ.insurance eq true}">
		<a href="form_view_insurance_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:black;outline:none;border:none;width:auto;color:white;font-weight:bold;cursor:pointer;padding:5px 10px;border-radius:5px;white-space:nowrap;margin:0 5px;"   value="Insurance" /></a> 
	</c:if>
	<c:if test="${QTN_OBJ.cruise eq true}">
		<a href="form_view_cruise_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button"  style="background:black;outline:none;border:none;width:auto;color:white;font-weight:bold;cursor:pointer;padding:5px 10px;border-radius:5px;white-space:nowrap;margin:0 5px;"  value="Cruise" /></a>
	</c:if>
	<c:if test="${QTN_OBJ.tourPackage eq true}">
		<a href="form_view_package_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:black;outline:none;border:none;width:auto;color:white;font-weight:bold;cursor:pointer;padding:5px 10px;border-radius:5px;white-space:nowrap;margin:0 5px;"  value="Tour Package" /></a>
	</c:if>
	<c:if test="${QTN_OBJ.others eq true}">
		<a href="form_view_other_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:black;outline:none;border:none;width:auto;color:white;font-weight:bold;cursor:pointer;padding:5px 10px;border-radius:5px;white-space:nowrap;margin:0 5px;"  value="Others" /></a>
	</c:if>
	<div style="position:relative; display:flex; align-items:center; margin:0 5px;">
		<button type="button" onclick="toggleItineraryMenu()"
	    style="background:black;outline:none;border:none;width:auto;color:white;font-weight:bold;cursor:pointer;padding:5px 10px;border-radius:5px;white-space:nowrap;margin:0 5px;">
	    Itinerary
	    </button>
	
	    <div id="itineraryMenu"
                style="display:none; position:absolute; top:100%; left:50%; transform:translateX(-50%); background:white;
                padding:10px; border-radius:6px; box-shadow:0 4px 10px rgba(0,0,0,0.2);
                z-index:1000; flex-direction:column; gap:10px; white-space:nowrap;">

               <!-- CREATE -->
               <a href="${pageContext.request.contextPath}/itinerary/create?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"
                  style="padding:8px 12px;background:#007bff;color:white;border-radius:5px;text-decoration:none;display:block;text-align:center;">
                   Create
               </a>

               <!-- DUPLICATE -->
               <a href="${pageContext.request.contextPath}/itinerary/duplicate_itinerary?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"
                  style="padding:8px 12px;background:#ffc107;color:black;border-radius:5px;text-decoration:none;display:block;text-align:center;">
                   Duplicate
               </a>

               <!-- LINK -->
               <a href="${pageContext.request.contextPath}/itinerary/link_existing_itinerary?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"
                  style="padding:8px 12px;background:#28a745;color:white;border-radius:5px;text-decoration:none;display:block;text-align:center;">
                   Link
               </a>

               <!-- MANAGE ALL (NEW) -->
               <a href="${pageContext.request.contextPath}/itinerary/list?leadId=${QTN_OBJ.leadEntity.leadId}"
                  style="padding:8px 12px;background:#6c757d;color:white;border-radius:5px;text-decoration:none;display:block;text-align:center;">
                   Manage All
               </a>

           </div>
	</div>

	<a  href="form_view_configure_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:black;outline:none;border:none;width:auto;font-weight:bold;border-radius:5px;color:white;cursor:pointer;margin-left:5px;white-space:nowrap;padding:5px 10px;"  value="Configure / Generate" /></a>	
</div>
<script>
function toggleItineraryMenu() {
    var menu = document.getElementById("itineraryMenu");

    if (menu.style.display === "flex") {
        menu.style.display = "none";
    } else {
        menu.style.display = "flex";
    }
}
</script>
</div>