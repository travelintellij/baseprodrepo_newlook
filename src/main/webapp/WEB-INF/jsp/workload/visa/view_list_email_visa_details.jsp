<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<head>
<title>UdanChoo Team Workload Section</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="${pageContext.request.contextPath}/resources/css/tooplate_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/coda-slider.css" type="text/css" charset="utf-8" />

</head>

<style>
body {
  background-image: url('${pageContext.request.contextPath}/resources/images/visa.png');
  background-repeat: no-repeat;
  background-position: center;
  //background-size: auto;
}
table {
  width: 100%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
}

th {
  background: #007f5c;
  height: 40px;
  width: 10%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
}

th, td {
  padding: 10px;
}
tr {
  border-bottom: 1px solid #cccccc;
}
tr:hover {background-color:#f5f5f5;}
td {
  border-right: 1px solid #cccccc;
  padding: 10px;
  transition: all 0.2s;
  text-align: center;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
  
}

.heavyTable {
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
  animation: float 5s infinite;
}

input[type=button], input[type=submit], input[type=reset] {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 10px 20px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}
select {
	appearance: none;
	outline: 0;
	background: lightblue;
	background-image: none;
	width: 100%;
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

</style>
<jsp:include page="../_Workload_Menu.jsp" />
<br>
<h2 align="center">
		Visa Status Details
</h2>
	<hr>
<body style="background-color: white;">
		<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
      <form:form name="visaEmailForm" id="visaEmailForm" action="view_send_email_workload_VSA_SL_status" style="display:inline;" modelAttribute="EMAIL_VISA_STATUS" >		
		<table style="width:85%;">
			<tr style="background-color:pink;"><td colspan="6">&nbsp;</td>
				<td>
					<form:form action="view_form_email_workload_VSA_SL_status" style="display:inline;">
						<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
						<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
						<input type="submit" value="Email Selected" style="background-color:green;"/>
					</form:form>
				</td>
				<td><a href="view_workload_VSA?dealConfirmationId=${dealConfirmationId}" ><input type="button" style="width: 100px;background-color: blue;display:inline;" value="Cancel"></a></td>
			</tr>
			<tr>
				<th style="width: 10%;" align="center">Case Id</th>
				<th style="width: 15%;" align="center">Country</th>
				<th style="width: 20%;" align="center">Applicant Name</th>
				<th style="width: 10%;" align="center">Visa Type</th>
				<th style="width: 10%;" align="center">Visa Profile</th>
				<th style="width: 10%;" align="center">Visa Purpose</th>
				<th style="width: 15%;" align="center">Status</th>
				<th style="width: 10%;" align="center">Action</th>
			</tr>
			<c:if test="${not empty EMAIL_VISA_STATUS.visaServiceListForEmail}">
				<c:forEach var="vsaSLObj" items="${EMAIL_VISA_STATUS.visaServiceListForEmail}">
					<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
					<input type="hidden" name="vsaServiceId" value="${vsaSLObj.vsaServiceId}" />
						<tr style="background-color:lightgreen;">
							<td style="width: 10%;background-color:#FF7A33;" align="center">${vsaSLObj.vsaServiceId} <a class="parent" id="row${vsaSLObj.vsaServiceId}" style="color:blue;"> (Click) </a></td>
							<td style="width: 15%;background-color:#FF7A33;" align="center">${vsaSLObj.countryName}</td>
							<td style="width: 20%;background-color:#FF7A33;" align="center">${vsaSLObj.applicantName}</td>
							<td style="width: 10%;background-color:#FF7A33;" align="center">${VISA_TYPE.get(vsaSLObj.visaType)} </td>
							<td style="width: 10%;background-color:#FF7A33;" align="center">${VISA_PROFILE.get(vsaSLObj.profile)} </td>
							<td style="width: 10%;background-color:#FF7A33;" align="center">${VISA_PURPOSE.get(vsaSLObj.visaPurpose)} </td>
							<td style="width: 15%;background-color:#FF7A33;" align="center">${vsaSLObj.statusName}</td>
							<td style="width: 10%;background-color:#FF7A33;" align="center">
								<input type="checkbox" name="visaIdListToEmail" style="width: 20px;height: 20px;" value="${vsaSLObj.vsaServiceId}" />Email
							</td>
						</tr>
						<tr class="child-row${vsaSLObj.vsaServiceId}" style="display: none;">
						<th colspan="2" style="background-color:lightgreen;color:black;">Doc Id</th>
						<th colspan="3" style="background-color:lightgreen;color:black;">Title</th>
						<th colspan="3" style="background-color:lightgreen;color:black;">Status</th></tr>
						<c:forEach var="vsaDocObj" items="${vsaSLObj.visaDocumentEntityList}">
							<tr class="child-row${vsaSLObj.vsaServiceId}" style="display: none;">
								<td colspan="2" style="color:black;">${vsaDocObj.vsaDocServiceId}</td>
								<td colspan="3" style="color:black;">${vsaDocObj.documentTitle}</td>
								<td colspan="3" style="color:black;">${vsaDocObj.statusName}</td>
							</tr>
						</c:forEach>
						
			</c:forEach>
		</c:if>
	
		</table>
	</form:form>

	

</body>

<script>
$('#destinationName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getCityList',
	paramName: "cityName",
	delimiter: ",",
	onSelect: function(suggestion) {
        cityID = suggestion.data;
        id=cityID;
        jQuery("#destinationId").val(cityID);
        $('input[name=destinationId]').val(id);
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
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>  
<script type="text/javascript">  
    $(document).ready(function () {  
    	     
    	$('a.parent')  
                .css("cursor", "pointer")  
                .attr("title", "Click to expand/collapse")  
                .click(function () {  
                    $('.child-' + this.id).toggle();  
                });  
            $('tr[@class^=child-]').hide().children('td');  
    });  
    </script>  


</html>

