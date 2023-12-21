<!DOCTYPE html>
<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<html>
<head>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<style>
table {
	  width: 100%;
	  border-collapse: collapse;
	  border: 1px solid #38678f;
	  //margin: 5px auto;
	  background: white;
	}
	
	th {
	  background: #D33F14;
	  width: 50%;
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
	  padding: 5px;
	  transition: all 0.2s;
	  text-align: center;
	}
	
	.heavyTable {
	  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
	  animation: float 5s infinite;
	}
	input[type="radio"] {
		display: inline-block;
		opacity: 1;
		width: 1em;
		z-index: -1;
	}

select {
	appearance: none;
	outline: 0;
	background: lightblue;
	background-image: none;
	width: 80%;
	height: 100%;
	color: black;
	cursor: pointer;
	border: 1px solid black;
	border-radius: 3px;
	text-indent: 2px;
}

.select {
	position: relative;
	display: block;
	height: 2.5em;
	line-height: 3;
	overflow: hidden;
	border-radius: .25em;
	padding-bottom: 10px;
	padding-top: 10px;
}

.select option.service-small {
	font-size: 20px;
	padding: 25px;
	background: lightgreen;
}


input[type=button], input[type=submit], input[type=reset] {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
}
	</style>
</head>
<br>
<br>
<br>
<br>
<br>
<br>

