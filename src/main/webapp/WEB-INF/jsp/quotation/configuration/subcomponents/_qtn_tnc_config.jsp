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
	
	<br><br><br>

	<h1 align="center">Terms & Conditions</h1>

<li><font size="4"><b>All timings (Flights, Hotels, Transfers are tentative. Please refer vouchers confirmation & flight tickets etc. for accurate details. )</b></font>

<li><font size="4"><b>Bookings - </b> We are not holding any booking and all fares are dynamic and keeps changing. Till the time we officially confirm your booking or send confirmation vouchers, price is subject to change.</font>
<li><font size="4"><b>Hotel- </b>We are not responsible for any hotel quality products or services not rendered by hotel or lack in services or not meeting upto your expecations. We are just a mediator and based on our experience, we can recommend but we dont guarantee. </font>
<li><font size="4"><b>Pricing-</b>All international travel pricing may change based on the fluctuating in currency pricing also.</font>
<li><font size="4">All Credit Card Payment will attract additional payment gateway charge of 2.5% of the billing amount.</font>
<li><font size="4"><b>Visa</b> We are not governing body but just a facilitator and we have no control in Visa. Visa is a sole discretion of embassy granting visa. All applicable penalties in case of Visa rejection will be chargeable to the guest. </font>
<li><font size="4"><b>TCS-</b> As per Govt. Law , we will charge TCS amount seperately of 5% on the top of total amount of your travel cost. We will deposit the same to Income Tax and based on your tax liability either you can make adjustments or take refund as appropriate.</font>
<li><font size="4"><b>TCS-Cancellation</b> Once TCS deducted can not be refunded in any case as it will be depoisited by us even if in case of cancellation. Guest need to settle TCS directly with the income tax department.  </font>
<br><br><br>
<li><font size="4">In case of flight cancellation due to whatsoever reasons including cancellation of flight operation by the concerned airlines, refund of air ticket fare will be processed subject to "cancellation process charges" at the rate of Rs. 350/ and Rs. 600/ for domestic flight and international flight per person per sector respectively.</font> 
<li><font size="4">It may be noted the refund will be as per the airlines policy of cancellation, but it will be attracting "cancellation process charges" as stated above. Nett amount refunded will be the refund received by us from airline/supplier minus cancellation processing charge as mentioned above.</font> 
<li><font size="4">If you miss any flight then all subsequent onward journey flight/s ticket/s will get automatically canceled including your all return flight/s. There shall be no refund given by the airlines in such cases. Auto cancellation is done by airlines believing that person missing flight is not traveling and thus all onward journey flight/s ticket/s and return journey flight/s tickets must be made available to other potential passenger.</font>


	
<h2>Covid Guideline</h2>
<li><font size="4">Guests/Customers are requested to obtain necessary RT-PCR or vaccination or any other applicable information/requirements before booking or traveling. We will not be responsible for any policy change or any issues arising because of this or any travel restrictions applied.</font>  
<li><font size="4">All customers should wear a mask, face shield, gown (if applicable) and sanitize their hands before proceeding to the boarding gate.</font>
<li><font size="4">Customers must wear a face mask covering their nose and mouth, throughout their journey. The mask may be removed while eating and drinking.</font>
<li><font size="4">Please maintain appropriate social distancing while boarding and de-boarding the aircraft.</font>
<li><font size="4">Kindly adhere to all the announcements and other directives issued by our ground staff and/or crew at all points of time during your journey.</font>
<li><font size="4">Customers are also requested to familiarise themselves with the guidelines for air passengers published by the Indian Ministry of Civil Aviation on the following link:</font>
<li><font size="4">https://www.civilaviation.gov.in/sites/default/files/Guidelines_for_Air_Passengers_21May.pdf https://www.civilaviation.gov.in/sites/default/files/State_wise_quarantine_regulation-converted.pdf
* The details should also be confirmed from the website of the concerned State Government</font>
Caution: Customers are advised to strictly follow all COVID-19 protocols. Failure to comply with these guidelines and the directions of our ground staff and/or crew may attract penal action against the concerned individual.


<c:if test="${MANUAL_CNF.showBankAccounts eq true}">

<h2 align="center">Our Bank Accounts</h2>
<table style="width:100%;border: 1px solid black;text-align:center;">
<tr><th>ICICI Bank</th><th>ICICI Bank</th><th>HDFC Bank</th></tr>
<tr>
<td style="border: 1px solid black;text-align:left;width:33%;">
	<table style="width:100%;">
		<tr><th>Bank</th><td style="border: 1px solid black;text-align:center;">ICICI Bank</td></tr>
		<tr><th>Beneficiary Name </th><td style="border: 1px solid black;text-align:center;">UdanChoo Travels</td></tr>
		<tr><th>ICICI Bank A/c No.</th><td style="border: 1px solid black;text-align:center;">1944-0500-0171</td></tr>
		<tr><th>IFSC Code</th><td style="border: 1px solid black;text-align:center;">ICIC0001944</td></tr>
		<tr><th>Branch</th><td style="border: 1px solid black;text-align:center;">Janakpuri, New Delhi</td></tr>
		<tr><th>A/c Type</th><td style="border: 1px solid black;text-align:center;">Current</td></tr>
	</table>
</td>
<td>
	<table style="width:100%;">
		<tr><th>Bank</th><td style="border: 1px solid black;text-align:center;">ICICI Bank</td></tr>
		<tr><th>Beneficiary Name </th><td style="border: 1px solid black;text-align:center;">UdanChoo Travels</td></tr>
		<tr><th>ICICI Bank A/c No.</th><td style="border: 1px solid black;text-align:center;">6296-0501-6197</td></tr>
		<tr><th>IFSC Code</th><td style="border: 1px solid black;text-align:center;">ICIC0006296</td></tr>
		<tr><th>Branch</th><td style="border: 1px solid black;text-align:center;">Vikas Puri, New Delhi</td></tr>
		<tr><th>A/c Type</th><td style="border: 1px solid black;text-align:center;">Current</td></tr>
	</table>

</td>
<td>
	<table style="width:100%;">
		<tr><th>Bank</th><td style="border: 1px solid black;text-align:center;">HDFC Bank</td></tr>
		<tr><th>Beneficiary Name </th><td style="border: 1px solid black;text-align:center;">UdanChoo Travels</td></tr>
		<tr><th>HDFC Bank A/c No.</th><td style="border: 1px solid black;text-align:center;">5020-0039-8272-00</td></tr>
		<tr><th>IFSC Code</th><td style="border: 1px solid black;text-align:center;">HDFC0001127</td></tr>
		<tr><th>Branch</th><td style="border: 1px solid black;text-align:center;">Mianwali Nagar,Peera Garhi, New Delhi</td></tr>
		<tr><th>A/c Type</th><td style="border: 1px solid black;text-align:center;">Current</td></tr>
	</table>
</td>
</tr>
<tr>
	<th>UPI Payment </th><td colspan="2" style="border: 1px solid black;text-align:center;">udanchu@icici</td>
</tr>
<tr>
	<th>Payment Gateway Link (2.5% Convenience Fee Extra)</th><td colspan="2" style="border: 1px solid black;text-align:center;">https://pages.razorpay.com/udanchoo</td>
</tr>
</table>
</c:if>

 

	