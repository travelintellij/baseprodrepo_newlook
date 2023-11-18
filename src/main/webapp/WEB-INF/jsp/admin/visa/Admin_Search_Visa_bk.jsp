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
input[type="radio"]{
    -webkit-appearance: radio;
    display: inline;
}

</style>

<br>
<center>
		<h2>
			Search Visa Master
		</h2>
	</center>
	
<body style="background-color: white;">
<br>
<br>
<br>
<br>
<br>
<br>
<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<form:form method="post" action="search_search_visa_master" modelAttribute="visa_obj">
		<input type="hidden" id="countryCode" name="countryCode" />
		<table style="width:30%;border:0px; border-collapse: collapse;" >
					<tr><td style="padding: 15px;border:0px;"> <input style="width:600px;height: 50px; border-color: blue !important;" type="text" id="countryName"  name="countryName" placeholder="country name" required /> </td></tr>
					<tr><td style="border:0px;"><input type="submit" name="submit" value="Search Visa Details" /></td></tr>
		</table>	
	</form:form>
		
		<div align="center">${VISA_COUNT_MSG}</div> 
		
		<c:if test="${not empty VISA_RESULT_SET}">
			<form:form modelAttribute="EMAIL_VISA_MASTER" action="view_email_visa_master_docs_form">
				<input type="hidden" id="countryName" name="countryName" value="${COUNTRY_NAME}" />
				<input type="hidden" id="countryCode" name="countryCode" value="${COUNTRY_CODE}" />
				<table border="1 px;" style="width:80%; border-collapse: collapse;"  align="center">
					<tr style="background-color:pink;"><td colspan="7">&nbsp;</td>
						<td><input type="radio" id="visaCostToIncludeList" name="visaCostToIncludeList" value="b2bcost"> <b>With B2B Cost</b></td>
						<td><input type="radio" id="visaCostToIncludeList" name="visaCostToIncludeList" value="b2ccost" checked> <b>With B2C Cost</b></td>
						<td><input type="radio" id="visaCostToIncludeList" name="visaCostToIncludeList" value="bothcosts" > <b>Both Costs</b></td>
						<td><input type="Submit" name="emailVisaDocsList" value="Email Selected" style="background-color:blue;"/></td>
					</tr>
					
					<tr>
						<th style="width:9%;">Country Name</th>
						<th style="width:9%;">Consulate City</th>
						<th style="width:9%;">Visa Profile</th>
						<th style="width:9%;">Visa Type</th>
						<th style="width:9%;">Visa Purpose</th>
						<th style="width:9%;">Processing Time</th>
						<th style="width:9%;">Standard Cost</th>
						<th style="width:9%;">B2B Price</th>
						<th style="width:9%;">B2C Price</th>
						<th style="width:20%;" colspan="2">Action</th>
					</tr>
					<c:forEach var="visaMasterObj" items="${VISA_RESULT_SET}">
					<tr>
						<td style="width:9%;">${visaMasterObj.countryName}</td>
						<td style="width:9%;">${visaMasterObj.cityName}</td>
						<td style="width:9%;">${VISA_PROFILE.get(visaMasterObj.profile)}</td>
						<td style="width:9%;">${VISA_TYPE.get(visaMasterObj.visaType)}</td>
						<td style="width:9%;">${VISA_PURPOSE.get(visaMasterObj.visaPurpose)}</td>
						<td style="width:9%;">${visaMasterObj.processingTime} Days</td>
						<td style="width:9%;">${visaMasterObj.standardCost}</td>
						<td style="width:9%;">${visaMasterObj.standardB2bPrice}</td>
						<td style="width:9%;">${visaMasterObj.standardB2cPrice}</td>
						<td style="width:10%;border:0;">
							<input type="checkbox" id="visaIdListToEmail" name="visaIdListToEmail" value="${visaMasterObj.visaId}"> <b>Email</b>
						</td>
						<td style="width:10%;border:0;">
							<a href="view_list_visa_proceed_docs_form?visaId=${visaMasterObj.visaId}" ><input type="button" style="background-color:green;" value="View Details" /></a>
								
								<!-- 
								<form:form method="post" action="view_list_visa_proceed_docs_form" modelAttribute="VISA_OBJ">
										<input type="hidden" name="visaId" value="${visaMasterObj.visaId}" />
										<input type="submit" name="submit" value="View Details" style="padding: 6px 12px;"  />
								</form:form>
								 -->	
						</td>
					</tr>
					</c:forEach>
				</table>
			</form:form>
		</c:if>
			

		
	


<script>
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
</script>


</body>
