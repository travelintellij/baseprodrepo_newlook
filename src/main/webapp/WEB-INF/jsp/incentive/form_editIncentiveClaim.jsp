<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>form_editIncentiveClaim</title>
                    <link rel="stylesheet" href="style.css">
                    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
                    <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
                    <link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
                </head>
                <style>
                
	/* The Modal (background) */
	.modal {
	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 999; /* Sit on top */
	  padding-top: 50px; /* Location of the box */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 100%; /* Full height */
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
	  width: 80%;
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
	  background-color: #bde0fe;
	  color: white;
	}
	
	
	
	.modal-footer {
	  padding: 2px 16px;
	  background-color: #bde0fe;
	  color: white;
	}
                  body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/lens.jpg);
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
                
                    <div class="form_editIncentiveClaim container">
                    
                    
                   
                    
                        <form:form method="post" action="edit_edit_incentive_details" modelAttribute="INCENTIVE_OBJ">
                            <form:input type="hidden" path="incentiveId" />
                            <div class="form_editIncentiveClaim_wrapper bs">
                                <h1 class="hd" style="color:black">Update Incentive Details</h1>
                                <h2 class="hd">Incentive Id - ${INCENTIVE_OBJ.incentiveId}</h2>
                                <div class="form_editIncentiveClaim_wrapper_data">
                                    <div class="form_editIncentiveClaim_wrapper_data_line">
                                        <label for="">Incentive Claimant</label>
                                        <sec:authorize access="hasAnyRole('ADMIN')">

                                            <div class="select">
                                                <form:select path="claimantId" required="required" style="width:90%">
                                                    <form:options items="${ACTIVE_USERS_MAP}" class="service-small" />
                                                </form:select>
                                            </div>

                                        </sec:authorize>
                                        <sec:authorize access="! hasAnyRole('ADMIN')">

                                            ${INCENTIVE_OBJ.claimantName }

                                        </sec:authorize>
                                    </div>
                                    <div class="form_editIncentiveClaim_wrapper_data_line">
                                        <label for="">Deal Id</label>
                                        <input class="form-control search-slt" type="text" name="dealName" id="dealName"
                                            placeholder="Deal Search - Enter Only numeric Deal # or Client Name "
                                            value=${INCENTIVE_OBJ.dealConfirmationId } />
                                        <form:hidden path="dealConfirmationId" /> <br>
                                        <a class="m-btn" id="myBtn[${filteredLeads.leadId}]" onclick="myLeadDisplay(this)" data-load-url="view_view_deal_form_modal" data-toggle="modal" data-target="#myModal" ><input type="button" style="background-color: #786AAF;padding: 4px 5px;"  value="View Lead Details" /></a> 
		       		                    <br><font color="red">
		       		                   <form:errors path="dealConfirmationId" cssClass="error" /></font>
                                    </div>
                                </div>
                            </div>
                            <div class="form_editIncentiveClaim_wrapper bs">
                                <p style="color:orangered">Please answer the following questions to justify your claim
                                    for an in centive.
                                    Please make a note that if we find any information marked wrong or not justified
                                    then your claim will
                                    rejected.</p>
                            </div>
                            <div class="form_editIncentiveClaim_wrapper bs" style="width:1000px">
                                <h1 style="color:black">incentiive effort details</h1>
                                <div class="viewIncentiveDetails_wr_dt_2">
                                    <div class="viewIncentiveDetails_wr_dt_line_2 a">
                                        <p class="inc_q" style="background:#a2d2ff;padding-left:5px"> 1) Client is Referred by You ? </p>
                                        <p class="inc_a" style="background:#bde0fe;color:black;text-align:center">
                                            <form:radiobutton path="question1" value="1" /> Yes
                                            <form:radiobutton path="question1" value="0" /> No
                                        </p>
                                    </div>
                                    <div class="viewIncentiveDetails_wr_dt_line_2 a">
                                        <p class="inc_q" style="background:#a2d2ff;padding-left:5px"> 2) You took minimal support of management and were able to
                                            handle
                                            the query alone ?
                                        </p>
                                        <p class="inc_a" style="background:#bde0fe;color:black;text-align:center">
                                            <form:radiobutton path="question2" value="true" /> Yes
                                            <form:radiobutton path="question2" value="false" /> No
                                        </p>
                                    </div>
                                    <div class="viewIncentiveDetails_wr_dt_line_2 a">
                                        <p class="inc_q" style="background:#a2d2ff;padding-left:5px"> 3) You responded all queries of client yourself ontime without
                                            any
                                            delay ? </p>
                                        <p class="inc_a" style="background:#bde0fe;color:black;text-align:center">
                                            <form:radiobutton path="question3" value="Yes" /> Yes
                                            <form:radiobutton path="question3" value="No" /> No
                                        </p>
                                    </div>
                                    <div class="viewIncentiveDetails_wr_dt_line_2 a">
                                        <p class="inc_q" style="background:#a2d2ff;padding-left:5px"> 4) You ensured and verified with management time to time for
                                            payment settlement ? </p>
                                        <p class="inc_a" style="background:#bde0fe;color:black;text-align:center">
                                            <form:radiobutton path="question4" value="Yes" /> Yes
                                            <form:radiobutton path="question4" value="No" /> No
                                        </p>
                                    </div>
                                    <div class="viewIncentiveDetails_wr_dt_line_2 a">
                                        <p class="inc_q" style="background:#a2d2ff;padding-left:5px"> 5) You ensured the vouchers were sent on time and reminder
                                            call
                                            before travel is made
                                            to the client. </p>
                                        <p class="inc_a" style="background:#bde0fe;color:black;text-align:center">
                                            <form:radiobutton path="question5" value="Yes" /> Yes
                                            <form:radiobutton path="question5" value="No" /> No
                                        </p>
                                    </div>
                                    <div class="viewIncentiveDetails_wr_dt_line_2 a">
                                        <p class="inc_q" style="background:#a2d2ff;padding-left:5px"> 6) UdanChoo online Review achieved or decided not needed ?
                                        </p>
                                        <p class="inc_a" style="background:#bde0fe;color:black;text-align:center">
                                            <form:radiobutton path="question6" value="Yes" /> Yes
                                            <form:radiobutton path="question6" value="No" /> No
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="form_editIncentiveClaim_wrapper">
                                <form:input type="hidden" path="claimedAmount" />
                                <form:input type="hidden" path="userRemarks" />
                                <div class="form_editIncentiveClaim_wrapper_data_p">
                                    <div class="inc_sp_l">
                                        <div class="form_editIncentiveClaim_wrapper_data_line">
                                            <label for="" style="color:black;">Claimed Amount</label>
                                            <p style="color:#32cd32;font-weight:bold;">${INCENTIVE_OBJ.claimedAmount}</p>
                                        </div>
                                        <div class="form_editIncentiveClaim_wrapper_data_line">
                                            <label for="" style="color:black">Approved Amount</label>
                                            <form:input type="number" path="approvedAmount" />
                                        </div>
                                        <div class="form_editIncentiveClaim_wrapper_data_line">
                                            <label for="" style="color:black">Updated Claim Status</label>
                                            <form:select path="status" required="required" style="width:90%">
                                                <form:options items="${ACTIVE_INCENTIVE_STATUS}"
                                                    class="service-small" />
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="inc_sp_l2">
                                        <div class="form_editIncentiveClaim_wrapper_data_line" style="width:97%">
                                            <label for="" style="color:black">User Remarks</label>
                                            <p style="color:white">${INCENTIVE_OBJ.userRemarks}</p>
                                        </div>
                                        <div class="form_editIncentiveClaim_wrapper_data_line">
                                            <label for="" style="color:black">Managment Remarks</label>
                                            <form:textarea path="managementRemarks" cols="115" rows="2"
                                                maxlength="250" style="resize: none;"/>
                                        </div>

                                    </div>
                                    <div style="display: flex;justify-content: center;color:#32cd32 ">
                                        <p style="margin-right:10px">Inform Claimant</p>
                                        <form:checkbox path="notifyClaimant" style="margin-right:10px" />
                                        <p>(if checked email will be sent to claimant)</p>
                                    </div>
                                    <div class="due_today_task_data_btnss">
                                        <input type="submit" value="Update Claim" />
                                        <a href="view_default_incentives_report"><input type="button"
                                                value="Cancel" /></a>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                    </div>


                    <div id="myModal" class="modal">
                        <!-- Modal content -->
                        <div class="modal-content">
                            <div class="modal-header">
                                <span class="close">&times;</span>
                                <br>
                                <h2 style="text-align:center;">View Deal Details</h2>
                            </div>
                            <div class="modal-body">


                            </div>
                            <div class="modal-footer">
                                <h3>Powered by @TravelIntelliJ</h3>
                            </div>
                        </div>
                    </div>

                  <script>
$('#dealName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getDealInfo',
	paramName: "dealKeyword",
	delimiter: ",",
	onSelect: function(suggestion) {
        dealID = suggestion.data;
        id=dealID;
        jQuery("#dealConfirmationId").val(dealID);
        $('input[name=dealName]').val(id);
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

</script>

<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];



function myLeadDisplay(clicked) { 
	//alert(document.getElementById("dealName").value);
	//document.getElementsByTagName("H1")[0].setAttribute("myModal", "data-load-url") = document.getElementById("dealName").value;
	//$(clicked).attr('data-load-url')="view_view_deal_form_modal?dealConfirmationId=227";
	var dealURL =$(clicked).attr('data-load-url');
	dealURL = dealURL+'?dealConfirmationId='+document.getElementById("dealName").value;
	
	$("#myModal .modal-body").load(dealURL);
	//$("#myModal .modal-body").load($(clicked).attr('data-load-url'));
	modal.style.display = "block";
}   
// When the user clicks the button, open the modal 
/*btn.onclick = function() {
	//$("#myModal .modal-body").html('pass your html text here');
	$("#myModal .modal-body").load($(this).attr('data-load-url'));
	modal.style.display = "block";
  
}*/

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
	modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
                </body>
</html>