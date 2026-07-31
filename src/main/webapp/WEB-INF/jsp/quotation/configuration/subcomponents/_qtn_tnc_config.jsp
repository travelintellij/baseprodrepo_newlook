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
<h2 align="center" style="margin-top: 20px; margin-bottom: 15px;">Terms & Conditions</h2>
<ul style="margin: 0; padding-left: 20px; line-height: 1.4; font-size: 0.95rem;">
    <li style="margin-bottom: 6px;"><strong>Tax Collected at Source (TCS) – International Travel</strong>: As per prevailing Government of India regulations, applicable Tax Collected at Source (TCS) on international travel packages shall be charged extra as applicable at the time of booking/payment. The applicable TCS amount can be claimed or adjusted by the traveler while filing their Income Tax Return (ITR), subject to prevailing tax regulations.</li>
    <li style="margin-bottom: 6px;"><strong>TCS Refund Policy</strong>: Any TCS amount collected and deposited with the government authorities cannot be refunded by us under any circumstances, including cancellation cases. Travelers may claim eligible adjustments/refunds directly through the Income Tax filing process.</li>
    <li style="margin-bottom: 6px;"><strong>Booking Confirmation & Pricing</strong>: All prices, hotel rates, airfare, transportation charges, and package costs are dynamic and subject to change until the booking is officially confirmed and confirmation vouchers/tickets are issued. No booking is considered confirmed unless explicitly communicated by us.</li>
    <li style="margin-bottom: 6px;"><strong>Flight, Hotel & Transfer Timings</strong>: All schedules, timings, and operational details shared at quotation stage are tentative and subject to change. Guests are requested to refer to final vouchers, tickets, and confirmations for accurate details.</li>
    <li style="margin-bottom: 6px;"><strong>Hotel Responsibility Disclaimer</strong>: Hotels, airlines, transport providers, activity operators, and other service providers operate independently. While we carefully select suppliers and provide recommendations based on experience, we shall not be responsible for service deficiencies, quality issues, operational changes, overbooking situations, or services not meeting personal expectations.</li>
    <li style="margin-bottom: 6px;"><strong>Currency Fluctuation (International Travel)</strong>: International package pricing may vary due to fluctuations in foreign exchange rates, supplier revisions, taxes, fuel surcharges, or government regulations until final confirmation.</li>
    <li style="margin-bottom: 6px;"><strong>Payment Charges</strong>: Payments made through credit cards may attract additional payment gateway charges, banking charges, convenience fees, or merchant charges as applicable.</li>
    <li style="margin-bottom: 6px;"><strong>Visa Disclaimer</strong>: Visa approval, rejection, processing timelines, documentation requirements, or entry permissions are solely at the discretion of the respective embassy/consulate/immigration authorities. We act only as a facilitator and cannot guarantee visa issuance. Any cancellation charges, supplier penalties, or losses arising due to visa rejection shall be borne by the traveler.</li>
    <li style="margin-bottom: 6px;"><strong>Flight Cancellation & Refund Processing Charges</strong>: In case of flight cancellations, modifications, partial utilization, no-show situations, or supplier cancellations, refunds (if applicable) shall be processed as per airline/supplier policy.<br/>In addition to airline/supplier cancellation charges, refund processing charges shall apply as below:<br/>• Domestic Flights: RS 300 (plus gst) per person per sector<br/>• International Flights: RS 500(plus gst) per person per sector<br/>Final refund payable shall be calculated as: Refund received from airline/supplier LESS applicable processing charges = Net Refund Payable</li>
    <li style="margin-bottom: 6px;"><strong>Force Majeure</strong>: We shall not be liable for delays, cancellations, losses, itinerary changes, or additional expenses arising due to circumstances beyond our control including but not limited to natural disasters, weather conditions, political disturbances, strikes, pandemics, airline operational issues, government restrictions, or other unforeseen events.</li>
    <li style="margin-bottom: 6px;"><strong>Traveler Responsibility</strong>: Guests are responsible for ensuring validity of passports, visas, travel documents, vaccination requirements, permits, and compliance with destination-specific regulations.</li>
    <li style="margin-bottom: 6px;"><strong>Acceptance of Terms</strong>: Payment towards booking shall be considered acceptance of all terms, conditions, cancellation policies, and supplier rules applicable to the booking.</li>
</ul>


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

 

	