<!DOCTYPE html>
<jsp:include page="../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<style>
table {
	  width: 70%;
	  border-collapse: collapse;
	  border: 1px solid #38678f;
	  margin: 5px auto;
	  background: white;
	}
	
	th {
	  background: #FFCC00;
	  width: 40%;
	  font-weight: heavy;
	  text-shadow: 0 1px 0 #38678f;
	  color: black;
	  border: 1px solid #38678f;
	  box-shadow: inset 0px 1px 2px #568ebd;
	  transition: all 0.2s;
	  
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
	input[type="radio"] {
		display: inline-block;
		opacity: 1;
		width: 1em;
		z-index: -1;
	}

select {
	appearance: none;
	outline: 0;
	background: lightblue;
	background-image: none;
	width: 80%;
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


input[type=button], input[type=submit], input[type=reset] {
	background-color: green;
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
}

.warning {
    border: 10px ridge #f00;
    background-color: #ff0;
    padding: .3rem;
    display: block;
    flex-direction: column;
}
ul li span {
        display: block;
        margin-left: -0.5em;
        color: #000;
      }
	</style>
</head>
<br>

<body>
       <table>
	       
	        <c:if test="${ConfirmationFor eq 'Hotel-Delete' }">
	        	<tr>
	       			<td>
	        			<b>Your Hotel Delete Update:-</b>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td>${confirmation}</td>
	        	</tr>
	        	<tr>
	        		<td> <a href="view_search_hotel_form"><input type="button" value="Search Hotel" /></a></td>
	        	</tr>
	        </c:if>
	        
	         <c:if test="${ConfirmationFor eq 'SightSeeing-Add-Update' }">
	        	<tr>
	       			<td>
	        			<b>Your Hotel Sight Seeing Update:-</b> 
	        		</td>
	        	</tr>
	        	<tr><td>${confirmation}</td></tr>
	        		
	        </c:if>
	        
	        <c:if test="${ConfirmationFor eq 'Hotel-Add-Update' }">
	        	<tr>
	       			<td>
	        			<b>Your Hotel Action Update:-</b>
	        		</td>
	        	</tr>
	        	<tr><td>${confirmation}</td></tr>
	        		 
	        </c:if>
	       
	        <c:if test="${ConfirmationFor eq 'Hotel-Chain-Delete' }">
	        	<tr>
	       			<td>
	        			<b>Your Delete Action Update:-</b>
	        		</td>
	        	</tr>
	        	<tr><td>${confirmation}</td></tr>
	        		 
	        </c:if>
	        <c:if test="${ConfirmationFor eq 'Hotel-Chain' }">
	        	<tr>
	       			<td>
	        			Your new updated record id is  <a href="view__hotel_chain_details?hotelChainId=${hotelChainId}"> ${hotelChainId} (Click to view) </a>
	        		</td>
	        	</tr>
	        	<tr><td>${confirmation}</td></tr>
	        </c:if>
	        
	         <c:if test="${ConfirmationFor eq 'SightSeeing-Delete' }">
	        	<tr>
	       			<td>
	        			<b>Your Sight Seeing Update:-</b> 
	        		</td>
	        	</tr>
	        	<tr><td>${confirmation}</td></tr>
				<tr>
	        		<td> <a href="view_search_sight_seeing_form"><input type="button" value="Search Sight Seeing!" /></a></td>
	        	</tr>
	        </c:if>
	        
	        
	        
       </table>
               
</body>
</html>
     
