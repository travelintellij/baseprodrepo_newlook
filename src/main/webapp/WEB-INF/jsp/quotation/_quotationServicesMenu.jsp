<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

 <table style="border-collapse: collapse; border: none;">
		
		<tr >
			<th style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <a href="form_view_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;font-weight: bold;font-weight: 800;font-size: 18px;" value="Quotation Summary" /></a></th>
		</tr>
		<c:if test="${QTN_OBJ.flight eq true}">
			<tr >
				<th style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <a href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:#E1A315;color:black;font-weight: bold;font-weight: 800;font-size: 18px;" value="Flight" /></a></th>
			</tr>
		</c:if>
		<c:if test="${QTN_OBJ.hotel eq true}">
			<tr>
			<th style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;"> <a href="form_view_hotel_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:#E1A315;color:black;font-weight: bold;font-weight: 800;font-size: 18px;" value="Hotel" /></a></th>
			
			</tr>
		</c:if>
		<c:if test="${QTN_OBJ.transfers eq true}">
			<tr>
				<th style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;"> <a href="form_view_transfer_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:#E1A315;color:black;font-weight: bold;font-weight: 800;font-size: 18px;" value="Transfers" /></a></th>
			</tr>
		</c:if>
		<c:if test="${QTN_OBJ.sightseeing eq true}">
			<tr>
				<th style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;"> <a href="form_view_sightseeing_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:#E1A315;color:black;font-weight: bold;font-weight: 800;font-size: 18px;" value="Sight Seeing" /></a></th>
			</tr>
		</c:if>
		<c:if test="${QTN_OBJ.visa eq true}">
			<tr>
				<th style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;"> <a href="form_view_visa_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:#E1A315;color:black;font-weight: bold;font-weight: 800;font-size: 18px;" value="Visa" /></a></th>
			</tr>
		</c:if>
		<c:if test="${QTN_OBJ.insurance eq true}">
			<tr>
				<th style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;"><a href="form_view_insurance_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:#E1A315;color:black;font-weight: bold;font-weight: 800;font-size: 18px;" value="Insurance" /></a> </th>
			</tr>
		</c:if>
		<c:if test="${QTN_OBJ.cruise eq true}">
			<tr>
				<th style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;"> <a href="form_view_cruise_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:#E1A315;color:black;font-weight: bold;font-weight: 800;font-size: 18px;" value="Cruise" /></a></th>
			</tr>
		</c:if>
		<c:if test="${QTN_OBJ.tourPackage eq true}">
			<tr>
				<th style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;"> <a href="form_view_package_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:#E1A315;color:black;font-weight: bold;font-weight: 800;font-size: 18px;" value="Tour Package" /></a></th>
			</tr>
		</c:if>
		<c:if test="${QTN_OBJ.others eq true}">
			<tr>
				<th style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;"> <a href="form_view_other_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:#E1A315;color:black;font-weight: bold;font-weight: 800;font-size: 18px;" value="Others" /></a></th>
			</tr>
		</c:if>
			<tr>
				<th style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;"> <a href="form_view_configure_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:lightblue;color:black;font-weight: bold;font-weight: 800;font-size: 18px;" value="Configure / Generate" /></a></th>
			</tr>
		</table>