<br>
<br>
<br>
<h2 align="center">Edit Client Details</h2>
<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<body style="background-color: creamwhite;">
	<form:form method="post" action="edit_edit_admin_client" modelAttribute="CLIENT_OBJ" >
	<input type="hidden" name="clientId" value="${CLIENT_OBJ.clientId}" />
	<table>
		<tr>
			<td  style="width:40%;">
				<table>
				<caption><font size="3"><b><mark>Client Id - ${CLIENT_OBJ.clientId}</mark></b></font></caption>
				<tr>
					<th>Client Name</th>
					<td><input class="contact" type="text" name="clientName" value="${CLIENT_OBJ.clientName}" required/><br>
					<font color="red"><form:errors path="clientName" cssClass="error" /></font></td>
				</tr>
				<tr>
					<th>Client Address</th>
					<td><textarea rows="3" cols="50" name="address" maxlength="250">${CLIENT_OBJ.address}</textarea><br>
					<font color="red"><form:errors path="address" cssClass="error" /></font></td>
				</tr>
				<tr>
					<th>City</th>
					<td><input type="text" name="cityName" id="cityName" size="35" value="${CLIENT_OBJ.cityName}"/> 
					<input type="hidden" name="cityId" value="${CLIENT_OBJ.cityId}" /></td>
				</tr>
				<tr>
					<th>Country</th>
					<td><input type="text" name="countryName" id="countryName" size="35" value="${CLIENT_OBJ.countryName}" /> 
					<input type="hidden"  name="countryId" value="${CLIENT_OBJ.countryId}" /></td>
				</tr>
				<tr>
					<th>Email</th>
					<td><input class="contact" type="text" name="email" value="${CLIENT_OBJ.email}" /><br>
					<font color="red"><form:errors path="email" cssClass="error" /></font></td>
				</tr>
				<tr>
					<th>Mobile</th>
					<td><input class="contact" type="number" name="mobile" style="height:30px;" step="1" value="${CLIENT_OBJ.mobile}" /><br>
					<font color="red"><form:errors path="mobile" cssClass="error" /></font></td>
				</tr>
				<tr>
					<th>Phone</th>
					<td><input class="contact" type="number" name="phone" style="height:30px;" step="1" value="${CLIENT_OBJ.phone}" /><br>
					<font color="red"><form:errors path="phone" cssClass="error" /></font></td>
				</tr>
				<tr><td colspan="2">&nbsp;</td></tr>
				</table>
			</td>
			<td  style="width:40%;">
				<table>
				<tr>
					<th>Company Details</th>
					<td><textarea rows="3" cols="50" name="companyDetails" maxlength="250">${CLIENT_OBJ.companyDetails}</textarea><br>
					<font color="red"><form:errors path="companyDetails" cssClass="error" /></font></td>
				</tr>
				<tr>
					<th>Referred By</th>
					<td><input class="contact" type="text" name="referredBy" value="${CLIENT_OBJ.referredBy}"  /><br>
					<font color="red"><form:errors path="referredBy" cssClass="error" /></font></td>
				</tr>
				<tr>
					<th>GST Details</th>
					<td><input class="contact" type="text" name="gstDetails" value="${CLIENT_OBJ.gstDetails}" /><br>
					<font color="red"><form:errors path="gstDetails" cssClass="error" /></font></td>
				</tr>
				<tr>
					<th>Bank Details</th>
					<td><textarea rows="3" cols="50" name="bankDetails" maxlength="250">${CLIENT_OBJ.bankDetails}</textarea><br>
					<font color="red"><form:errors path="bankDetails" cssClass="error" /></font></td>
				</tr>
				<tr>
					<th>Passport Number</th>
					<td><input class="contact" type="text" name="passportNumber" value="${CLIENT_OBJ.passportNumber}" /> </td>
				</tr>
				<tr>
					<td colspan="2">
						<table>
						<tr>
							<th>Passport Expiry</th>
							<th>DOB</th>
							<th>DOA</th>
						</tr>
						<tr>
							<td><input type="date" name="passportExpiry" value="${CLIENT_OBJ.passportExpiry}" /></td>
							<td><input type="date" name="birthDate" value="${CLIENT_OBJ.birthDate}"/></td>
							<td><input type="date" name="anniversaryDate" value="${CLIENT_OBJ.anniversaryDate}"/></td>

						</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th>Active</th>
						<td style="text-align:center">
					 		<div class="select" style="width:120px;">
								<select id = "active" name = "active" style="width:100px;">
								   <c:if test="${CLIENT_OBJ.active eq true }">
							   		<option class="service-small" value = "true" selected> <c:out value = "True"/></option>
							   		<option class="service-small" value = "false"> <c:out value = "False"/></option>
							   	</c:if>
							 	<c:if test="${CLIENT_OBJ.active eq false}">
							   		<option class="service-small" value = "true" > <c:out value = "True"/></option>
							   		<option class="service-small" value = "false" selected> <c:out value = "False"/></option>
	
							   	</c:if>
							</select>
						</div>
					</td>
				</tr>
				</table>
				</td>
				
				<td  style="width:20%;"> 
				<table>
					<tr><th colspan="2" style="background-color:steelblue;">Personal Preferences</th></tr>
					
					<tr><th style="background-color:steelblue;">Hotel Preferences </th> 
					<td>
						<div class="select">
							<select id = "type" name = "hotelPref" style="width:120px;">
							   <option class="service-small" value = "0">  Please Select  </option>
							   <c:forEach var = "i" begin = "1" end = "5">
							   		<c:if test="${i != CLIENT_OBJ.hotelPref }">
							   			<option class="service-small" value = "${i}"> <c:out value = "${i}"/> Star</option>
							   		</c:if>
							   		<c:if test="${i == CLIENT_OBJ.hotelPref }">
    	     								<option class="service-small" value = "${i}" selected> <c:out value = "${i}"/> Star</option>
    	     						</c:if>
							   </c:forEach>
							</select>
						</div>
					</td>
					</tr>
					
					<tr>
						<th style="background-color:steelblue;"> Cost Savy </th>
						<td>
							<div class="select">
								<select id = "type" name = "costSavvy" style="width:120px;">
									<option class="service-small" value = "0">  Please Select  </option>
									<c:forEach var = "i" begin = "1" end = "10">
    	     							<c:if test="${i != CLIENT_OBJ.costSavvy }">
    	     								<option class="service-small" value = "${i}"> <c:out value = "${i}"/></option>
    	     							</c:if>
    	     							<c:if test="${i == CLIENT_OBJ.costSavvy }">
    	     								<option class="service-small" value = "${i}" selected> <c:out value = "${i}"/></option>
    	     							</c:if>
      								</c:forEach>
      							</select>
      						</div>
									(Scale 1 to 10) 
						</td>
						</tr>
					
					
					<tr><th style="background-color:steelblue;"> Service Savvy</th>
					 <td>
							<div class="select">
								<select id = "type" name = "serviceSavvy" style="width:120px;">
									<option class="service-small" value = "0">  Please Select  </option>
									<c:forEach var = "i" begin = "1" end = "5">
    	     							<c:if test="${i != CLIENT_OBJ.serviceSavvy }">
    	     								<option class="service-small" value = "${i}"> <c:out value = "${i}"/></option>
    	     							</c:if>
    	     							<c:if test="${i == CLIENT_OBJ.serviceSavvy }">
    	     								<option class="service-small" value = "${i}" selected> <c:out value = "${i}"/></option>
    	     							</c:if>
      								</c:forEach>
      							</select>
      						</div>
      						(Scale 1 to 5)
					</td>
					</tr>
					<tr><th style="background-color:steelblue;"> Food Pref.</th>
					<td>
						<div class="select">
							<select id = "type" name = "foodPref" style="width:120px;">
							   	<c:if test="${CLIENT_OBJ.foodPref eq 'nveg'}">
							   		<option class="service-small" value = "veg" > Veg</option>
							   		<option class="service-small" value = "nveg" selected> Non-Veg</option>
							   	</c:if>
							   	<c:if test="${CLIENT_OBJ.foodPref ne 'nveg'}">
							   		<option class="service-small" value = "veg" selected> Veg</option>
							   		<option class="service-small" value = "nveg"> Non-Veg</option>
							   	</c:if>
							   	
							</select>
						</div>					
					</td>
					</tr>
					<tr><th style="background-color:steelblue;"> Aggressiveness</th>
					 <td>
							<div class="select">
								<select id = "type" name = "aggressiveness" style="width:120px;">
									<option class="service-small" value = "0">  Please Select  </option>
									<c:forEach var = "i" begin = "1" end = "5">
    	     							<c:if test="${i != CLIENT_OBJ.aggressiveness }">
    	     								<option class="service-small" value = "${i}"> <c:out value = "${i}"/></option>
    	     							</c:if>
    	     							<c:if test="${i == CLIENT_OBJ.aggressiveness }">
    	     								<option class="service-small" value = "${i}" selected> <c:out value = "${i}"/></option>
    	     							</c:if>
      								</c:forEach>
      							</select>
      						</div>
      						(Scale 1 to 5)
					</td>
					</tr>
					
					<tr><th style="background-color:steelblue;">Payment Record</th>
					 <td>
							<div class="select">
								<select id = "type" name = "paymentRating" style="width:120px;">
									<option class="service-small" value = "0">  Please Select  </option>
									<c:forEach var = "i" begin = "1" end = "5">
    	     							<c:if test="${i != CLIENT_OBJ.paymentRating }">
    	     								<option class="service-small" value = "${i}"> <c:out value = "${i}"/></option>
    	     							</c:if>
    	     							<c:if test="${i == CLIENT_OBJ.paymentRating }">
    	     								<option class="service-small" value = "${i}" selected> <c:out value = "${i}"/></option>
    	     							</c:if>
      								</c:forEach>
      							</select>
      						</div>
      						(Scale 1 to 5)
					</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<th>Remarks</th>
					<td colspan="2" style="text-align:left;"><textarea rows="4" cols="100" name="remarks" maxlength="250">${CLIENT_OBJ.remarks}</textarea><br>
					<font color="red"><form:errors path="remarks" cssClass="error" /></font></td>

			</tr>	 
				 
			<tr>
					<td colspan="3" style="text-align: center;"><input type="submit" value="Update Client" style="background-color: green;">
					<a href="view_form_admin_search_client"><input type="button" style="width: 140px;background-color: blue;" value="Client Listing"></a> 
					 </td>
			</tr>
		</table>
	</form:form>
<script>
	$('#cityName').autocomplete({
		serviceUrl : '${pageContext.request.contextPath}/getCityList',
		paramName : "cityName",
		delimiter : ",",
		onSelect : function(suggestion) {
			cityID = suggestion.data;
			id = cityID;
			jQuery("#destinationId").val(cityID);
			$('input[name=cityId]').val(id);
			return false;
		},
		transformResult : function(response) {
			return {
				suggestions : $.map($.parseJSON(response), function(item) {
					return {
						value : item.cityName,
						data : item.destinationId
					};
				})

			};
		}
	});
	
	
	$('#countryName').autocomplete({
		serviceUrl: '${pageContext.request.contextPath}/getCountryList',
		paramName: "countryName",
		delimiter: ",",
		onSelect: function(suggestion) {
	        cityID = suggestion.data;
	        id=cityID;
	        jQuery("#destinationId").val(cityID);
	        $('input[name=countryId]').val(id);
	        return false;
	    },
		transformResult: function(response) {
	        return {
	            suggestions: $.map($.parseJSON(response), function(item) {
	            	return { value: item.countryName, data: item.destinationId };
	            })
	            
	        };
	    }
	});
</script>

</body>
</html>

