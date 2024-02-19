<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <link href="<c:url value=" /resources/core/main.css" />
</head>
<body>     

        <div class="viewIncentiveDetails_modal container" style="width:950px">
        <font color="green"> ${Success} </font>
        <font color="red"> ${Error}</font>
        <div class="viewIncentiveDetails_modal_wrapper">
            <h1 class="hd">Incentive Claim Id - ${INCENTIVE_OBJ.incentiveId}</h1>
            <div class="viewIncentiveDetails_modal_wrapper_data">
                <div class="viewIncentiveDetails_modal_wrapper_data_line">
                    <label for="" class="lb">Requested By</label>
                    <p>${INCENTIVE_OBJ.claimantName}</p>
                    <input type="hidden" name="userId" value="${userId}" />
                    <input type="hidden" name="userName" value="${userName}" />
                </div>
                <div class="viewIncentiveDetails_modal_wrapper_data_line">
                    <label for="" class="lb">Deal Confirmation Id</label>
                    <p>${INCENTIVE_OBJ.dealConfirmationId}</p>
                </div>
                <div class="viewIncentiveDetails_modal_wrapper_data_line">
                    <label for="" class="lb">Guest Name</label>
                    <p>${DEAL_OBJ.clientName}</p>
                </div>
            </div>
            <div class="viewIncentiveDetails_modal_wrapper_data">
                <div class="viewIncentiveDetails_wr_dt_n">
                    <div class="viewIncentiveDetails_wr_dt_line_2 a">
                        <p class="inc_q"> 1) Client is Referred by You ? </p>
                        <p class="inc_a" style="text-align:center">${INCENTIVE_OBJ.question1}</p>
                    </div>
                    <div class="viewIncentiveDetails_wr_dt_line_2 a">
                        <p class="inc_q"> 2) You took minimal support of management and were able to handle
                            the query alone ?
                        </p>
                        <p class="inc_a" style="text-align:center">${INCENTIVE_OBJ.question2}</p>
                    </div>
                    <div class="viewIncentiveDetails_wr_dt_line_2 a">
                        <p class="inc_q"> 3) You responded all queries of client yourself ontime without any
                            delay ? </p>
                        <p class="inc_a" style="text-align:center">${INCENTIVE_OBJ.question3}</p>
                    </div>
                    <div class="viewIncentiveDetails_wr_dt_line_2 a">
                        <p class="inc_q"> 4) You ensured and verified with management time to time for
                            payment settlement ? </p>
                        <p class="inc_a" style="text-align:center">${INCENTIVE_OBJ.question4}</p>
                    </div>
                    <div class="viewIncentiveDetails_wr_dt_line_2 a">
                        <p class="inc_q"> 5) You ensured the vouchers were sent on time and reminder call
                            before travel is made
                            to the client. </p>
                        <p class="inc_a" style="text-align:center">${INCENTIVE_OBJ.question5}</p>
                    </div>
                    <div class="viewIncentiveDetails_wr_dt_line_2 a">
                        <p class="inc_q"> 5) UdanChoo online Review achieved or decided not needed ? </p>
                        <p class="inc_a" style="text-align:center">${INCENTIVE_OBJ.question6}</p>
                    </div>
                </div>
            </div>

<div class="viewIncentiveDetails_modal_wrapper_data">
    <div class="viewIncentiveDetails_modal_wrapper_data_line">
        <label for="" class="lb">Claimed Amount</label>
        <p>${INCENTIVE_OBJ.claimedAmount}</p>
    </div>
    <div class="viewIncentiveDetails_modal_wrapper_data_line">
        <label for="" class="lb">Approved Amount</label>
        <p>${INCENTIVE_OBJ.approvedAmount}</p>
    </div>
    <div class="viewIncentiveDetails_modal_wrapper_data_line">
        <label for="" class="lb">User Remarks</label>
        <p>${INCENTIVE_OBJ.userRemarks}</p>
    </div>
    <div class="viewIncentiveDetails_modal_wrapper_data_line">
        <label for="" class="lb">Claim Status</label>
        <p>${INCENTIVE_OBJ.status}</p>
    </div>
    <div class="viewIncentiveDetails_modal_wrapper_data_line">
    </div>
</div>
<div class="viewIncentiveDetails_modal_wrapper_data">
    <div class="viewIncentiveDetails_modal_wrapper_data_line">
        <label for="" class="lb">Managment Remarks</label>
        <p>${INCENTIVE_OBJ.managementRemarks}</p>
    </div>
</div>

      
    
  


    <div id="myModal" class="modal">
    
        <!-- Modal content -->
        <div class="modal-content" style="margin-top:20px;z-index:9 ">
            <div class="modal-header">
                <span class="close">&times;</span>
                <br>
                <h2 style="text-align:center;">View Deal Details</h2>
            </div>
            <div class="modal-body" style="padding:0px">
    
    
            </div>
            <div class="modal-footer">
                <h3>Powered by @TravelIntelliJ </h3>
            </div>
        </div>
    
    </div>
</body>

</html>