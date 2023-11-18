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
<br>
<br>
<br>
<br>
<center>
		<h2>
			Search Visa Consulate
		</h2>
	</center>
	
<body style="background-color: white;">

<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<form:form method="post" action="search_search_visa_consulate" modelAttribute="VISA_CONSULATE_SEARCH">
		<div align="center"><font color="red"><b><form:errors path="*" class="has-error" /></b></font></div>
		<input type="hidden" id="countryCode" name="countryCode" />
		<table style="width:30%;border:0px; border-collapse: collapse;" >
					<tr><td style="padding: 15px;border:0px;"> <input style="width:600px;height: 50px; border-color: blue !important;" type="text" id="countryName"  name="countryName" placeholder="country name" required /> </td></tr>
					<tr><td style="border:0px;"><input type="submit" name="submit" value="Search Visa Details" /></td></tr>
		</table>	
	</form:form>
		
		<div align="center">${VISA_CONSULATE_COUNT_MSG}</div> 
		
		<c:if test="${not empty VISA_CONSULATE_RESULT_SET}">
			<form:form modelAttribute="EMAIL_VISA_MASTER" action="view_email_visa_master_docs_form">
				<table border="1 px;" style="width:80%; border-collapse: collapse;"  align="center">
					<tr>
						<th style="width:10%;">Consulate #</th>
						<th style="width:10%;">Country Name</th>
						<th style="width:10%;">Consulate City</th>
						<th style="width:10%;">Title</th>
						<th style="width:20%;" colspan="2">Action</th>
					</tr>
					<c:forEach var="visaConsulateObj" items="${VISA_CONSULATE_RESULT_SET}">
					<tr>
						<td style="width:10%;">${visaConsulateObj.consulateId}</td>
						<td style="width:10%;">${COUNTRY_NAME}</td>
						<td style="width:10%;">${visaConsulateObj.cityName}</td>
						<td style="width:10%;">${visaConsulateObj.consulateTitle}</td>
						<td style="width:10%;border:0;">
							<a href="view_view_visa_consulate?consulateId=${visaConsulateObj.consulateId}" ><input type="button" style="background-color:blue;" value="View" /></a>
							<a href="view_edit_visa_consulate_form?consulateId=${visaConsulateObj.consulateId}" ><input type="button" style="background-color:blue;" value="Edit" /></a>
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
