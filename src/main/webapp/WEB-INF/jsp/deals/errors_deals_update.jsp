<jsp:include page="../menu/MenuBuilder.jsp" />  

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<style>
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

<body style="background-color: #ebebeb">
<jsp:include page="../workload/view_Deal_WL_summary.jsp" />
    <div class="main-block">
      <h2 align="center">Error Updating Deal</h2>
        <hr>
      <b><font color="red" size="3">${ERRORS}</font></b>

<table style="background-color: #ebebeb; border: 1px solid #ddd;">
	<tr>
		<td style="width: 50%;">
			<form:form action="view_edit_deal_form" >
				<input type="hidden" name="dealConfirmationId" value="${DealObject.dealConfirmationId}" />
				<button type="submit">Back</button>
			</form:form>
		</td>
		<td style="width: 50%;">
			<form:form action="view_workload_createNewWorkLoadForm" target="_blank">
	      		<input type="hidden" name="dealConfirmationId" value="${DealObject.dealConfirmationId}" />
			      <button type="submit">View WorkLoad</button>
	   		</form:form>
		</td>		
		
</tr>
</table>
      
	      
 </div> <!-- End of Main Block -->
  <%--  <jsp:include page="_Workloadfooter.jsp" /> --%>
  </body>
  </html>
  