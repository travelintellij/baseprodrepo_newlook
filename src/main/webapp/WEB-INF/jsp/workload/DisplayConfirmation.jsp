<jsp:include page="../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">


     
	<ul id="content">
       <table cellpadding="10px" align="center">
	       <tr><td>
	       
	        <c:if test="${ConfirmationFor eq 'Deal-Update' }">
	        	<b>Your Deal Action Update:-</b> 
	        </c:if>

	       
	       
	       </td>
	       </tr>
	       <tr><td>${confirmation}</td></tr>
       </table>
               
     </ul>
     
