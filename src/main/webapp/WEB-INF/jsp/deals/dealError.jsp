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

    <div class="main-block">
      <h2 align="center">Deal Access Error</h2>
        <hr>
      <b><font color="red" size="3">Deal do not exist or you dont have permission to access this deal.</font></b>

	      
 </div> <!-- End of Main Block -->
  <%--  <jsp:include page="_Workloadfooter.jsp" /> --%>
  </body>
  </html>
  