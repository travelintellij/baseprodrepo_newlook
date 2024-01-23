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
                    <title>viewIncentiveDetails</title>
                    <link rel="stylesheet" href="style.css">
                    <script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
                    <script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>
                    <link href="<c:url value=" /resources/core/main.css" />" rel="stylesheet">
                </head>
<style>
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
                    <div class="viewIncentiveDetails container">
                        <form:form modelAttribute="INCENTIVE_OBJ">
                            <div class="viewIncentiveDetails_wrapper">
                                <h1 class="hd">Incentive Claim Id - ${INCENTIVE_OBJ.incentiveId}</h1>
                                <font color="green"> ${Success} </font>
                                <font color="red"> ${Error}</font>
                                <div class="viewIncentiveDetails_wr_dt">
                                    <div class="viewIncentiveDetails_wr_dt_line">
                                        <label for="" class="lb">Requested By</label> <br>
                                        ${INCENTIVE_OBJ.claimantName} <input type="hidden" name="userId"
                                            value="${userId}" /><input type="hidden" name="userName"
                                            value="${userName}" />
                                    </div>
                                    <div class="viewIncentiveDetails_wr_dt_line">
                                        <label for="" class="lb">Deal Confirmation ID</label>
                                        <p>${INCENTIVE_OBJ.dealConfirmationId}</p>
                                        <form:hidden path="dealConfirmationId" />
                                    </div>
                                    <div class="viewIncentiveDetails_wr_dt_line">
                                        <label for="" class="lb">Guest Name</label>
                                        <p>${INCENTIVE_OBJ.guestName}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="viewIncentiveDetails_wr_dt_2">
                                <div class="viewIncentiveDetails_wr_dt_line_2 a">
                                    <p class="inc_q"> 1) Client is Referred by You ? </p>
                                    <p class="inc_a">${INCENTIVE_OBJ.question1}</p>
                                </div>
                                <div class="viewIncentiveDetails_wr_dt_line_2 a">
                                    <p class="inc_q"> 2) You took minimal support of management and were able to handle
                                        the query alone ?
                                    </p>
                                    <p class="inc_a">${INCENTIVE_OBJ.question2}</p>
                                </div>
                                <div class="viewIncentiveDetails_wr_dt_line_2 a">
                                    <p class="inc_q"> 3) You responded all queries of client yourself ontime without any
                                        delay ? </p>
                                    <p class="inc_a">${INCENTIVE_OBJ.question3}</p>
                                </div>
                                <div class="viewIncentiveDetails_wr_dt_line_2 a">
                                    <p class="inc_q"> 4) You ensured and verified with management time to time for
                                        payment settlement ? </p>
                                    <p class="inc_a">${INCENTIVE_OBJ.question4}</p>
                                </div>
                                <div class="viewIncentiveDetails_wr_dt_line_2 a">
                                    <p class="inc_q"> 5) You ensured the vouchers were sent on time and reminder call
                                        before travel is made
                                        to the client. </p>
                                    <p class="inc_a">${INCENTIVE_OBJ.question5}</p>
                                </div>
                                <div class="viewIncentiveDetails_wr_dt_line_2 a">
                                    <p class="inc_q"> 5) UdanChoo online Review achieved or decided not needed ? </p>
                                    <p class="inc_a">${INCENTIVE_OBJ.question6}</p>
                                </div>
                            </div>

                            <div class="viewIncentiveDetails_wr_dt_3">
                                <div class="viewIncentiveDetails_wr_dt_3_b a">
                                    <div class="viewIncentiveDetails_wr_dt_3_b_l3">
                                        <label for="" class="lb">Claimed Amount</label>
                                        <p>${INCENTIVE_OBJ.claimedAmount}</p>
                                    </div>
                                    <div class="viewIncentiveDetails_wr_dt_3_b_l3">
                                        <label for="" class="lb">Approved Amount</label>
                                        <p>${INCENTIVE_OBJ.approvedAmount}</p>
                                    </div>
                                    <div class="viewIncentiveDetails_wr_dt_3_b_l3">
                                        <label for="" class="lb">Claim Status</label>
                                        <p>${INCENTIVE_OBJ.claimStatusName}</p>
                                    </div>
                                </div>
                                <div class="viewIncentiveDetails_wr_dt_3_b a">
                                    <div class="viewIncentiveDetails_wr_dt_3_b_l3">
                                        <label for="" class="lb">User Remarks</label>
                                        <p>${INCENTIVE_OBJ.userRemarks}</p>
                                    </div>
                                </div>
                                <div class="viewIncentiveDetails_wr_dt_3_b a">
                                    <div class="viewIncentiveDetails_wr_dt_3_b_l3">
                                        <label for="" class="lb">Managment Remarks</label>
                                        <p>${INCENTIVE_OBJ.managementRemarks}</p>
                                    </div>
                                </div>
                                <div class="due_today_task_data_btnss" style="margin-top:20px">
                                    <a href="form_view_editIncentive?incentiveId=${INCENTIVE_OBJ.incentiveId}"><input
                                            type="button" style="background: #32cd32;" value="Edit Claim" /></a>
                                    <a href="view_default_incentives_report"><input type="button"
                                            value="View Incentive List" /></a>
                                </div>
                            </div>
                        </form:form>
                    </div>
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
                            dealURL = dealURL + '?dealConfirmationId=' + document.getElementById("dealConfirmationId").value;

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