<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>viewCityListing</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
    <script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">

</head>
<style>
/* The Modal (background) */
	.modal {
	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 1; /* Sit on top */
	  padding-top: 50px; /* Location of the box */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 90%; /* Full height */
	  overflow: scroll; /* Enable scroll if needed */
	  background-color: rgb(0,0,0); /* Fallback color */
	  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content */
	.modal-content {
	  position: relative;
	  background-color: #fefefe;
	  margin: auto;
	  padding: 0;
	  border: 1px solid #888;
	  width: 90%;
	  height: 90%;
	  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
	  -webkit-animation-name: animatetop;
	  -webkit-animation-duration: 0.4s;
	  animation-name: animatetop;
	  animation-duration: 0.4s
	}
	
	/* Add Animation */
	@-webkit-keyframes animatetop {
	  from {top:-300px; opacity:0} 
	  to {top:0; opacity:1}
	}
	
	@keyframes animatetop {
	  from {top:-300px; opacity:0}
	  to {top:0; opacity:1}
	}
	
	/* The Close Button */
	.close {
	  color: white;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	  color: #000;
	  text-decoration: none;
	  cursor: pointer;
	}
	
	.modal-header {
	  padding: 2px 16px;
	  background-color: lightblue;
	  color: white;
	}
	
	.modal-body {padding: 2px 16px;}
	
	.modal-footer {
	  padding: 2px 16px;
	  background-color: lightblue;
	  color: white;
	}
	
table {
  width: 100%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
}

th {
  background: #D33F14;
  height: 40px;
  width: 10%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
}
tr {
  border-bottom: 2px solid #FFCF53;
}

td {
  border-right: 2px solid #FFCF53;
  padding: 10px;
  transition: all 0.2s;
  text-align: center;
}

.heavyTable {
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
  animation: float 5s infinite;
}


        body::before {
            content: "";
            background-image:   url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);
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

</style>
<body>
    <div class="viewCityListing container">
        <div class="viewCityListing_wrapper">
            <form:form modelAttribute="SEARCH_CITY" action="view_search_city_form">
                <h1 class="page-heading">Search City</h1>
                <div align="center"><b>
                        <font color="green"> ${Success} </font>
                        <font color="red"> ${Error}</font>
                    </b></div>
                <div class="viewCityListing_wrapper_data">
                    <div class="viewCityListing_wrapper_data_line">
                        <div class="viewCityListing_wrapper_data_l1">
                            <label for="">Destination Id</label>
                            <form:input path="destinationId" name="destinationId" />
                        </div>
                        <div class="viewCityListing_wrapper_data_l1">
                            <label for="">City Name</label>
                            <form:input path="cityName" name="cityName" />
                        </div>
                        <div class="viewCityListing_wrapper_data_l1">
                            <label for="">Country Name</label>
                            <form:select path="countryCode" required="required">
                                <c:forEach items="${ACTIVE_CTRYCODE_CTRYNAME_LIST}" var="destinationObj">
                                    <c:if test="${destinationObj.countryCode eq SEARCH_CITY.countryCode}">
                                        <option class="service-small" value="${destinationObj.countryCode}" selected>
                                            ${destinationObj.countryName}
                                        </option>
                                    </c:if>
                                    <c:if test="${destinationObj.countryCode ne SEARCH_CITY.countryCode}">
                                        <option class="service-small" value="${destinationObj.countryCode}">
                                            ${destinationObj.countryName}</option>
                                    </c:if>
                                </c:forEach>
                            </form:select>
                        </div>
                    </div>
                </div>
                <div class="due_today_task_data_btns">
                    <input type="submit" value="Apply Filter" style="background:#4CAF50"/>
                    <a href="view_search_city_form">Clear Filter</a>
                </div>
            </form:form>
        </div>
        
        
        <!-- ############## tabel starts here ####################### -->
        
        <div>
          <c:set value="${CITY_LIST}" var="cityList" />
	      <table style="width:100%;text-align:center;margin-top:10px;border:none">
			<tr style="height:40px">
				<th style="width:5%;background-color:#6082B6;">Destination Id</th>
				<th style="width:15%;background-color:#6082B6;">City Name</th>
				<th style="width:10%;background-color:#6082B6;">Country Name</th>
				<th style="width:10%;background-color:#6082B6;">Status</th>
				<th style="width:10%;background-color:#6082B6;">Action</th>
			</tr>
			<c:forEach items="${cityList}" var="cityRec">
				<tr style="background:black;color:white">
					<td style="width:5%;">${cityRec.destinationId }</td>
					<td style="width:15%;">${cityRec.cityName }</td>
					<td style="width:10%;">${cityRec.countryName }</td>
					<td style="width:10%;">
						<c:if test="${cityRec.active eq true}">
								<input type="button" style="background-color: #32cd32;border:none;outline:none;border-radius:5px;;padding: 4px 5px;pointer-events: none;"  value="Active" />
						</c:if>
						<c:if test="${cityRec.active eq false}">
								<input type="button" style="background-color: red;border:none;outline:none;border-radius:5px;;padding: 4px 5px;pointer-events: none;"  value="In-Active" />
						</c:if> 
					
					</td>
					
					<td style="width:10%;">
						<sec:authorize access="hasAnyRole('ADMIN')">
							<a href="view_edit_city_form?destinationId=${cityRec.destinationId }"><input type="button" style="background-color: #786AAF;border:none;outline:none;border-radius:5px;;padding: 4px 5px;pointer-events: none;" value="Edit" /></a> 
						</sec:authorize>
					</td>
				</tr>
			</c:forEach>
		  </table>
		  </div>


                
                <!-- The Modal -->
                <div id="myModal" class="modal">

                    <!-- Modal content -->
                    <div class="modal-content">
                        <div class="modal-header">
                            <span class="close">&times;</span>
                            <br>
                            <h2 style="text-align:center;" id="modelheaderh2">Supplier Details</h2>
                        </div>
                        <div class="modal-body">


                        </div>
                        <div class="modal-footer">
                            <h3>Powered by @TravelIntelliJ</h3>
                        </div>
                    </div>

                </div>

                <div id="pagination" align="center">
                 <p style="color:#ffa500;background:black;display:inline-block;padding:2px;border-radius:2px">Page : </p>
                        <c:url value="view_search_city_form" var="prev">
                            <c:param name="page" value="${page-1}" />
                        </c:url>
                        <c:if test="${page > 0}">
                            <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href="<c:out value=" ${prev}&sortBy=${sortBy}&countryCode=${countryCode}" />" class="pn
                            prev">Prev</a>
                        </c:if>

                        <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                            <c:choose>
                                <c:when test="${(page+1) == i.index}">
                                    <span style="background:black;padding:2px 5px;border-radius:2px;color:white">${i.index}</span>
                                </c:when>
                                <c:otherwise>
                                    <c:url value="view_search_city_form" var="url">
                                        <c:param name="page" value="${i.index-1}" />
                                    </c:url>
                                    <a style="background:white;padding:2px 5px;border-radius:2px;color:black"
                                        href='<c:out value="${url}&sortBy=${sortBy}&countryCode=${countryCode}" />'>${i.index}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:url value="view_search_city_form" var="next">
                            <c:param name="page" value="${page + 1}" />
                        </c:url>
                        <c:if test="${page + 1 < maxPages}">
                            <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href='<c:out value="${next}&sortBy=${sortBy}&countryCode=${countryCode}" />'
                                class="pn next">Next</a>
                        </c:if>
                    </font>
                </div>
  
                <!-- Add more rows as needed -->
    </div>
</body>

</html>