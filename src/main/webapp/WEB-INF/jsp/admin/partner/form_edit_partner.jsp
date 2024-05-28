<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>add user</title>
        <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
		<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<style>
 .autocomplete-suggestions { border: 1px solid #999; background: red;overflow-y:auto}
		.autocomplete-suggestion {padding: 2px 5px;color:white; background: black;overflow-y: auto;overflow-y:auto}
		.autocomplete-selected { background: #F0F0F0;overflow-y:auto} 
		.autocomplete-suggestions strong { font-weight: normal; color:#FABA08;overflow-y:auto}
		.autocomplete-group { padding: 2px 5px;overflow-y:auto}
		.autocomplete-group strong { display: block; border-bottom: 1px solid #000;  background: black ; color:black overflow-y:auto}
		.autocomplete-selected:hover{
		color:black
		}

        body::before {
            content: "";
            background-image: url(${pageContext.request.contextPath}/resources/images/revamped/capture_lead_bg.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            background-attachment: fixed;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0.5; /* Adjust the opacity value as needed (0.0 to 1.0) */
            z-index: -1;
        }
        th, td {
  padding: 3px;
}
		
</style>
<body>
   
   <div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>
   
   
    <div class="AdminCreateNewUser container">
        <div class="AdminCreateNewUser_wrapper">
            <h1 class="page-heading" style="font-weight:600">Create Partner</h1>
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <form:form method="post" action="create_create_b2b_partner" modelAttribute="PARTNER_OBJ" enctype="multipart/form-data">
				<font color="red"> <form:errors path="logoFile" cssClass="error" /></font>                
				<font color="red"> <form:errors path="partnerShortName" cssClass="error" /></font>
				<font color="red"> <form:errors path="cityName" cssClass="error" /></font>
                <table>
                <tr>
                <th style="width:17%;"><label for="" style="font-weight:600">Partner Id</label></th><td> Auto Generated</td>
                <th style="width:17%;"><label for="" style="font-weight:600">Short Name</label></th><td><form:input path="partnerShortName" maxlength="10" size="5" /></td>
                <th style="width:17%;"><label for="" style="font-weight:600">Brand Name</label></th><td><form:input path="partnerBrandName" maxlength="25" size="15" minlength="3" /> <br></td>
                </tr>
                <tr>
                <th style="width:17%;"><label for="" style="font-weight:600">Partner Name</label></th><td><form:input path="partnerName" maxlength="25" size="25" minlength="3" /> </td>
                 <th style="width:17%;"><label for="" style="font-weight:600">City</label></th><td><form:input path="cityName" name="cityName" /></td>
                <form:hidden path="cityId" />
                <th style="width:17%;"><label for="" style="font-weight:600">Address</label></th><td><form:textarea path="address" maxlength="1450" name="" id="address" cols="30" rows="2" /></td>
                
                </tr>
                <tr>
				<th style="width:17%;"><label for="" style="font-weight:600">Contact Number</label></th><td><form:input path="contactNumber" maxlength="25" size="25" type="number" /> </td>
                <th style="width:17%;"><label for="" style="font-weight:600">Email</label></th><td><form:input path="email" maxlength="25" size="25" type="email"/> </td>
                <th style="width:17%;"><label for="" style="font-weight:600">GST Number</label></th><td><form:input path="gstNumber" maxlength="25" size="25" /> </td>
                </tr>
                <tr>
                 <th style="width:17%;"><label for="" style="font-weight:600">website</label></th><td><form:input path="website" maxlength="250" size="25" /> </td>
                 <th style="width:17%;"><label for="" style="font-weight:600">Active</label></th>
                 <td>
                 	<form:select path="active" >
                 		<option class="service-small" value="true" selected>Active</option>
                 		<option class="service-small" value="false" >Not Active </option>
    				</form:select>
    			</td>
    			<th style="width:17%;"><label for="" style="font-weight:600">Remarks</label></th><td><form:textarea path="remarks" maxlength="1450" name="" id="remarks" cols="30" rows="2" /></td>
                </tr>
                
                <tr>
                	<th colspan="3"><label for="" style="font-weight:600">Logo File (JPG/PNG, max 500KB):</label></th>
        			<td><input type="file" name="logoFile" accept=".jpg,.png" /></td>
                </tr>
                
                
                </table>
                <div class="due_today_task_data_btns">
                	<input type="submit" id="submitPartner" name="submitPartner" value="Create Partner" />
                            <a href="view_filter_partners">Cancel</a>
                        </div>
                
              
            </form:form>
        </div>
    </div>
    <script>
    $('#cityName').autocomplete({
        serviceUrl: '${pageContext.request.contextPath}/getCityList',
        paramName: "cityName",
        delimiter: ",",
        onSelect: function (suggestion) {
            cityID = suggestion.data;
            id = cityID;
            jQuery("#destinationId").val(cityID);
            $('input[name=cityId]').val(id);
            return false;
        },
        transformResult: function (response) {
            return {
                suggestions: $.map($.parseJSON(response), function (item) {
                    return { value: item.cityName, data: item.destinationId };
                })

            };
        }
    });
    </script>
</body>

</html>