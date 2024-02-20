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
<a  href="form_view_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:transparent;outline:none;border:none;width:100%;color:white;font-weight:bold;cursor:pointer;padding:
0 5px;border-radius:5px;background:black"  value="Quotation Summary" /></a>
</div>
			
		
		<c:if test="${QTN_OBJ.flight eq true}">
			
				 <a href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:transparent;outline:none;width:100%;border:none;cursor:pointer;color:black;font-weight:Bold;margin:0 10px"   value="Flight"/></a>
		
		</c:if>
		
		
		<c:if test="${QTN_OBJ.hotel eq true}">
			 <a href="form_view_hotel_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:transparent;outline:none;border:none;width:100%;cursor:pointer;color:black;font-weight:Bold;margin:0 10px"   value="Hotel" /></a>
		</c:if>
		
		
		
		<c:if test="${QTN_OBJ.transfers eq true}">
			
				 <a href="form_view_transfer_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:transparent;outline:none;border:none;width:100%;cursor:pointer;color:black;font-weight:Bold;margin:0 10px"   value="Transfers" /></a>
		</c:if>
		
		
		
		
		<c:if test="${QTN_OBJ.sightseeing eq true}">
			
				 <a href="form_view_sightseeing_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:transparent;outline:none;border:none;width:100%;cursor:pointer;color:black;font-weight:Bold;margin:0 10px"   value="Sight Seeing" /></a>
			
		</c:if>
		
		
			<c:if test="${QTN_OBJ.visa eq true}">
		
				<a href="form_view_visa_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:transparent;outline:none;border:none;width:100%;cursor:pointer;color:black;font-weight:Bold ;margin:0 10px"   value="Visa" /></a>
			
		</c:if>
		
	
	<c:if test="${QTN_OBJ.insurance eq true}">
			
				<a href="form_view_insurance_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:transparent;outline:none;border:none;width:100%;cursor:pointer;color:black;font-weight:Bold;margin:0 10px"   value="Insurance" /></a> 
			
		</c:if>
	
		
			<c:if test="${QTN_OBJ.cruise eq true}">
			
				 <a href="form_view_cruise_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button"  style="background:transparent;outline:none;border:none;width:100%;cursor:pointer;color:black;font-weight:Bold;margin:0 10px"  value="Cruise" /></a>
		
		</c:if>
		
	
		<c:if test="${QTN_OBJ.tourPackage eq true}">
			
				 <a href="form_view_package_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:transparent;outline:none;border:none;width:100%;cursor:pointer;color:black;font-weight:Bold;margin:0 10px"  value="Tour Package" /></a>
			
		</c:if>
	<c:if test="${QTN_OBJ.others eq true}">
		
				 <a href="form_view_other_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:transparent;outline:none;border:none;width:100%;cursor:pointer;color:black;font-weight:Bold;margin:0 10px"  value="Others" /></a>
			
		</c:if>
	
				 <a  href="form_view_configure_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:transparent;outline:none;border:none;width:100%;font-weight:bold;background:black;border-radius:5px;color:white;cursor:pointer;margin-left:10px;"  value="Configure / Generate" /></a>	

</div>