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
  background: #581845;
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
			Add Visa Consulate
		</h2>
	</center>
	
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<form:form method="post" action="add_add_visa_consulate_master" modelAttribute="VISA_CONSULATE_OBJ">
			<div align="center"><b><font color="red"><form:errors path="countryName" cssClass="error" /></b></font></div>
			<div align="center"><b><font color="red"><form:errors path="cityName" cssClass="error" /></b></font></div>
			<table style="width:80%; border:1px;border-collapse: collapse;text-align:center;">
			<tr>
			<th style="width:10%;">Visa Country Name (Embassy) </th>
			 <td style="width:10%; padding-bottom: 5px;">
				<input style="width:150px;" type="text" id="countryName"  name="countryName" placeholder="country name" required />
				<input type="hidden" name="visaCountryCode" id="visaCountryCode" />
				
			</td>
			<th style="width:10%;">Consulate Title</th>
			<td style="width:20%;">
				<input style="width:250px;" type="text" id="consulateTitle"  name="consulateTitle" placeholder="Title" value="${VISA_CONSULATE_OBJ.consulateTitle }" required />
			</td>
			<th style="width:10%;">Consulate City</th>
			<td style="width:10%;">
				<input style="width:150px;" type="text" id="cityName"  name="cityName" placeholder="country name" required />
				<input type="hidden" name="consulateCity" id="consulateCity" />
			</td>
			<tr>
				<th style="width:10%;" colspan="2">Address</th>
				<th>Email</th><td><input style="width:250px;height:30px;" type="email" id="email"  name="email" value="${VISA_CONSULATE_OBJ.email }" placeholder="Email" /></td>
				<th>Website</th><td><input style="width:250px;" type="text" id="email"  name="website" value="${VISA_CONSULATE_OBJ.website }" placeholder="website" /></td>
			</tr>
			<tr>
			<td colspan="2">
				 <textarea style="width: 400px; height: 100px;border: 2px solid green; border-radius: 4px;" rows="3" cols="1500" name="address" htmlEscape="false">${VISA_CONSULATE_OBJ.address }</textarea>
			</td>
			<th>Telephone</th><td><input style="width:250px;" type="text" id="telephone"  name="telephone" placeholder="telephone" value="${VISA_CONSULATE_OBJ.telephone }"/></td>
				<th>Fax</th><td><input style="width:250px;" type="text" id="fax"  name="fax" placeholder="fax" value="${VISA_CONSULATE_OBJ.fax }"/></td>
			</tr>
			
			<tr>
				<td colspan="8">
					<input type="submit" name="submit" value="Add Consulate" />
					<a href="#" ><input type="button" style="background-color:blue;" value="Search Visa Consulate" /></a>		
				</td>
			</tr>
			</table>
	</form:form>


<script>



$('#cityName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getCityList',
	paramName: "cityName",
	delimiter: ",",
	onSelect: function(suggestion) {
        cityID = suggestion.data;
        id=cityID;
        jQuery("#consulateCity").val(cityID);
        $('input[name=consulateCity]').val(id);
        return false;
    },
	transformResult: function(response) {
        return {
            suggestions: $.map($.parseJSON(response), function(item) {
            	return { value: item.cityName, data: item.destinationId };
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
        jQuery("#visaCountryCode").val(cityID);
        $('input[name=visaCountryCode]').val(id);
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
	/*
	Following code works perfectly fine. Depending upon the country selected, this populates the other select combo for all cities within that country.
	
	$('#countryName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getCountryCityList',
	paramName: "countryName",
	delimiter: ",",
	onSelect: function(suggestion) {
		$('#consulateCity').empty();
		$.each(suggestion.roomCat, function(key, value) {
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
            	return { value: item.countryName, data: item.countryCode,roomCat : item.cityKeyValue };
            })
            
        };
        
    }
});
	*/
	
</script>


</body>
