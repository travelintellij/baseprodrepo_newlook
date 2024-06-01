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
		.center-table {
            margin: 0 auto; /* Center horizontally */
            border-collapse: collapse;
        }
        .center-table th, .center-table td {
            padding: 8px;
            text-align: center; /* Optional: Center text within cells */
        }	
         .center-table th, .center-table td {
            text-align: left; /* Align table header content to the left */
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
            <h1 class="page-heading" style="font-weight:600">View Partner</h1>
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <form:form method="post" action="form_action_b2b_partner" modelAttribute="PARTNER_OBJ" enctype="multipart/form-data">
				<form:hidden path="partnerId" />
				<form:hidden path="partnerShortName" />
				<form:hidden path="logFilePath" />
				<form:hidden path="logoFileName" />
				<font color="red"> <form:errors path="logoFile" cssClass="error" /></font>                
				<font color="red"> <form:errors path="partnerShortName" cssClass="error" /></font>
				<font color="red"> <form:errors path="cityName" cssClass="error" /></font>
                <table>
                <tr>
                <th style="width:17%;"><label for="" style="font-weight:600">Partner Id</label></th><td>${PARTNER_OBJ.partnerId}</td>
                <th style="width:17%;"><label for="" style="font-weight:600">Short Name</label></th><td>${PARTNER_OBJ.partnerShortName}</td>
                <th style="width:17%;"><label for="" style="font-weight:600">Brand Name</label></th><td>${PARTNER_OBJ.partnerBrandName}</td>
                </tr>
                <tr>
                <th style="width:17%;"><label for="" style="font-weight:600">Partner Name</label></th><td>${PARTNER_OBJ.partnerName}</td>
                 <th style="width:17%;"><label for="" style="font-weight:600">City</label></th><td>${PARTNER_OBJ.cityName}</td>
                <form:hidden path="cityId" />
                <th style="width:17%;"><label for="" style="font-weight:600">Address</label></th><td>${PARTNER_OBJ.address}</td>
                
                </tr>
                <tr>
				<th style="width:17%;"><label for="" style="font-weight:600">Contact Number</label></th><td>${PARTNER_OBJ.contactNumber}</td>
                <th style="width:17%;"><label for="" style="font-weight:600">Email</label></th><td>${PARTNER_OBJ.email}</td>
                <th style="width:17%;"><label for="" style="font-weight:600">GST Number</label></th><td>${PARTNER_OBJ.gstNumber}</td>
                </tr>
                <tr>
                 <th style="width:17%;"><label for="" style="font-weight:600">website</label></th><td>${PARTNER_OBJ.website}</td>
                 <th style="width:17%;"><label for="" style="font-weight:600">Active</label></th>
                 <td>
                 	${PARTNER_OBJ.active}
    			</td>
    			<th style="width:17%;"><label for="" style="font-weight:600">Remarks</label></th><td>${PARTNER_OBJ.remarks}</td>
                </tr>
                </table>
                <hr>
                <table style="width:50%;" class="center-table">
                	<tr><th colspan="2" style="text-align:center;">Bank Details</th></tr>
	                <tr>
	                	<th style="width:50;"><label for="" style="font-weight:600">Bank Name</label></th>
	                	<td>${PARTNER_OBJ.beneficiaryName}</td>
	                </tr>
	                <tr>
	                	<th style="width:50;"><label for="" style="font-weight:600">Bank Account Number</label></th>
	                	<td>${PARTNER_OBJ.bankAccountNumber}</td>
	                </tr>
	                <tr>
	                	<th style="width:50;"><label for="" style="font-weight:600">Bank Name</label></th>
	                	<td>${PARTNER_OBJ.bankName}</td>
	                </tr>
	                <tr>
	                	<th style="width:50;"><label for="" style="font-weight:600">IFSC Code</label></th>
	                	<td>${PARTNER_OBJ.bankIFSCCode}</td>
	                </tr>
	                <tr>
	                	<th style="width:50;"><label for="" style="font-weight:600">Branch</label></th>
	                	<td>${PARTNER_OBJ.bankBranch}</td>
	                </tr>
	                <hr>
	                <tr>
	                	<th style="width:50;"><label for="" style="font-weight:600">UPI ID</label></th>
	                	<td>${PARTNER_OBJ.upiId}</td>
	                </tr>
                </table>
                <br>
                <hr>
                
                <table>
                <tr>
                	<th ><label for="" style="font-weight:600">Logo File:</label></th>
                	<c:if test="${not empty PARTNER_OBJ.logFilePath}">
		            	<td colspan="2">
		                <img src="${pageContext.request.contextPath}${PARTNER_OBJ.logFilePath}" alt="Partner Logo" width="100" height="100"/>
		                </td>
		        	</c:if>
		        	<c:if test="${empty PARTNER_OBJ.logFilePath}">
		        		<td colspan="2">Not Available</td>
		        	</c:if>
                </tr>
                </table>
                
                <div class="due_today_task_data_btns">
                	<input type="submit" id="submitPartner" name="Edit" value="Edit Partner" />
                            <a href="view_filter_partners">List Partners</a>
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