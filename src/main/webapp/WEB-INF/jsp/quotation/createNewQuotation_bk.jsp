<!DOCTYPE html>
<html>
<jsp:include page="../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>


<style>
table {
  width: 100%;
  height: 20px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 3px auto;
  background: white;
}

th {
  background: #FF4D00;
  height: 25px;
  width: 15%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
}
tr {
  border-bottom: 1px solid #cccccc;
}

td {
  border-right: 1px solid #cccccc;
  padding: 10px;
  transition: all 0.2s;
  text-align: center;
}
input[type=button], input[type=submit], input[type=reset] {
  background-color: green;
  border: none;
  color: white;
  padding: 10px 20px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}

.float-container {
    //border: 3px solid #fff;
    padding: 15px;
}

.float-child-left {
    width: 40%;
    float: left;
    padding: 20px;
    //border: 2px solid red;
}
.float-child-right {
    width: 50%;
    float: left;
    padding: 20px;
    //border: 2px solid red;
}  
  
</style>
<br>
<h2 align="center">Create Quotation</h2>

<body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="float-container">

  <div class="float-child-left">
    <div class="green">
    	<jsp:include page="viewLeadDetailsSide.jsp" />
    </div>
  </div>
  
  <div class="float-child-right">
    <div class="blue">
	<form:form modelAttribute="QTN_OBJ" action="create_create_lead_quotation">
		
		<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
		
		<table style="width:80%;" align="left">
		<tr>
		<th style="background: #FFC300;color:black;"> Quotation Id </th><td>Auto Generated</td>
		<th style="background: #FFC300;color:black;"> Version Id </th><td>Auto Generated</td>
		
		</tr>
		<tr>
			<th style="width:25%;background: #FFC300;color:black;"> Quotation Header </th>
			<td colspan="3" style="text-align:left;">
				<form:input path="quotationName"  style="height:30px;width:280px;margin: auto;"/>
				<b><font color="red"><form:errors path="quotationName" cssClass="error" /></font></b>
			</td>
		</tr>
		<tr>
			<th style="width:25%;background: #FFC300;color:black;" colspan="4"> Services to be included</th>
		</tr>
		<tr>	
			<td style="width:50%;text-align:left;" colspan="2"><label class="container" style="display:inline;"><form:checkbox path="tourPackage" name="tourPackage" /> <span class="checkmark"></span></label>Package &nbsp; <b><font color="red"><form:errors path="tourPackage" cssClass="error" /></font></b></td>
			<td style="width:25%;text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="flight" name="flight"  /><span class="checkmark"></span></label> Flight</td>
			<td style="width:25%;text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="hotel" name="hotel"  /><span class="checkmark"></span></label> Hotel</td>
			
		</tr>
		<tr>	
			<td style="width:25%;text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="transfers" name="transfers"  /><span class="checkmark"></span></label> Transfers</td>
			<td style="width:25%;text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="sightseeing" name="sightseeing"  /><span class="checkmark"></span></label>SightSeeing</td>
			<td style="width:25%;text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="visa" name="visa"  /><span class="checkmark"></span></label>Visa</td>
			<td style="width:25%;text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="insurance" name="insurance"  /><span class="checkmark"></span></label>Insurance</td>
		</tr>
		<tr>
			<td style="width:25%;text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="cruise" name="cruise"  /><span class="checkmark"></span></label>Cruise</td>
			<td style="width:25%;text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="others" name="others"  /><span class="checkmark"></span></label>Others</td>
			<td colspan="2">Please select all applicable services for this quotation.</td>
		</tr>
		<tr>
		<th style="width:50%;background: #FFC300;color:black;" colspan="2">Quotation Status</th>
		<td colspan="2">Created</td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="submit" id="createquotation"  name="createquotation" value="Create Quotation Skeleton" />  
				<a href="view_lead_quotations_list?leadId=${QTN_OBJ.leadEntity.leadId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
		 	</td>
		 </tr>
		
		</table>    
	</form:form>    
    
    
    
    </div>
  </div>
  
</div>
 </body>
  
  </html>
  