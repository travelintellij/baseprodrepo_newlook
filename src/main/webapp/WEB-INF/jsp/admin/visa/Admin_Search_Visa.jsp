<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin_Search_Visa</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
    <script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
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
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/visa_bg5.jpg);
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
    
    <div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>
    
    <div class="Admin_Search_Visa container" >
      
            <h1 class="page-heading">Search Visa Master</h1>
            <br>
             <br>
              <br>
               <br>
                <br>
               
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <form:form method="post" action="search_search_visa_master" modelAttribute="visa_obj">
                    <input type="hidden" id="countryCode" name="countryCode" />
                <div class="Admin_Search_Visa_wrapper_data">
                    <div class="Admin_Search_Visa_wrapper_data_line">
                        <div class="Admin_Search_Visa_wrapper_data_l1">
                            <input  type="text" id="countryName"  name="countryName" placeholder="country name" required />
                        </div>
                        <div class="due_today_task_data_btns">
                            <input type="submit" name="submit" value="Search Visa Details" />
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    
    
    
     <div style="background:black;color: #32cd32 ;width:220px;text-align:center;border-radius:5px;margin:10px auto">${VISA_COUNT_MSG}</div>
     <c:if test="${not empty VISA_RESULT_SET}">
        <form:form modelAttribute="EMAIL_VISA_MASTER" action="view_email_visa_master_docs_form">
            <input type="hidden" id="countryName" name="countryName" value="${COUNTRY_NAME}" />
            <input type="hidden" id="countryCode" name="countryCode" value="${COUNTRY_CODE}" />

            <table class="vstab" style="padding:20px 10px">
                <div class="vstab_wrap_btns">
                    <div>
                        <input type="radio" id="visaCostToIncludeList" name="visaCostToIncludeList" value="b2bcost">
                        <label for="">With B2B Cost</label>
                    </div>
                    <div style="margin:0 20px">
                        <input type="radio" id="visaCostToIncludeList" name="visaCostToIncludeList" value="b2ccost"
                            checked>
                        <label for="">With B2C Cost</label>
                    </div>
                    <div style="margin-right:20px">
                        <input type="radio" id="visaCostToIncludeList" name="visaCostToIncludeList" value="bothcosts">
                        <label for="">Both Costs</label>
                    </div>
                    <div class="vstab-btn">
                        <input type="Submit" name="emailVisaDocsList" value="Email Selected" />
                    </div>
                </div>
                <thead>
                    <tr style="height:50px">
                        <th>Country Name</th>
                        <th>Consulate City</th>
                        <th>Visa Profile</th>
                        <th>Visa Type</th>
                        <th>Visa Purpose</th>
                        <th>Processing Time</th>
                        <th>Standard Cost</th>
                        <th>B2B Price</th>
                        <th>B2C Price</th>
                        <th colspan="2">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="visaMasterObj" items="${VISA_RESULT_SET}">
                        <tr style="border-top:2px solid #FABA08;padding-top:10px">
                            <td style="border-right:2px solid #FABA08">${visaMasterObj.countryName}</td>
                            <td style="border-right:2px solid #FABA08">${visaMasterObj.cityName}</td>
                            <td style="border-right:2px solid #FABA08">${VISA_PROFILE.get(visaMasterObj.profile)}</td>
                            <td style="border-right:2px solid #FABA08">${VISA_TYPE.get(visaMasterObj.visaType)}</td>
                            <td style="border-right:2px solid #FABA08">${VISA_PURPOSE.get(visaMasterObj.visaPurpose)}</td>
                            <td style="border-right:2px solid #FABA08">${visaMasterObj.processingTime} Days</td>
                            <td style="border-right:2px solid #FABA08">${visaMasterObj.standardCost}</td>
                            <td style="border-right:2px solid #FABA08">${visaMasterObj.standardB2bPrice}</td>
                            <td style="border-right:2px solid #FABA08">${visaMasterObj.standardB2cPrice}</td>
                            <td>
                                <input type="checkbox" style="width:18px;height:18px" id="visaIdListToEmail" name="visaIdListToEmail"
                                    value="${visaMasterObj.visaId}"> <b>Email</b>
                            </td>
                            <td>
                                <a href="view_list_visa_proceed_docs_form?visaId=${visaMasterObj.visaId}" style="color:red">View Details</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </form:form>
    </c:if>
</body>
<script>
	$('#countryName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getCountryList',
	paramName: "countryName",
	delimiter: ",",
	onSelect: function(suggestion) {
        cityID = suggestion.data;
        id=cityID;
        jQuery("#countryCode").val(cityID);
        $('input[name=countryCode]').val(id);
        return false;
    },
	transformResult: function(response) {
        return {
            suggestions: $.map($.parseJSON(response), function(item) {
            	return { value: item.countryName, data: item.countryCode };
            })
            
        };
    }
});
</script>
</html>