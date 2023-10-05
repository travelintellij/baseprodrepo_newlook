<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<jsp:include page="../menu/MenuBuilder.jsp" />  

<style>
table
{ margin: 10px 0 30px 0;}

table tr th, table tr td
{ background: #3B3B3B;
  color: #FFF;
  padding: 5px 2px;
  text-align: left;}
  
table tr td
{ background: #E5E5DB;
  color: #47433F;
  border-top: 1px solid #FFF;}

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

       <h3><br> Welcome Administrator  <font color="red" size="5">  ${userName} </font></h3>
         <div class="main-block">
        <form:form method="post" action="actionAdminUpdateClient" modelAttribute="client">
       		 <input type="hidden" name="clientId" value="${clientId}" />
    		
	     
	     
	       <table id="table" >
	 <caption><h2>Edit Client Details</h2></caption>
		        <tr><th>Client Name</th><td> <input class="contact" type="text" name="clientName" value="${client.clientName}" /><br><font color="red"><form:errors path="clientName" cssClass="error" /></td></tr>
		        <tr><th>Client Address</th><td><textarea rows="3" cols="50" name="address" maxlength="250">${client.address}</textarea><br><font color="red"><form:errors path="address" cssClass="error" /></font></td></tr>
		        <tr><th>City</th>
		        <td>
		        	<input type="text" name="cityCtrl" id="cityCtrl" size="35"  value="${client.cityName}" required/>
	        		<input type="hidden" name="cityId" value="${client.cityId}" />
		        </td></tr>
				<tr><th>Email</th><td> <input class="contact" type="text" name="email" value="${client.email}" /><br><font color="red"><form:errors path="email" cssClass="error" /></td></tr>
				<tr><th>Mobile</th><td><input class="contact" type="text" name="mobile" value="${client.mobile}" /><br><font color="red"><form:errors path="mobile" cssClass="error" /></td></tr>
				<tr><th>Phone </th><td><input class="contact" type="text" name="phone" value="${client.phone}" /><br><font color="red"><form:errors path="phone" cssClass="error" /></td></tr>
				 <tr><th>Company Details</th><td><textarea rows="3" cols="50" name="companyName" maxlength="250">${client.companyName}</textarea><br><font color="red"><form:errors path="companyName" cssClass="error" /></font></td></tr>
				<tr><th>Referred By</th><td><input class="contact" type="text" name="referredBy" value="${client.referredBy}" /><br><font color="red"><form:errors path="referredBy" cssClass="error" /></font></td></tr>				
				<tr><th>GST Details</th><td><input class="contact" type="text" name="gstNumber" value="${client.gstNumber}" /><br><font color="red"><form:errors path="gstNumber" cssClass="error" /></font></td></tr>
				<tr><th>Bank Details</th><td><textarea rows="3" cols="50" name="bankAccountDetails" maxlength="250">${client.bankAccountDetails}</textarea><br><font color="red"><form:errors path="bankAccountDetails" cssClass="error" /></font></td></tr>
				<tr><th>Remarks</th><td><textarea rows="3" cols="50" name="remarks" maxlength="250">${client.remarks}</textarea><br><font color="red"><form:errors path="remarks" cssClass="error" /></td></tr>

		        <tr><td colspan="2"><center><input class="contact" type="submit" value="Edit Client"></center></td></tr>
	        </table>
	        </form:form>
	        </div>
<script>

$('#cityCtrl').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getCityList',
	paramName: "cityName",
	delimiter: ",",
	onSelect: function(suggestion) {
        cityID = suggestion.data;
        id=cityID;
        jQuery("#destinationId").val(cityID);
        $('input[name=cityId]').val(id);
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
     