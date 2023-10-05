<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">




<style>
table {
  width: 80%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
}

th {
  background: #7B68EE;
  height: 40px;
  width: 10%;
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

.heavyTable {
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
  animation: float 5s infinite;
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

</style>

<br>
<center>
		<h2>
			Add Visa Master
		</h2>
	</center>
	
<body>
<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<form:form method="post" action="add_add_visa_master" modelAttribute="visa_obj">
			<table style="width:80%; border:1px;border-collapse: collapse;text-align:center;">
			<tr>
			<td colspan="2">&nbsp;</td>
			<th colspan="2" style="width:20%;">Country Name</th>
			<td colspan="2" style="width:20%; padding-bottom: 15px; vertical-align: bottom;">
				<input style="width:250px;" type="text" id="countryName"  name="countryName" placeholder="country name" required />
				<input type="hidden" name="countryCode" id="countryCode" />
			</td>
			<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
			<th style="width:10%;">Consulate City</th>
			 <td style="width:10%; padding-bottom: 5px;">
				<div class="select">
				<select id="consulateCity" name="consulateCity" style="margin: 2px; width: 180px;" required>
					<option class="service-small" value="" selected>Please Select</option>
				</select>
				</div>
			</td>
			<th style="width:10%;">Visa Profile</th>
			<td style="width:10%;">
				<div class="select">
				<select name="profile" style="margin: 2px; width: 150px;" required>
					<option class="service-small" value="" selected>Please Select</option>
					<c:if test="${not empty VISA_PROFILE}">
	       				<c:forEach items="${VISA_PROFILE}" var="visaProfile">
	      						<option class="service-small" value="${visaProfile.key}">${visaProfile.value}</option>
	   					</c:forEach>
	 				</c:if>
	 			</select>
			</div>
			</td>
			<th style="width:10%;">Visa Type</th>
			<td style="width:10%;">
				<div class="select">
				<select name="visaType" style="margin: 2px; width: 150px;" required>
					<option class="service-small" value="" selected>Please Select</option>
					<c:if test="${not empty VISA_TYPE}">
	       				<c:forEach items="${VISA_TYPE}" var="visaType">
	      						<option class="service-small" value="${visaType.key}">${visaType.value}</option>
	   					</c:forEach>
	 				</c:if>
	 			</select>
			</div>
			</td>
			<th style="width:10%;">Visa Purpose</th>
			<td style="width:10%;">
				<div class="select">
				<select name="visaPurpose" style="margin: 2px; width: 150px;" required>
					<option class="service-small" value="" selected>Please Select</option>
					<c:if test="${not empty VISA_PURPOSE}">
	       				<c:forEach items="${VISA_PURPOSE}" var="visaPurpose">
	      						<option class="service-small" value="${visaPurpose.key}">${visaPurpose.value}</option>
	   					</c:forEach>
	 				</c:if>
	 			</select>
			</div>
			</td>

			
			</tr>
			<tr>
			<th style="width:10%;">Standard Cost</th>
			<td style="width:10%; padding-bottom: 5px;">
				<input style="width:100px;" type="text" name="standardCost"  />
			</td>
			<th style="width:10%;">B2B Price</th>
			<td style="width:10%; padding-bottom: 5px;">
				<input style="width:100px;" type="text" name="standardB2bPrice" />
			</td>
			<th style="width:10%;">B2C Price</th>
			<td style="width:10%; padding-bottom: 5px;">
				<input style="width:100px;" type="text" name="standardB2cPrice"  />
			</td>
			
		<th style="width:10%;">Processing Time</th>
			 <td style="width: 10%; padding-bottom: 5px;">
				<input style="width:50px;" type="text" name="processingTime" /> Days
			</td>	
			</tr>

			<tr>
				<th style="width:10%;" colspan="4">Internal Remarks (Will never be shared with clients)</th>
				<th style="width:10%;" colspan="4">Other Costs (Like extended validity visa options)</th>
			</tr>
			<tr>
				<td colspan="4" style="text-align:center;">
					 <textarea style="width: 500px; height: 100px;border: 2px solid green; border-radius: 4px;" rows="3" cols="1500" name="internalRemarks" htmlEscape="false" maxlength="1040"></textarea>
				</td>

				<td colspan="4" style="text-align:center;">
					 <textarea style="width: 500px; height: 100px;border: 2px solid green; border-radius: 4px;" rows="3" cols="1500" name="otherCosts" htmlEscape="false" maxlength="1040"></textarea>
				</td>
			</tr>
					<tr>
				<th style="width:10%;" colspan="8">Remarks</th>
			</tr>
			<tr>
				<td colspan="8">
					 <textarea style="width: 1000px; height: 200px;border: 2px solid green; border-radius: 4px;" rows="3" cols="1500" name="remarks" htmlEscape="false" maxlength="1995"></textarea>
				</td>
			</tr>	
			
			<tr>
				<td colspan="8">
					<input type="submit" name="submit" value="Add and Proceed" />
					<a href="view_search_visa_form" ><input type="button" style="background-color:blue;" value="Search Visa Master" /></a>		
				</td>
			</tr>
			</table>
	</form:form>


<script>
	/*
	$('#countryName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getCountryList',
	paramName: "countryName",
	delimiter: ",",
	onSelect: function(suggestion) {
        cityID = suggestion.data;
        id=cityID;
        jQuery("#countryCode").val(cityID);
        $('input[name=countryCode]').val(id);
        return false;
    },
	transformResult: function(response) {
        return {
            suggestions: $.map($.parseJSON(response), function(item) {
            	return { value: item.countryName, data: item.countryCode };
            })
            
        };
    }
});
	
	*/
	
	$('#countryName').autocomplete({
		serviceUrl: '${pageContext.request.contextPath}/getCountryConsulateList',
		paramName: "countryName",
		delimiter: ",",
		onSelect: function(suggestion) {
			$('#consulateCity').empty();
			$('#consulateCity').append($("<option class='service-small'>").val("").text("Please Select"));
			$.each(suggestion.consCityList, function(key, value) {
				$('#consulateCity').append($("<option class='service-small'>").val(key).text(value));
			});
			cityID = suggestion.data;
	        id=cityID;
	        jQuery("#countryCode").val(cityID);
	        $('input[name=countryCode]').val(id);
	        return false;
	    },
		transformResult: function(response) {
	        return {
	            suggestions: $.map($.parseJSON(response), function(item) {
	            	return { value: item.countryName, data: item.countryCode,consCityList : item.cityKeyValue };
	            })
	            
	        };
	        
	    }
	});
	
</script>


</body>
