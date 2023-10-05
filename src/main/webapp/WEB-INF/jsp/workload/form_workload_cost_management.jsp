<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<htmL>
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
input[type=button], input[type=submit], input[type=reset] {
  background-color: red;
  border: none;
  color: white;
  padding: 16px 32px;
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

.select option.service-small {
	font-size: 20px;
	padding: 25px;
	background: lightgreen;
}
</style>

<jsp:include page="_Workload_Menu.jsp" />
   <body style="background-color: white;">
    <div class="content">
   	 <br>
    	<h2 align="center">Deal Workload Summary</h2>
        <hr>
        <div align="center">Please manage your <b>Deal Service Line Workload</b> by clicking left on the services needed for this deal.</div> 
		<hr>
	</div>
	
	<jsp:include page="view_Deal_WL_summary.jsp" />
	
	<%--

	 --%>
	<hr>
	<BR>
	<div align="center"><B><font size="4"> 
		<a href="view_workload_createNewWorkLoadForm?dealConfirmationId=${dealConfirmationId}">Workload Summary</a>  | 
		<a href="view_upload_file?dealConfirmationId=${dealConfirmationId}">Voucher Management </a>  |
		<a href="view_workload_costmanagement?dealConfirmationId=${dealConfirmationId}">Cost Management </a>
		</font></B>
		
		</div><br>
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	
	<table  class="heavyTable" style="text-align:center;">
      	<tr>
          <th style="width:40%;background: black;" colspan="2">WorkLoad Type</th>
          <th style="width:20%;background: black;">Service Lines Cost (Debit)</th>
          <th style="width:20%;background: black;">Deal Value (Credit) </th>
          <th style="width:20%;background: black;">Action</th>
        </tr>
        <tr>
          <th style="width:40%;background: #696969;" colspan="2"><b>Deal</b></th>
          <td style="width:20%;background: #ffcccb;">&nbsp;</td>
          <td style="width:20%;background: lightgreen;"><fmt:formatNumber value = "${DealObject.sellingPrice}" maxFractionDigits="2" /></td>
          <td style="width:20%;">&nbsp;</td>
        </tr>
        <c:set var="sumExpense" value="${0}" />
        <c:forEach var="listValue"  items="${DealObject.serviceWorkLoadList}" varStatus="loopCounter">
         		<form:form name="form_upd_wl" modelAttribute="WL_OBJ" action="update_update_workload">
         		
         		<input type="hidden" name="serviceMapId" value="${listValue.serviceMapId}" />
         		
         		<tr>
         		<th style="width:40%;background: #696969;" colspan="2"><b>${listValue.serviceName} Total</b>  </th>
         		 <td style="width:20%;background: #ffcccb;"><fmt:formatNumber value = "${MAP_SERVICE_LINE_COST_SUM.get(listValue.dealServiceCode)}" maxFractionDigits="2" /></td>
         		 <td style="width:20%;background: lightgreen;">&nbsp;</td>
         		 <td style="text-align: center;width:20%;">
	         		 <a href="view_workload_${listValue.dealServiceCode}?dealConfirmationId=${DealObject.dealConfirmationId}"><button type="button" >Manage</button></a>
         		 </td>
    			</tr>
    			</form:form>
    			<c:set var="sumExpense" value="${sumExpense + MAP_SERVICE_LINE_COST_SUM.get(listValue.dealServiceCode)}" />
    		</c:forEach>
    	</table>
		<p>&nbsp;</p>

		<form:form name="additionalExpenseForm" modelAttribute="Additon_Exp_obj" action="add_additional_expense_deal" >
			<table id="tbldisplayexpense" class="heavyTable" style="text-align:center;">
			<caption><b> Additional Expenses</b></caption>
			<tr>
				<th style="width:40%;">Expense Name</th>
				<th style="width:20%;">Expense Amount</th>
				<th style="width:20%;">Expense Date</th>
				<th style="width:20%;" colspan="2">Action</th>
			</tr>
			<c:forEach var="expenseObj" items="${ADDITIONAL_EXPENSES_LIST}">
			<tr>
         		<th style="width:40%;background: #696969;" >${expenseObj.expenseName}</th>
         		 <td style="width:20%;background: #ffcccb;"><fmt:formatNumber value = "${expenseObj.expenseAmount}" maxFractionDigits="2" /></td>
         		 <td style="width:20%;"><fmt:formatDate value="${expenseObj.expenseDate}" pattern="dd-MM-yyyy" /></td>
         		 <td style="width:20%;" colspan="2">
         		 	<a href="delete_additional_deal_expense?dealConfirmationId=${dealConfirmationId}&expenseId=${expenseObj.expenseId}" ><input type="button" style="padding:5px;height:30px;width: 80px;background-color: red;" value="Delete"></a>
         		 	
         		 </td>
    			</tr>
    			<c:set var="sumExpense" value="${sumExpense + expenseObj.expenseAmount}" />
			</c:forEach>
			
			
			<tr id="add_expense_option_row">
    		<td colspan="5">
    			<button type="button" class="add-row">Add Expense</button> 
    				<i>Please click to add additional expenses on deal like Tax, Commission etc. etc. </i></td></tr>
			</table>
			<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
		</form:form>
		
		<p>&nbsp;</p>
		<c:set var="markup" value="${DealObject.sellingPrice - sumExpense}" />
		<table class="heavyTable" style="text-align:center;">
    		
    		<tr>
         		<th style="width:40%;background: #696969;" colspan="2">Markup Balancer</th>
         		 <td style="width:20%;background: #ffcccb;"><fmt:formatNumber value = "${markup}" maxFractionDigits="2" /></td>
         		 <td style="width:20%;background: lightgreen;">&nbsp;</td>
         		 <td style="width:20%;">&nbsp;</td>
    		</tr>
    	 	<tr>
	          <th style="width:40%;background: blue;" colspan="2">Grand Total</th>
	          <td style="width:20%;background: lightblue"><fmt:formatNumber value = "${sumExpense + markup}" maxFractionDigits="2" />  </td>
	          <td style="width:20%;background: lightblue;"><fmt:formatNumber value = "${DealObject.sellingPrice}" maxFractionDigits="2" /></td>
	          <td style="width:20%;">&nbsp;</td>
        	</tr>
		</table>
	</body>
<script>
$(document).ready(function () {

    $('.add-row').click(function () {
    	$('#add_expense_option_row').hide(); 
    	//$('#tbldisplayexpense tr:last').after('<tr id="expenseheader"><th style="background-color:red;width:40%;"> Expense Type </th><th style="background-color:red;width:20%;"> Expense Date</th><th style="background-color:red;width:20%;">Expense Amount</th><th style="background-color:red;width:20%;" colspan="2">&nbsp;</th></tr>');
    	$('#tbldisplayexpense tr:last').after('<tr "><td style="width:40%"> <input type="text" name="expenseName" required /></td><td style="width:20%"><input type="number" name="expenseAmount" step=".01" pattern="[0-9.]+" required />   </td><td style="width:20%"><input type="date" name="expenseDate" required/></td><td style="width:20%" colspan="2"><button id="submitexpense" class="submit-expense">Add</button>&nbsp;<button id="cancel-row" class="cancel-row">Cancel</button></td></tr>');
    	 
    	//$('.tbldisplayexpense').append('<tr><th> Expense Description </td><th> Expense Date</td><td><input type="text" name="expenseAmount"></td><td><input type="Submit" value="Add" /></td></tr>');
    });
 
    $(document).on('click','.cancel-row',function(){
    	  $(this).parent().parent().remove();
    	  $("#expenseheader").remove();
    	  $('#add_expense_option_row').show(); 
  	});
    
});
</script>
     		
  
  </html>
 