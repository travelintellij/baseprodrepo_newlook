<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
* {
  box-sizing: border-box;
}
</style>
        <div id="tooplate_sidebar">
        
            <div id="header">
                <h1>
                <a href="view_workload_createNewWorkLoadForm?dealConfirmationId=${dealConfirmationId}"><img src="${pageContext.request.contextPath}/resources/images/Udanchoo.jpg" height="100" width="120" title="travel Governor" /><br>
                <img src="${pageContext.request.contextPath}/resources/images/home.jpg" height="30" width="30" title="UdanChoo Intranet" />
                </a>
                </h1>
            </div>    
            
            <ul class="navigation">
 	            <c:forEach var="listValue"  items="${DealObject.serviceWorkLoadList}" varStatus="loopCounter">
                 	 <li><a href="view_workload_${listValue.dealServiceCode}?dealConfirmationId=${DealObject.dealConfirmationId}" class="${listValue.dealServiceCode}">${listValue.serviceName}</a></li> 
           		 </c:forEach>
                    
                    <!--  
                    <li><a href="#home" class="menu_01">Home</a></li>
                    <li><a href="view_workload_createNewDealForm" class="menu_02" onclick="return hrefclick(this);">Create New Deal</a></li>
                    <li><a href="IncentiveReport" class="menu_03">My Workload</a></li>
                    <li><a href="#gallery" class="menu_04">Gallery</a></li>
                    <li><a href="#contactus" class="menu_05">Contact</a></li>
                    -->
                </ul>
	</div> <!-- end of sidebar -->  

   
	