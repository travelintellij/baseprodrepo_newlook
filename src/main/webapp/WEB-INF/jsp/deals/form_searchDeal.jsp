<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<head>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Deals</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
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
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/search_deals.jpg);
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


    <div class="search_deal container">
        <div class="search_deal_wrapper bs">
            <h1 class="search_deal_h1">
                Search Deals 
            </h1>
            <form:form modelAttribute="FILTER_DEAL_OBJ" action="view_filter_deals">
                <div class="search_deals_data">
                    <div class="search_deals_data_l1">
                        <label for="dcn">Deal Confirmation No.</label>
                        <form:input path="dealConfirmationId" type="number" min="0" size="35" value="" placeholder="Deal Number" />
                    </div>
                      <div class="l2Box2 box contactName">
                        <label for="cn">Client Name</label>
                        <form:input path="clientName"  id="clientName" name="clientName" size="35"  placeholder="Client Name" class="inf" />
                        <form:hidden path="clientId" />
                    </div>
                    <div class="search_deals_data_l1">
                        <label for="qi">Query Id</label>
                        <form:input path="queryId" type="number" min="0" value="" placeholder="Query Id" />
                    </div>
                    <div class="search_deals_data_l1">
                        <label for="status">Status</label>
                        <form:select path="dealStatus" required="required">
                            <option class="service-small" value="0">Please Select</option>
                            <form:options items="${DEAL_STATUS_MAP}" class="service-small" />
                        </form:select>
                    </div>&nbsp;&nbsp;&nbsp;&nbsp;
                     <div class="search_deals_data_l1">
                        <label for="dealOwner">Deal Owner</label>
                        <form:select path="dealOwner" required="required">
                            <option class="service-small" value="0">Please Select</option>
                            <form:options items="${ACTIVE_USERS_MAP}" class="service-small" />
                        </form:select>
                    </div>
                </div>
                
                <div class="search_deals_data">
                    <div class="search_deals_data_l1 search_deal_chs">
						<form:radiobutton path="searchOnBookingDate" value="true" style="display: inline-block;width: 20px;height: 20px;margin-left: -25px;margin-right:10px"/>                        
                      <label for="true" class="radio">Booking Date</label>
                      <!--   
                        <input type="radio" value="true" id="true" name="searchOnBookingDate" checked style="display: inline-block;width: 20px;height: 20px;margin-left: -25px;margin-right:10px">
                         -->
                        
                    </div>
                    <div class="search_deals_data_l1 search_deal_chs">
                        <form:radiobutton path="searchOnBookingDate" value="false" style="display: inline-block;width: 20px;height: 20px;margin-left: -25px;margin-right:10px"/>
                        <!-- 
                        <input type="radio" value="false" id="false" name="searchOnBookingDate" name="" style="display: inline-block;width: 20px;height: 20px;margin-left: -25px;margin-right:10px">
                        -->
                        <label for="false" class="radio">Travel Date</label>
                    </div>
                    <div class="IncentiveReportSearch_wrapper_dl1_r">
                        <label for="">Search Period </label>
                        <form:select path="dealSearchPeriodType" required="required" style="width:90%">
	                         <form:options items="${DEAL_SEARCH_PERIOD_TYPE}" class="service-small" />
                        </form:select>
                    </div>
                    <div class="search_deals_data_l1">
                        <label for="sd">Start Date</label>
                        <form:input path="startDate" type="date" required="required" />
                    </div>
                    <div class="search_deals_data_l1">
                        <label for="to">To </label> <br>
                        <form:input path="endDate" type="date" required="required" style="width:100%"/>
                    </div>
                </div>
                <div class="search_deals_btns">
                    <button type="submit">Search</button>
                    <a href="view_deal_searchDealForm">Clear Filter</a>
                </div>
                <div align="center">
                    <font color="red">
                        <form:errors path="endDate" cssClass="error" />
                    </font>
                </div>
                <div align="center"><font color="red"> <form:errors path="endDate" cssClass="error" /></font></div>
            </form:form>
        </div>

    </div>



    <script>

        //document.getElementById('startDate').value = new Date().toISOString().substring(0, 10);
        //document.getElementById('endDate').value = new Date().toISOString().substring(0, 10);

        $(document).ready(function () {
            $('#clientName').autocomplete({
                serviceUrl: '${pageContext.request.contextPath}/getClientList',
                paramName: "tagName",
                delimiter: ",",
                onSelect: function (suggestion) {
                    cityID = suggestion.data;
                    id = cityID;
                    jQuery("#clientId").val(cityID);
                    $('input[name=clientId]').val(id);
                    return false;
                },
                transformResult: function (response) {
                    return {
                        suggestions: $.map($.parseJSON(response), function (item) {
                            return { value: item.tagName, data: item.id };
                        })

                    };
                }
            });
        });
    </script>
</body>
</html>