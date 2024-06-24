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
                    <title>SubmitNewIncentiveClaim</title>
                    <link rel="stylesheet" href="style.css">
                    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
                    <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
                    <link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
                    <link href="<c:url value="/resources/css/jquery.datetimepicker.min.css" />" rel="stylesheet">
                    <script src="<c:url value="/resources/js/jquery.datetimepicker.full.js" />"></script>
                </head>
                <style>
                    body::before {
                        content: "";
                        background-image: url(${pageContext.request.contextPath}/resources/images/revamped/lens.jpg);
                        background-size: cover;
                        background-repeat: no-repeat;
                        background-position: center center;
                        background-attachment: fixed;
                        position: fixed;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        opacity: 0.5;
                        /* Adjust the opacity value as needed (0.0 to 1.0) */
                        z-index: -1;
                    }

                    body {
                        font-family: Arial, Helvetica, sans-serif;
                    }

                    /* The Modal (background) */
                    .modal {
                        display: none;
                        /* Hidden by default */
                        position: fixed;
                        /* Stay in place */
                        z-index: 1;
                        /* Sit on top */
                        padding-top: 50px;
                        /* Location of the box */
                        left: 0;
                        top: 0;
                        width: 100%;
                        /* Full width */
                        height: 100%;
                        /* Full height */
                        overflow: scroll;
                        /* Enable scroll if needed */
                        background-color: rgb(0, 0, 0);
                        /* Fallback color */
                        background-color: rgba(0, 0, 0, 0.4);
                        /* Black w/ opacity */
                    }

                    /* Modal Content */
                    .modal-content {
                        position: relative;
                        background-color: #fefefe;
                        margin: auto;
                        padding: 0;
                        border: 1px solid #888;
                        width: 80%;
                        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                        -webkit-animation-name: animatetop;
                        -webkit-animation-duration: 0.4s;
                        animation-name: animatetop;
                        animation-duration: 0.4s
                    }

                    /* Add Animation */
                    @-webkit-keyframes animatetop {
                        from {
                            top: -300px;
                            opacity: 0
                        }

                        to {
                            top: 0;
                            opacity: 1
                        }
                    }

                    @keyframes animatetop {
                        from {
                            top: -300px;
                            opacity: 0
                        }

                        to {
                            top: 0;
                            opacity: 1
                        }
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

                    .modal-footer {
                        padding: 2px 16px;
                        background-color: lightblue;
                        color: white;
                    }

                    table {
                        width: 50%;
                        height: 80%;
                        border-collapse: collapse;
                        border: 1px solid #38678f;
                        margin: 5px auto;
                        background: white;
                    }

                    th {
                        background: lightgray;
                        height: 40px;
                        width: 40%;
                        font-weight: normal;
                        text-shadow: 0 1px 0 #38678f;
                        color: white;
                        border: 1px solid white;
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

                    input[type=button],
                    input[type=submit],
                    input[type=reset] {
             
                        border: none;
                        color: black;
                        padding: 10px 20px;
                        text-decoration: none;
                        margin: 4px 2px;
                        cursor: pointer;
                    }

                    input[type="radio"] {
                        display: inline-block;
                        opacity: 1;
                        width: 1em;
                        z-index: -1;
                    }
                </style>

                <body>
                    <form:form method="post" action="edit_edit_incentive_details" modelAttribute="INCENTIVE_OBJ">
                        <form:hidden path="incentiveId" />
                        <form:hidden path="status" />
                        <div class="SubmitNewIncentiveClaim container">
                            <div class="SubmitNewIncentiveClaim_wrapper bs">
                                <h1 class="hd" style="color:#FFBA08">Incentive Claim Form</h1>
                        		<font color="red">
                                	<form:errors path="dealConfirmationId" cssClass="error" />
                                	<form:errors path="claimantId" cssClass="error" />
                                </font>
                                <div class="SubmitNewIncentiveClaim_wrapper_data">
                                    <div class="SubmitNewIncentiveClaim_wrapper_data_line">
                                        <div class="SubmitNewIncentiveClaim_wrapper_dl1">
                                            <label for="">Incentive Claimant</label> <br>
                                            <sec:authorize access="hasAnyRole('ADMIN')">
											
                                                <div class="select">
                                                    <form:select path="claimantId" required="required" style="width:90%">
                                                        <c:forEach items="${ACTIVE_USERS_MAP}" var="userMap">
                                                            <c:if test="${userMap.key eq claimantId }">
                                                                <option class="service-small" value="${userMap.key}" selected>${userMap.value}</option>
                                                            </c:if>
                                                            <c:if test="${userMap.key ne claimantId }">
                                                                <option class="service-small" value="${userMap.key}">
                                                                    ${userMap.value}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>

                                            </sec:authorize>

                                            <sec:authorize access="! hasAnyRole('ADMIN')">
                                                <form:input type="hidden" path="claimantId" value="${userId}" />
                                                ${userName }

                                            </sec:authorize>
                                        </div>
                                        
                                        <div class="SubmitNewIncentiveClaim_wrapper_dl2">
                                            <label for="">Deal ID</label> <br>
                                            <form:input path="dealName" name="dealName" class="form-control search-slt" id="dealName" placeholder="Deal Search - Enter Only numeric Deal # or Client Name " disabled="true" />
                                            <form:hidden path="dealName" />
                                            <form:hidden path="dealConfirmationId" />
                                            <br>
                                           
                                        </div>
                                        <div class="due_today_task_data_bt SubmitNewIncentiveClaim_btn">
                                            <a id="myBtn[${filteredLeads.leadId}]" onclick="myLeadDisplay(this)"
                                                data-load-url="view_view_deal_form_modal" data-toggle="modal"
                                                data-target="#myModal"><input type="button" value="View Deal Details" style="border-radius:5px;margin-bottom:-10px;background:#FFBA08"/></a>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="claim_ques bs">
                              <h2 align="center" class="hd" style="color:black">Incentive Effort Details</h2>
                               <p style="text-align:start"> Please answer the following questions to justiy your claim for incentive.
                                Please make a note that if we find any infomation marked wrong or not
                                justified then your claim will be rejected. </p>
                            </div>


                          
                            <table style="background-color:lightgray;width:1200px">
                                <tr>
                                    <th style="width:5%;color:black">1</th>
                                    <th style="width:65%; padding: 5px;text-align:left;color:black">
                                   <p> Client is Referred by
                                        You ? </p>
                                        <form:errors path="question1" cssClass="error" />
                                    </th>
                                    <td><form:radiobutton path="question1" value="Yes" label="Yes" /></td> 
                                    <td><form:radiobutton path="question1" value="No" label="No" /></td> 
                                    
                                </tr>
                                <tr>
                                    <th style="width:5%;color:black">2</th>
                                    <th style="width:50%; padding: 5px;text-align:left;color:black"> <p>You took minimal
                                        support of management and were able to handle the query alone ? </p>
                                    </th>
                                    <td><form:radiobutton path="question2" value="Yes" label="Yes" /></td> 
                                    <td><form:radiobutton path="question2" value="No" label="No" /></td> 
                                </tr>
                                <tr>
                                    <th style="width:5%;color:black">3</th>
                                    <th style="width:50%; padding: 5px;text-align:left;color:black"><p> You responded all
                                        queries of client yourself ontime without any delay ? </p>
                                    </th>
                                    <td><form:radiobutton path="question3" value="Yes" label="Yes" /></td> 
                                    <td><form:radiobutton path="question3" value="No" label="No" /></td> 
                                </tr>
                                <tr>
                                    <th style="width:5%;color:black">4</th>
                                    <th style="width:50%; padding: 5px;text-align:left;color:black"><p> You ensured and
                                        verified with management time to time for payment settlement ? </p> </th>
                                    <td><form:radiobutton path="question4" value="Yes" label="Yes" /></td> 
                                    <td><form:radiobutton path="question4" value="No" label="No" /></td> 
                                </tr>
                                <tr>
                                    <th style="width:5%;color:black">5</th>
                                    <th style="width:50%; padding: 5px;text-align:left;color:black"> <p>You ensured Vouchers
                                        Shared, Invoices Collected and all settled with the deal ? </p> </th>
                                    <td><form:radiobutton path="question5" value="Yes" label="Yes" /></td> 
                                    <td><form:radiobutton path="question5" value="No" label="No" /></td> 
                                </tr>
                                <tr>
                                    <th style="width:5%;color:black">6</th>
                                    <th style="width:50%; padding: 5px;text-align:left;color:black"><p> UdanChoo online
                                        Review achieved or decided not needed ? </p>
                                    </th>
                                    <td><form:radiobutton path="question6" value="Yes" label="Yes" /></td> 
                                    <td><form:radiobutton path="question6" value="No" label="No" /></td> 
                                </tr>
                            </table>



                            <table style="background-color:lightgray;width:1200px">
                              <tr>
								    <th style="color:black"> <p> Claim Type </p></th>
								    <td>
								    	<font color="red"><form:errors path="claimOption" cssClass="error" /></font>
								       <form:radiobutton path="claimOption" id="incentive" value="INCENTIVE"/><label for="incentive">Incentive</label>&nbsp; &nbsp; &nbsp;
								       <form:radiobutton path="claimOption" id="targetAmount" value="TARGET"/><label for="target">Target</label>
								    </td>
								</tr>
                                <tr>
                                    <th style="color:black"><p> Claimed Amount </p></th>
                                   <td style="text-align:left;color:black">
										<table style="width:500px;border:none;">
										<th style="color:black;text-align: center;"><p> Gross Claim  </p></th>
										<td>
											<form:input path="grossClaim" type="number" min="20" class="contact" style="height:30px;width: 100px;" id="grossClaim" oninput="calculateGST()" />
										</td>
										<th style="color:black;text-align: center;"><p> Nett Claim  </p></th>
										<td>
											<form:input path="claimedAmount" type="number" min="20" class="contact" style="height:30px;width: 100px;" id="claimedAmount" step="1" />
										</td>
										</table>	                                    
                                    <br>
                                        <font color="red">
                                            <form:errors path="claimedAmount" cssClass="error" />
                                        </font>
                                    </td>
                                </tr>
                                <tr>
                                    <th style="color:black"><p> User Remarks </p></th>
                                    <td style="text-align:left;">
                                    
                                    <form:textarea path="userRemarks" maxlength="250" id="userRemarks" cols="75" rows="2" style="resize: none;" /><br>
                                    
                                        <font color="red">
                                            <form:errors path="userRemarks" cssClass="error" />
                                        </font>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="
due_today_task_data_btnss" style="text-align:center;width:50%;background:white" colspan="2" >
                                        <input type="submit" value="Submit Claim">
                                        <a href="view_default_incentives_report"><input type="button"
                                                value="View Incentive Listing" /></a>
                                    </td>
                                </tr>
                            </table>


                        </div>
                    </form:form>
                    <div id="myModal" class="modal" style="margin-top:100px">

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
                    function calculateGST() {
                        // Get the value entered in the first text box
                        var amountWithGST = parseFloat(document.getElementById('grossClaim').value);
                        
                        // Calculate the non-GST amount
                        var amountWithoutGST = amountWithGST / 1.18; // 18% GST = 1.18
                        
                        // Set the value of the second text box with the non-GST amount
                        document.getElementById('claimedAmount').value = amountWithoutGST.toFixed(0); // Display up to 2 decimal places
                    }

                    // Disable the context menu (right-click menu) for the second text box
                    document.getElementById('claimedAmount').addEventListener('contextmenu', function (e) {e.preventDefault();});
                    
                    $('#dealName').autocomplete({
                            serviceUrl: '${pageContext.request.contextPath}/getDealInfo',
                            paramName: "dealKeyword",
                            delimiter: ",",
                            onSelect: function (suggestion) {
                                dealID = suggestion.data;
                                id = dealID;
                                jQuery("#dealConfirmationId").val(dealID);
                                $('input[name=dealName]').val(id);
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
                            var dealURL = $(clicked).attr('data-load-url');
                            dealURL = dealURL + '?dealConfirmationId=' + document.getElementById("dealName").value;

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
                        span.onclick = function () {
                            modal.style.display = "none";
                        }

                        // When the user clicks anywhere outside of the modal, close it
                        window.onclick = function (event) {
                            if (event.target == modal) {
                                modal.style.display = "none";
                            }
                        }
                        

                        
                    </script>

                </body>

</html>