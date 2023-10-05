<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">


<jsp:include page="../menu/MenuBuilder.jsp" />

<br><br>  
<h3> Welcome Administrator  <font color="red" size="5">  ${userName} </font></h3>
       
  <div class="main-block">
	<br>
 


	

	
	<form:form method="post" action="adminCreateCustomer" modelAttribute="tag">
	<div id="table">
	<table>
		<tr><td>Please type to search and view client details.</td></tr>
		<tr>
		
		<td>
		<input type="text" class="contact" id="inputSearch" name="inputSearch" value="" size="80" style="font-size:10pt;height:30px">
		<input type="hidden" name="id" value="hello" />
		</td></tr>
		<tr><td>
				<center><button id="w-button-search" type="Submit" >View Client Details</button></center>
		</td></tr>
		</table>
	</div>
	</form:form>
	<script>
	
	$(document).ready(function() {

		$('#inputSearch').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getClientList',
			paramName: "tagName",
			delimiter: ",",
			onSelect: function(suggestion) {
	            cityID = suggestion.data;
	            id=cityID;
	            jQuery("#id").val(cityID);
	            $('input[name=id]').val(id);
	            return false;
	        },
			transformResult: function(response) {
		        return {
		            suggestions: $.map($.parseJSON(response), function(item) {
		            	return { value: item.tagName, data: item.id };
		            })
		            
		        };
		        
		    }
			
			
		});
		
	});
	
	</script>
	

     
</div>