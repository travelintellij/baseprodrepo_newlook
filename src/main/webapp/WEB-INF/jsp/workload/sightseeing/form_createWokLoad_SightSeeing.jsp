<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.jquery-ui.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<head>
	<title>UdanChoo Team Workload Section</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="${pageContext.request.contextPath}/resources/css/tooplate_style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/coda-slider.css" type="text/css" charset="utf-8" />
</head>

<style>
/*body {
  background-image: url('${pageContext.request.contextPath}/resources/images/sightseeing.png');
  background-repeat: no-repeat;
  background-size: auto;
   background-position: center;
}*/

table {
  width: 100%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
  /*font-size:13pt;*/
}

th {
  background: #990073;
  height: 50px;
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
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 10px 20px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}
input[type=text],input[type=number],input[type=date]{
font-size: 15pt;
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
	Sight Seeing WorkLoad Details
</h2>
<hr>
	<body style="background-color: white;">
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>

	<c:if test="${not empty STS_SL_LIST}">
	<c:forEach var="stsSLObj" items="${STS_SL_LIST}">
	<c:choose>
	<c:when test="${stsSLObj.stsServiceId eq STS_SL_OBJ.stsServiceId  && STS_SL_ACTION eq 'UPDATE' }">
		<form:form name="formaddwl" modelAttribute="STS_SL_OBJ" action="edit_edit_workload_STS_SL">
		<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
		<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
		<form:hidden path="savedSightSeeing"/>
		<input type="hidden" id="stsServiceId" name="stsServiceId" value="${stsSLObj.stsServiceId}" />
		<table  style="border: 3px solid black;width:85%;table-layout: fixed;" id="updatesightseeing">
			<tr>
				<th style="background-color: #CA1551;width:10%;"   align="center">City</th>
				<th style="background-color: #CA1551;width:30%;"   align="center" colspan="2">Sight Seeing Name</th>
				<th style="background-color: #CA1551;width:10%;"   align="center">Tour Date</th>
				<th style="background-color: #CA1551;width:10%;"   align="center">Transfer Type</th>
				<th style="background-color: #CA1551;width:20%;"   align="center">Guest Details</th>
				<th style="background-color: #CA1551;width:10%;"  align="center">Supplier</th>
				<th style="background-color: #CA1551;width:10%;"   align="center">Status</th>
			</tr>
			<tr>
				<td width="10%"  align="center">
					<form:input path="cityName" style="width: 150px; height:40px; border: 1px solid ;" required="required" placeholder="City Name" />
					<b><font color="red"><form:errors path="cityName" cssClass="error" /></font></b> 
					<form:hidden path="cityId"/>
				</td>
				<td width="30%"  align="center" colspan="2">
					<form:input path="sightSeeingName" style="width: 300px; height:40px; border: 1px solid ;" required="required" placeholder="Sight SeeingName" />
					<form:hidden path="sightSeeingId"/>
				</td>
				<td width="10%"  align="center">
					<form:input path="tourDate" style="height: 40px; width: 150px;" required="required" type="date" />
				</td>
				<td width="10%"  align="center">
					<div class="select">
						<form:select path="transferType" style="width: 120px;height:30px;border: 1px solid ;" required="required">  
							<form:options items = "${TRANSFER_TYPE_MAP}" class="service-small"/>
						</form:select>  
					</div>
				</td>
				<td width="20%;" align="center">
					<table>
						<tr>
							<th style="background-color: #CA1551;">Adults</th>
							<th style="background-color: #CA1551;">Children</th>
							<th style="background-color: #CA1551;">Infants</th>
						</tr>
						<tr>
							<td><form:input path="adults" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" /> 
								<b><font color="red"><form:errors path="adults" cssClass="error" /></font></b>	
							</td>
							<td><form:input path="children" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" /></td>
							<td><form:input path="infants" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" /></td>
						</tr>
					</table>
				</td>
				<td width="10%"  align="center">
					<div class="select">
						<form:select path="supplierId" style="width: 150px;height:30px;border: 1px solid ;" required="required">  
							<option class="service-small" value="0">------Please Select------</option>
							<form:options items = "${STS_SUPPLIER_MAP}" class="service-small"/>
						</form:select>  
					</div>
				</td>
				<td width="10%"  align="center">
					<div class="select">
						<form:select path="status" style="width: 120px;height:30px;border: 1px solid ;" required="required">  
							<form:options items = "${STS_SL_STATUS_MAP}" class="service-small"/>
						</form:select>  
					</div>
				</td>
			</tr>
			<tr>
				<th style="background-color: #CA1551;width:30%;" align="center" colspan="3">Remarks</th>
				<th style="background-color: #CA1551;width:15%;" align="center">Cost</th>
				<th style="background-color: #CA1551;width:15%;" align="center">Markup</th>
				<th style="background-color: #CA1551;width:10%;" align="center">Display Order</th>
				<th style="background-color: #CA1551;width:30%;" align="center" colspan="2">Action</th>
			</tr>
			<tr>
				
				<td width="30%;"  align="center" colspan="3">
					<form:textarea path = "remarks" rows = "4" cols = "15" style="width: 500px; height: 100px;border: 2px solid green; border-radius: 4px;" htmlEscape="false" />
				</td>
				<td width="15%;"  align="center">
					<form:input path="serviceLineCost" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
				</td>
				<td width="15%;"  align="center">
					<form:input path="markup" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
				</td>
				<td width="10%;"  align="center">
					<form:input path="displayOrder" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
				</td>
				
				<td width="30%"  align="center" colspan="2">
					<input style="width: 100px; background-color: green" type="submit" name="Update" value="Update" /> | 
					<a href="view_workload_STS?dealConfirmationId=${dealConfirmationId}" ><input type="button" style="width: 100px;background-color: blue;" value="Cancel"></a>
				</td>
			</tr>
		</table>
		<p>&nbsp;</p>
		</form:form>			
		</c:when>

			<c:otherwise>
				<table  style="border: 3px solid black;width:85%; table-layout: fixed;" id="viewsightseeing">
				<tr>
					<th width="10%"  align="center">City</th>
					<th width="40%"  align="center" colspan="2">Sight Seeing Name</th>
					<th width="10%"  align="center">Tour Date</th>
					<th width="10%"  align="center">Transfer Type</th>
					<th width="10%;"  align="center">Guest Details</th>
					<th width="15%"  align="center">Supplier</th>
					<th width="10%"  align="center">Status</th>
					
				</tr>
				<tr>
					<td width="10%" align="center">${stsSLObj.cityName}</td>
					<td style="width: 40%;" align="center" colspan="2">${stsSLObj.sightSeeingName}</td>
					<td width="10%" align="center"><fmt:formatDate value="${stsSLObj.tourDate}" pattern="dd-MM-yyyy" /> </td>
					<td width="10%" align="center">${stsSLObj.transferTypeName}</td>
					<td width="10%" align="center">${stsSLObj.adults} Adults | ${stsSLObj.children} Children | ${stsSLObj.infants} Infant(s)</td>
					<td width="15%;" align="center">${stsSLObj.supplierName}</td>
					<td width="10%" align="center">${stsSLObj.statusName}</td>
				</tr>
				<tr>
					<th width="40%"  align="center" colspan="4">Remarks</th>
					<th width="15%"  align="center">Cost</th>
					<th width="15%"  align="center">Markup</th>
					<th width="10%"  align="center">Display Order</th>
					<th width="20%"  align="center">Action</th>
				</tr>
				<tr>
					<td style="width: 40%;" align="center" colspan="4">${stsSLObj.remarks}</td>
					<td style="width: 15%;" align="center">${stsSLObj.serviceLineCost}</td>
					<td style="width: 15%;" align="center">${stsSLObj.markup}</td>
					<td width="10%" align="center">${stsSLObj.displayOrder}</td>
					<td style="width: 20%;" align="center">
						<form:form id="form_update_STS_SL" modelAttribute="STS_SL_OBJ" name="form_update_STS_SL" action="view_update_workload_form_STS" method="POST" style="display:inline;">
								<input type="hidden" name="stsServiceId" value="${stsSLObj.stsServiceId}" />
								<input type="hidden" name="cityId" value="${stsSLObj.cityId}" />
								<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
								<input type="submit" name="Edit" Value="Edit" style="background-color: blue; padding: 6px 12px;" />
						</form:form> | 
						<form:form id="form_del_STS_SL" name="form_del_conf_STS_SL" action="view_delete_sts_sl_confirmation" method="POST" style="display:inline;">
								<input type="hidden" name="stsServiceId" value="${stsSLObj.stsServiceId}" />
								<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
								<input type="submit" name="Delete" Value="Delete" style="background-color: red; padding: 6px 12px;" />
						</form:form>
					</td>
				</tr>
				</table>
				<p>&nbsp;</p>
			</c:otherwise>
			</c:choose>
			</c:forEach>
		</c:if>

			<!-- Following set of code will get executed only user have clicked on the Add Hotel button.  -->
			<c:if test="${STS_SL_ACTION eq 'ADD'}">
				<form:form name="formaddwl" modelAttribute="STS_SL_OBJ" action="create_workload_STS_SL">
					<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
					<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
					<form:hidden path="savedSightSeeing"/>
					<table  style="border: 3px solid black;width:85%;table-layout: fixed;" id="updatesightseeing">
						<tr>
							<th style="background-color: #CA1551;width:10%;"   align="center">City</th>
							<th style="background-color: #CA1551;width:30%;"   align="center" colspan="2">Sight Seeing Name</th>
							<th style="background-color: #CA1551;width:10%;"   align="center">Tour Date</th>
							<th style="background-color: #CA1551;width:10%;"   align="center">Transfer Type</th>
							<th style="background-color: #CA1551;width:20%;"   align="center">Guest Details</th>
							<th style="background-color: #CA1551;width:10%;"  align="center">Supplier</th>
							<th style="background-color: #CA1551;width:10%;"   align="center">Status</th>
						</tr>
						<tr>
							<td width="10%"  align="center">
								<form:input path="cityName" style="width: 150px; height:40px; border: 1px solid ;" required="required" placeholder="country name" />
								<b><font color="red"><form:errors path="cityName" cssClass="error" /></font></b> 
								<form:hidden path="cityId"/>
							</td>
							<td width="30%"  align="center" colspan="2">
								<form:input path="sightSeeingName" style="width: 300px; height:40px; border: 1px solid ;" required="required" placeholder="Sight SeeingName" />
								<form:hidden path="sightSeeingId"/>
							</td>
							<td width="10%"  align="center">
								<form:input path="tourDate" style="height: 40px; width: 150px;" required="required" type="date" />
							</td>
							<td width="10%"  align="center">
								<div class="select">
									<form:select path="transferType" style="width: 120px;height:30px;border: 1px solid ;" required="required">  
										<option class="service-small" value="">------Please Select------</option>
										<form:options items = "${TRANSFER_TYPE_MAP}" class="service-small"/>
									</form:select>  
								</div>
							</td>
							<td width="20%;" align="center">
								<table>
									<tr>
										<th style="background-color: #CA1551;">Adults</th>
										<th style="background-color: #CA1551;">Children</th>
										<th style="background-color: #CA1551;">Infants</th>
									</tr>
									<tr>
										<td><form:input path="adults" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" /> 
											<b><font color="red"><form:errors path="adults" cssClass="error" /></font></b>	
										</td>
										<td><form:input path="children" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" /></td>
										<td><form:input path="infants" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" /></td>
									</tr>
								</table>
							</td>
							<td width="10%"  align="center">
								<div class="select">
									<form:select path="supplierId" style="width: 150px;height:30px;border: 1px solid ;" required="required">  
										<option class="service-small" value="0">------Please Select------</option>
										<form:options items = "${STS_SUPPLIER_MAP}" class="service-small"/>
									</form:select>  
								</div>
							</td>
							<td width="10%"  align="center">
								<div class="select">
									<form:select path="status" style="width: 120px;height:30px;border: 1px solid ;" required="required">  
										<form:options items = "${STS_SL_STATUS_MAP}" class="service-small"/>
									</form:select>  
								</div>
							</td>
						</tr>
						<tr>
							<th style="background-color: #CA1551;width:30%;" align="center" colspan="3">Remarks</th>
							<th style="background-color: #CA1551;width:15%;" align="center">Cost</th>
							<th style="background-color: #CA1551;width:15%;" align="center">Markup</th>
							<th style="background-color: #CA1551;width:10%;" align="center">Display Order</th>
							<th style="background-color: #CA1551;width:30%;" align="center" colspan="2">Action</th>
						</tr>
						<tr>
							
							<td width="30%;"  align="center" colspan="3">
								<form:textarea path = "remarks" rows = "4" cols = "15" style="width: 500px; height: 100px;border: 2px solid green; border-radius: 4px;" htmlEscape="false" />
							</td>
							<td width="15%;"  align="center">
								<form:input path="serviceLineCost" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
							</td>
							<td width="15%;"  align="center">
								<form:input path="markup" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
							</td>
							<td width="10%;"  align="center">
								<form:input path="displayOrder" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
							</td>
							
							<td width="30%"  align="center" colspan="2">
								<input style="width: 130px; background-color: green" type="submit" name="Add Sight Seeing" value="Add Sight Seeing" /> | 
								<a href="view_workload_STS?dealConfirmationId=${dealConfirmationId}" ><input type="button" style="width: 100px;background-color: blue;" value="Cancel"></a> | 
								 <a href="view_search_sightseeing_master?dealConfirmationId=${dealConfirmationId}" ><input type="button" style="width: 80px;background-color: #dac400;" value="Search"></a>
							</td>
						</tr>
					</table>
				
				</form:form>
			</c:if>
		
		<form:form modelAttribute="STS_SL_OBJ" action="view_create_workload_form_STS">
			<div align="right">
				<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
				<c:if test="${STS_SL_ACTION eq 'VIEW'}">
					<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
					<input type="submit" value="Add SightSeeing" />
				</c:if>
			</div>
		</form:form>

</body>


<script>
$(document).ready(function () {
    // Handler for .ready() called.
    var ut = document.getElementById('updatesightseeing'); 
    var nt = document.getElementById('newsightseeing');
    if (ut != null) { 
    	$('html, body').animate({
            scrollTop: $('#updatesightseeing').offset().top
        }, 'slow');
    }
    else if (nt != null) {
        $('html, body').animate({
            scrollTop: $('#newsightseeing').offset().top
        }, 'slow');
    	
    }
    
});

	$('#cityName').autocomplete({
		serviceUrl : '${pageContext.request.contextPath}/getCityList',
		paramName : "cityName",
		delimiter : ",",
		onSelect : function(suggestion) {
			cityID = suggestion.data;
			id = cityID;
			jQuery("#cityId").val(cityID);
			$('input[name=departingFrom]').val(id);
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

	
	$('#sightSeeingName').autocomplete(
					{
						serviceUrl : "${pageContext.request.contextPath}/getCitySightSeeingList",
						minChars: 3,
						paramName : "sightSeeingName",
						params : {
							cityId : function() {
								return $('#cityId').val()
							}
						},
						delimiter : ",",
						onSelect : function(suggestion) {
							sightSeeingID = suggestion.data;
							id = sightSeeingId;
							jQuery("#sightSeeingId").val(sightSeeingID);
							$('input[name=sightSeeingName]').val(suggestion.value);
							//alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
							return false;
						},
						transformResult : function(response) {
							return {
								suggestions : $.map($.parseJSON(response),
										function(item) {
											return {
												value : item.tagName,
												data : item.id,
												roomCat : item.keyValueList
											};
										})

							};
						}

					});

	
</script>

</html>

