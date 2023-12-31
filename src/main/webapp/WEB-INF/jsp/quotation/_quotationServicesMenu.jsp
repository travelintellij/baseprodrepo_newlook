<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">

<div class="quotationServicesMenu_table">

 <table style="border-collapse: collapse; border: none;">
		<tr >
			<th> <a href="form_view_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:transparent;outline:none;border:none;width:100%;border-bottom:2px solid #F8AF51"  value="Quotation Summary" /></a></th>
		</tr>
		<c:if test="${QTN_OBJ.flight eq true}">
			<tr >
				<th > <a href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:transparent;outline:none;width:100%;border:none;border-bottom:2px solid #F8AF51"   value="Flight" /></a></th>
			</tr>
		</c:if>
		<c:if test="${QTN_OBJ.hotel eq true}">
			<tr>
			<th > <a href="form_view_hotel_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:transparent;outline:none;border:none;width:100%;border-bottom:2px solid #F8AF51"   value="Hotel" /></a></th>
			
			</tr>
		</c:if>
		<c:if test="${QTN_OBJ.transfers eq true}">
			<tr>
				<th > <a href="form_view_transfer_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:transparent;outline:none;border:none;width:100%;border-bottom:2px solid #F8AF51"   value="Transfers" /></a></th>
			</tr>
		</c:if>
		<c:if test="${QTN_OBJ.sightseeing eq true}">
			<tr>
				<th > <a href="form_view_sightseeing_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:transparent;outline:none;border:none;width:100%;border-bottom:2px solid #F8AF51"   value="Sight Seeing" /></a></th>
			</tr>
		</c:if>
		<c:if test="${QTN_OBJ.visa eq true}">
			<tr>
				<th > <a href="form_view_visa_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:transparent;outline:none;border:none;width:100%;border-bottom:2px solid #F8AF51"   value="Visa" /></a></th>
			</tr>
		</c:if>
		<c:if test="${QTN_OBJ.insurance eq true}">
			<tr>
				<th><a href="form_view_insurance_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:transparent;outline:none;border:none;width:100%;border-bottom:2px solid #F8AF51"   value="Insurance" /></a> </th>
			</tr>
		</c:if>
		<c:if test="${QTN_OBJ.cruise eq true}">
			<tr>
				<th > <a href="form_view_cruise_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button"  style="background:transparent;outline:none;border:none;width:100%;border-bottom:2px solid #F8AF51"  value="Cruise" /></a></th>
			</tr>
		</c:if>
		<c:if test="${QTN_OBJ.tourPackage eq true}">
			<tr>
				<th > <a href="form_view_package_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:transparent;outline:none;border:none;width:100%;border-bottom:2px solid #F8AF51"  value="Tour Package" /></a></th>
			</tr>
		</c:if>
		<c:if test="${QTN_OBJ.others eq true}">
			<tr>
				<th > <a href="form_view_other_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:transparent;outline:none;border:none;width:100%;border-bottom:2px solid #F8AF51"  value="Others" /></a></th>
			</tr>
		</c:if>
			<tr>
				<th> <a href="form_view_configure_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="background:transparent;outline:none;border:none;width:100%;border-bottom:2px solid #F8AF51"  value="Configure / Generate" /></a></th>
			</tr>
		</table>
		
</div>