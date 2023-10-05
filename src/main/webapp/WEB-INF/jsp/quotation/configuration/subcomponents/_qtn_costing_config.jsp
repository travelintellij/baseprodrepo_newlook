<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<style>
td{
text-align:center;

}

</style>
	<table style="width:100%;  background-color:#FFFACD;" >
		<tr><td style="background-color:yellow;" height="50"><h2 align="center">Costing Section</h2></td></tr>
	</table>
	<c:set var="grandTotalCost"  value="0" scope="page"/>
	<c:set var="grandTotalMarkup" value="0" scope="page"/>


	<c:if test="${QTN_OBJ.flight eq true}">
		<c:set var = "totalFlightCost" scope = "page" value = "0"/>
		<c:set var = "totalFlightMarkup" scope = "page" value = "0"/>
		<c:forEach var="flightList" items="${QTN_OBJ.manualQuotationsVoList}">
			<c:set var="totalFlightCost" value="${totalFlightCost + flightList.flightCost}" scope="page"/>
			<c:set var="totalFlightMarkup" value="${totalFlightMarkup + flightList.flightMarkup}" scope="page"/>
		</c:forEach>
		<c:set var="grandTotalCost"  value="${grandTotalCost + totalFlightCost}" scope="page"/>
		<c:set var="grandTotalMarkup" value="${grandTotalMarkup + totalFlightMarkup}" scope="page"/>
	</c:if>


	<c:if test="${QTN_OBJ.transfers eq true}">
		<c:set var = "totalTransfersCost" scope = "page" value = "0"/>
		<c:set var = "totalTransfersMarkup" scope = "page" value = "0"/>
		<c:forEach var="transfersList" items="${QTN_OBJ.transferVoList}">
			<c:set var="totalTransfersCost" value="${totalTransfersCost + transfersList.transferCost}" scope="page"/>
			<c:set var="totalTransfersMarkup" value="${totalTransfersMarkup + transfersList.transferMarkup}" scope="page"/>
		</c:forEach>
		<c:set var="grandTotalCost"  value="${grandTotalCost + totalTransfersCost}" scope="page"/>
		<c:set var="grandTotalMarkup" value="${grandTotalMarkup + totalTransfersMarkup}" scope="page"/>
	</c:if>

	<c:if test="${QTN_OBJ.sightseeing eq true}">
		<c:set var = "totalSightSeeingCost" scope = "page" value = "0"/>
		<c:set var = "totalSightSeeingMarkup" scope = "page" value = "0"/>
		<c:forEach var="sightSeeingList" items="${QTN_OBJ.sightSeeingVoList}">
			<c:set var="totalSightSeeingCost" value="${totalSightSeeingCost + sightSeeingList.sightSeeingCost}" scope="page"/>
			<c:set var="totalSightSeeingMarkup" value="${totalSightSeeingMarkup + sightSeeingList.sightSeeingMarkup}" scope="page"/>
		</c:forEach>
		<c:set var="grandTotalCost"  value="${grandTotalCost + totalSightSeeingCost}" scope="page"/>
		<c:set var="grandTotalMarkup" value="${grandTotalMarkup + totalSightSeeingMarkup}" scope="page"/>
		
	</c:if>

	<c:if test="${QTN_OBJ.visa eq true}">
		<c:set var = "totalVisaCost" scope = "page" value = "0"/>
		<c:set var = "totalVisaMarkup" scope = "page" value = "0"/>
		<c:forEach var="visaList" items="${QTN_OBJ.visaVoList}">
			<c:set var="totalVisaCost" value="${totalVisaCost + visaList.visaCost}" scope="page"/>
			<c:set var="totalVisaMarkup" value="${totalVisaMarkup + visaList.visaMarkup}" scope="page"/>
		</c:forEach>
		<c:set var="grandTotalCost"  value="${grandTotalCost + totalVisaCost}" scope="page"/>
		<c:set var="grandTotalMarkup" value="${grandTotalMarkup + totalVisaMarkup}" scope="page"/>
	</c:if>
	
	<c:if test="${QTN_OBJ.insurance eq true}">
		<c:set var = "totalInsuranceCost" scope = "page" value = "0"/>
		<c:set var = "totalInsuranceMarkup" scope = "page" value = "0"/>
		<c:forEach var="insuranceList" items="${QTN_OBJ.insuranceVoList}">
			<c:set var="totalInsuranceCost" value="${totalInsuranceCost + insuranceList.premiumCost}" scope="page"/>
			<c:set var="totalInsuranceMarkup" value="${totalInsuranceMarkup + insuranceList.premiumMarkup}" scope="page"/>
		</c:forEach>
		<c:set var="grandTotalCost"  value="${grandTotalCost + totalInsuranceCost}" scope="page"/>
		<c:set var="grandTotalMarkup" value="${grandTotalMarkup + totalInsuranceMarkup}" scope="page"/>
	</c:if>
	<c:if test="${QTN_OBJ.cruise eq true}">
		<c:set var = "totalCruiseCost" scope = "page" value = "0"/>
		<c:set var = "totalCruiseMarkup" scope = "page" value = "0"/>
		<c:forEach var="cruiseList" items="${QTN_OBJ.cruiseVoList}">
			<c:set var="totalCruiseCost" value="${totalCruiseCost + cruiseList.cruiseStayCost}" scope="page"/>
			<c:set var="totalCruiseMarkup" value="${totalCruiseMarkup + cruiseList.cruiseStayMarkup}" scope="page"/>
		</c:forEach>
		<c:set var="grandTotalCost"  value="${grandTotalCost + totalCruiseCost}" scope="page"/>
		<c:set var="grandTotalMarkup" value="${grandTotalMarkup + totalCruiseMarkup}" scope="page"/>
	</c:if>
	<c:if test="${QTN_OBJ.tourPackage eq true}">
		<c:set var = "totalPackageCost" scope = "page" value = "0"/>
		<c:set var = "totalPackageMarkup" scope = "page" value = "0"/>
		<c:forEach var="packageList" items="${QTN_OBJ.tourPackageVoList}">
			<c:set var="totalPackageCost" value="${totalPackageCost + packageList.pkgCost}" scope="page"/>
			<c:set var="totalPackageMarkup" value="${totalPackageMarkup + packageList.pkgMarkup}" scope="page"/>
		</c:forEach>
		<c:set var="grandTotalCost"  value="${grandTotalCost + totalPackageCost}" scope="page"/>
		<c:set var="grandTotalMarkup" value="${grandTotalMarkup + totalPackageMarkup}" scope="page"/>
	</c:if>
	<c:if test="${QTN_OBJ.others eq true}">
		<c:set var = "totalOthersCost" scope = "page" value = "0"/>
		<c:set var = "totalOthersMarkup" scope = "page" value = "0"/>
		<c:forEach var="otherList" items="${QTN_OBJ.otherVoList}">
			<c:set var="totalOthersCost" value="${totalOthersCost + otherList.serviceCost}" scope="page"/>
			<c:set var="totalOthersMarkup" value="${totalOthersMarkup + otherList.serviceMarkup}" scope="page"/>
		</c:forEach>
		<c:set var="grandTotalCost"  value="${grandTotalCost + totalOthersCost}" scope="page"/>
		<c:set var="grandTotalMarkup" value="${grandTotalMarkup + totalOthersMarkup}" scope="page"/>
	</c:if>
	
	<c:set var = "considerCalculatedCost" scope = "page" value = "true"/>
	<c:if test="${MANUAL_CNF.totalQuotationAmount !=0 && MANUAL_CNF.totalQuotationAmount > grandTotalCost}">
		<c:set var = "considerCalculatedCost" scope = "page" value = "false"/>
	</c:if>
	
	
	
	
	<table style="width:100%;border-collapse: collapse;">
		<c:if test="${QTN_OBJ.flight eq true}">
			<c:if test="${MANUAL_CNF.flightSeperateCostDisplay eq true && MANUAL_CNF.flightGstBreakup eq false}">
					<tr><th style="width:50%;" colspan="4"><font size="5"><b>Flight Cost</b></font></th><td style="border: 1px solid black;" colspan="4"><b><font size="5">INR ${totalFlightCost + totalFlightMarkup }</font></b></td></tr>			
			</c:if>
			<c:if test="${MANUAL_CNF.flightSeperateCostDisplay eq true && MANUAL_CNF.flightGstBreakup eq true}">
				<tr>
					<th>Flight Cost</th><td style="border: 1px solid black;"><b>INR ${totalFlightCost }</b></td>
					<th>Taxable Value</th><td style="border: 1px solid black;"><fmt:formatNumber value="${ totalFlightMarkup - (totalFlightMarkup*18/118)}" maxFractionDigits="2"/> </td>
					<th>Tax Amount </th><td style="border: 1px solid black;"><fmt:formatNumber value="${totalFlightMarkup*18/118}" maxFractionDigits="2"/> </td>
					<th>Flight Total</th><td style="border: 1px solid black;">INR ${totalFlightCost + totalFlightMarkup }</td>
				</tr>
			</c:if>
		</c:if>
		<c:if test="${QTN_OBJ.hotel eq true}">
		
			<c:forEach items="${QTN_OBJ.hotelOptionsWiseMap}" var="entry">
    				<c:set var = "totalHotelCost" scope = "page" value = "0"/>
					<c:set var = "totalHotelMarkup" scope = "page" value = "0"/>
	        			<c:forEach var="hotelObj" items="${entry.value}">
							<c:set var="totalHotelCost" value="${totalHotelCost + hotelObj.hotelStayCost}" scope="page"/>
							<c:set var="totalHotelMarkup" value="${totalHotelMarkup + hotelObj.hotelStayMarkup}" scope="page"/>
	        			</c:forEach>
		
			<c:if test="${MANUAL_CNF.hotelSeperateCostDisplay eq true && MANUAL_CNF.hotelGstBreakup eq false}">
					<tr><th style="width:50%;" colspan="4"><font size="5"><b>Hotel Cost Option (${entry.key})</b></font></th><td style="border: 1px solid black;" colspan="4"><b><font size="5">INR ${totalHotelCost + totalHotelMarkup }</font></b></td></tr>			
			</c:if>
			<c:if test="${MANUAL_CNF.hotelSeperateCostDisplay eq true && MANUAL_CNF.hotelGstBreakup eq true}">
				<tr>
					<th>Hotel Cost Option (${entry.key})</th><td style="border: 1px solid black;"><b>INR ${totalHotelCost }</b></td>
					<th>Taxable Value</th><td style="border: 1px solid black;"><b><fmt:formatNumber value="${ totalHotelMarkup - (totalHotelMarkup*18/118)}" maxFractionDigits="2"/></b> </td>
					<th>Tax Amount </th><td style="border: 1px solid black;"><b><fmt:formatNumber value="${totalHotelMarkup*18/118}" maxFractionDigits="2"/></b> </td>
					<th>Hotel Total Option (${entry.key})</th><td style="border: 1px solid black;background-color:pink;"><b>INR ${totalHotelCost + totalHotelMarkup }</b></td>
				</tr>
			</c:if>
			</c:forEach>
		</c:if>
		
		
		<c:if test="${QTN_OBJ.transfers eq true}">
			<c:if test="${MANUAL_CNF.transfersSeperateCostDisplay eq true && MANUAL_CNF.transfersGstBreakup eq false}">
					<tr><th style="width:50%;" colspan="4"><font size="5"><b>Transfers Cost</b></font></th><td style="border: 1px solid black;" colspan="4"><b><font size="5">INR ${totalTransfersCost + totalTransfersMarkup }</font></b></td></tr>			
			</c:if>
			<c:if test="${MANUAL_CNF.transfersSeperateCostDisplay eq true && MANUAL_CNF.transfersGstBreakup eq true}">
				<tr>
					<th>Transfers Cost</th><td style="border: 1px solid black;"><b>INR ${totalTransfersCost }</b></td>
					<th>Taxable Value</th><td style="border: 1px solid black;"><fmt:formatNumber value="${ totalTransfersMarkup - (totalTransfersMarkup*18/118)}" maxFractionDigits="2"/> </td>
					<th>Tax Amount </th><td style="border: 1px solid black;"><fmt:formatNumber value="${totalTransfersMarkup*18/118}" maxFractionDigits="2"/> </td>
					<th>Transfers Total</th><td style="border: 1px solid black;">INR ${totalTransfersCost + totalTransfersMarkup }</td>
				</tr>
			</c:if>
		</c:if>
		<c:if test="${QTN_OBJ.sightseeing eq true}">
			<c:if test="${MANUAL_CNF.sightSeeingSeperateCostDisplay eq true && MANUAL_CNF.sightSeeingGstBreakup eq false}">
					<tr><th style="width:50%;" colspan="4"><font size="5"><b>Sight Seeing Cost</b></font></th><td style="border: 1px solid black;" colspan="4"><b><font size="5">INR ${totalSightSeeingCost + totalSightSeeingMarkup }</font></b></td></tr>			
			</c:if>
			<c:if test="${MANUAL_CNF.sightSeeingSeperateCostDisplay eq true && MANUAL_CNF.sightSeeingGstBreakup eq true}">
				<tr>
					<th>Sight Seeing Cost</th><td style="border: 1px solid black;"><b>INR ${totalSightSeeingCost }</b></td>
					<th>Taxable Value</th><td style="border: 1px solid black;"><fmt:formatNumber value="${ totalSightSeeingMarkup - (totalSightSeeingMarkup*18/118)}" maxFractionDigits="2"/> </td>
					<th>Tax Amount </th><td style="border: 1px solid black;"><fmt:formatNumber value="${totalSightSeeingMarkup*18/118}" maxFractionDigits="2"/> </td>
					<th>Sight Seeing Total</th><td style="border: 1px solid black;">INR ${totalSightSeeingCost + totalSightSeeingMarkup }</td>
				</tr>
			</c:if>
		</c:if>
		<c:if test="${QTN_OBJ.visa eq true}">
			<c:if test="${MANUAL_CNF.visaSeperateCostDisplay eq true && MANUAL_CNF.visaGstBreakup eq false}">
					<tr><th style="width:50%;" colspan="4"><font size="5"><b>Visa Cost</b></font></th><td style="border: 1px solid black;" colspan="4"><b><font size="5">INR ${totalVisaCost + totalVisaMarkup }</font></b></td></tr>			
			</c:if>
			<c:if test="${MANUAL_CNF.visaSeperateCostDisplay eq true && MANUAL_CNF.visaGstBreakup eq true}">
				<tr>
					<th>Visa Cost</th><td style="border: 1px solid black;"><b>INR ${totalVisaCost }</b></td>
					<th>Taxable Value</th><td style="border: 1px solid black;"><fmt:formatNumber value="${ totalVisaMarkup - (totalVisaMarkup*18/118)}" maxFractionDigits="2"/> </td>
					<th>Tax Amount </th><td style="border: 1px solid black;"><fmt:formatNumber value="${totalVisaMarkup*18/118}" maxFractionDigits="2"/> </td>
					<th>Visa Total</th><td style="border: 1px solid black;">INR ${totalVisaCost + totalVisaMarkup }</td>
				</tr>
			</c:if>
		</c:if>
		<c:if test="${QTN_OBJ.insurance eq true}">
		
		<c:if test="${MANUAL_CNF.insuranceSeperateCostDisplay eq true && MANUAL_CNF.insuranceGstBreakup eq false}">
					<tr><th style="width:50%;" colspan="4"><font size="5"><b>Insurance Cost</b></font></th><td style="border: 1px solid black;" colspan="4"><b><font size="5">INR ${totalInsuranceCost + totalInsuranceMarkup }</font></b></td></tr>			
			</c:if>
			<c:if test="${MANUAL_CNF.insuranceSeperateCostDisplay eq true && MANUAL_CNF.insuranceGstBreakup eq true}">
				<tr>
					<th>Insurance Cost</th><td style="border: 1px solid black;"><b>INR ${totalInsuranceCost }</b></td>
					<th>Taxable Value</th><td style="border: 1px solid black;"><fmt:formatNumber value="${ totalInsuranceMarkup - (totalInsuranceMarkup*18/118)}" maxFractionDigits="2"/> </td>
					<th>Tax Amount </th><td style="border: 1px solid black;"><fmt:formatNumber value="${totalInsuranceMarkup*18/118}" maxFractionDigits="2"/> </td>
					<th>Insurance Total</th><td style="border: 1px solid black;">INR ${totalInsuranceCost + totalInsuranceMarkup }</td>
				</tr>
			</c:if>
		</c:if>
		
		<c:if test="${QTN_OBJ.cruise eq true}">
		<c:if test="${MANUAL_CNF.cruiseSeperateCostDisplay eq true && MANUAL_CNF.cruiseGstBreakup eq false}">
					<tr><th style="width:50%;" colspan="4"><font size="5"><b>Cruise Cost</b></font></th><td style="border: 1px solid black;" colspan="4"><b><font size="5">INR ${totalCruiseCost + totalCruiseMarkup }</font></b></td></tr>			
			</c:if>
			<c:if test="${MANUAL_CNF.cruiseSeperateCostDisplay eq true && MANUAL_CNF.cruiseGstBreakup eq true}">
				<tr>
					<th>Cruise Cost</th><td style="border: 1px solid black;"><b>INR ${totalCruiseCost }</b></td>
					<th>Taxable Value</th><td style="border: 1px solid black;"><fmt:formatNumber value="${ totalCruiseMarkup - (totalCruiseMarkup*18/118)}" maxFractionDigits="2"/> </td>
					<th>Tax Amount </th><td style="border: 1px solid black;"><fmt:formatNumber value="${totalCruiseMarkup*18/118}" maxFractionDigits="2"/> </td>
					<th>Cruise Total</th><td style="border: 1px solid black;">INR ${totalCruiseCost + totalCruiseMarkup }</td>
				</tr>
			</c:if>
		</c:if>

		<c:if test="${QTN_OBJ.tourPackage eq true}">
		<c:if test="${MANUAL_CNF.packageSeperateCostDisplay eq true && MANUAL_CNF.packageGstBreakup eq false}">
					<tr><th style="width:50%;" colspan="4"><font size="5"><b>Tour Package Cost</b></font></th><td style="border: 1px solid black;" colspan="4"><b><font size="5">INR ${totalPackageCost + totalPackageMarkup }</font></b></td></tr>			
			</c:if>
			<c:if test="${MANUAL_CNF.packageSeperateCostDisplay eq true && MANUAL_CNF.packageGstBreakup eq true}">
				<tr>
					<th>Tour Package Cost</th><td style="border: 1px solid black;"><b>INR ${totalPackageCost }</b></td>
					<th>Taxable Value</th><td style="border: 1px solid black;"><fmt:formatNumber value="${ totalPackageMarkup - (totalPackageMarkup*18/118)}" maxFractionDigits="2"/> </td>
					<th>Tax Amount </th><td style="border: 1px solid black;"><fmt:formatNumber value="${totalPackageMarkup*18/118}" maxFractionDigits="2"/> </td>
					<th>Tour Package Total</th><td style="border: 1px solid black;">INR ${totalPackageCost + totalPackageMarkup }</td>
				</tr>
			</c:if>
		</c:if>

		<c:if test="${QTN_OBJ.others eq true}">
		<c:if test="${MANUAL_CNF.otherSeperateCostDisplay eq true && MANUAL_CNF.otherGstBreakup eq false}">
					<tr><th style="width:50%;" colspan="4"><font size="5"><b>Other Services Cost</b></font></th><td style="border: 1px solid black;" colspan="4"><b><font size="5">INR ${totalOthersCost + totalOthersMarkup }</font></b></td></tr>			
			</c:if>
			<c:if test="${MANUAL_CNF.otherSeperateCostDisplay eq true && MANUAL_CNF.otherGstBreakup eq true}">
				<tr>
					<th>Other Services Cost</th><td style="border: 1px solid black;"><b>INR ${totalOthersCost}</b></td>
					<th>Taxable Value</th><td style="border: 1px solid black;"><fmt:formatNumber value="${ totalOthersMarkup - (totalOthersMarkup*18/118)}" maxFractionDigits="2"/> </td>
					<th>Tax Amount </th><td style="border: 1px solid black;"><fmt:formatNumber value="${totalOthersMarkup*18/118}" maxFractionDigits="2"/> </td>
					<th>Other Services Total</th><td style="border: 1px solid black;">INR ${totalOthersCost + totalOthersMarkup }</td>
				</tr>
			</c:if>
		</c:if>
		
		<c:set var="isMultipleHotelOptions" value="${false}"/>
		<c:if test="${QTN_OBJ.hotelOptionsWiseMap.size() > 1}">
	    	<c:set var="isMultipleHotelOptions" value="${true}"/>
		</c:if>



	
		
		
			
				<c:if test="${isMultipleHotelOptions eq true}">
				
					<c:forEach items="${QTN_OBJ.hotelOptionsWiseMap}" var="entry">
    				<c:set var = "totalHotelCost" scope = "page" value = "0"/>
					<c:set var = "totalHotelMarkup" scope = "page" value = "0"/>
	        			<c:forEach var="hotelObj" items="${entry.value}">
							<c:set var="totalHotelCost" value="${totalHotelCost + hotelObj.hotelStayCost}" scope="page"/>
							<c:set var="totalHotelMarkup" value="${totalHotelMarkup + hotelObj.hotelStayMarkup}" scope="page"/>
	        			</c:forEach>
					<tr>
						<th colspan="4" style="border: 1px solid black;width:50%;"><font size="5"><b>Total Nett (incl. all services mentioned) with Hotel Option <c:out value="${entry.key}" /> </b></font> </th>
						<td  colspan="4" style="border: 1px solid black;background-color:pink;">
							<font size="5"><b>INR ${grandTotalCost + grandTotalMarkup + totalHotelCost + totalHotelMarkup}</b></font>
						</td>
					</tr>
					</c:forEach>
				</c:if>
		
				<c:if test="${isMultipleHotelOptions eq false}">
					<tr>
					<th colspan="4" style="width:50%;"><font size="5"><b>Total Nett (incl. all services mentioned)</b></font> </th>
					<c:forEach items="${QTN_OBJ.hotelOptionsWiseMap}" var="entry">
    					<c:set var = "totalHotelCost" scope = "page" value = "0"/>
						<c:set var = "totalHotelMarkup" scope = "page" value = "0"/>
	        			<c:forEach var="hotelObj" items="${entry.value}">
							<c:set var="totalHotelCost" value="${totalHotelCost + hotelObj.hotelStayCost}" scope="page"/>
							<c:set var="totalHotelMarkup" value="${totalHotelMarkup + hotelObj.hotelStayMarkup}" scope="page"/>
	        			</c:forEach>
	        		</c:forEach>
	        		<td  colspan="4" style="border: 1px solid black;background-color:pink;"><font size="5"><b>INR ${grandTotalCost + grandTotalMarkup + totalHotelCost + totalHotelMarkup}</b></font></td>
	        		</tr>
				</c:if>
			
		
</table>
