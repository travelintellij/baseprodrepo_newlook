<!DOCTYPE html>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
   	 	
    	<h1 align="center"><font color="blue">Incentive Claim ID is ${INCENTIVE_OBJ.incentiveId}</font></h1>
    	<hr>
		<table>
	        <tr><th>Requested By</th><td>${INCENTIVE_OBJ.claimantName} <input type="hidden" name="userId" value="${userId}" /><input type="hidden" name="userName" value="${userName}" /></td></tr>
	        <tr>
	        	<th>Deal Confirmation ID </th>
	        	<td>${INCENTIVE_OBJ.dealConfirmationId}
				 
				
	        	</td>
	        </tr>
	        <tr><th>Guest Name</th><td>${DEAL_OBJ.clientName}&nbsp;</td></tr>
	    </table>
	    <div id="myModal" class="modal">
						
						  <!-- Modal content -->
						  <div class="modal-content">
						    <div class="modal-header">
						      <span class="close">&times;</span>
						      <br><h2 style="text-align:center;">View Deal Details</h2>
						    </div>
						    <div class="modal-body">
						
						
						    </div>
						    <div class="modal-footer">
						      <h3>Powered by @TravelIntelliJ</h3>
						    </div>
						  </div>
						
						</div>
	
       	 <table>
	        <tr><th style="width:5%;">1</th><th style="width:70%; padding: 5px;text-align:left;">Client is Referred by You ?</th> <td>${INCENTIVE_OBJ.question1}</td></tr>     
	        <tr><th style="width:5%;">2</th><th style="width:70%; padding: 5px;text-align:left;">You took minimal support of management and were able to handle the query alone ? </th> <td>${INCENTIVE_OBJ.question2}</td></tr>
	        <tr><th style="width:5%;">3</th><th style="width:70%; padding: 5px;text-align:left;">You responded all queries of client yourself ontime without any delay ?  </th> <td>${INCENTIVE_OBJ.question3} </td></tr>
	        <tr><th style="width:5%;">4</th><th style="width:70%; padding: 5px;text-align:left;">You ensured and verified with management time to time for payment settlement ?  </th> <td>${INCENTIVE_OBJ.question4}</td></tr>
	        <tr><th style="width:5%;">5</th><th style="width:70%; padding: 5px;text-align:left;">You ensured the vouchers were sent on time and reminder call before travel is made to the client.  </th> <td>${INCENTIVE_OBJ.question5}</td></tr>
	         <tr><th style="width:5%;">6</th><th style="width:70%; padding: 5px;text-align:left;">UdanChoo online Review achieved or decided not needed ? </th> <td>${INCENTIVE_OBJ.question6}</td></tr>
	     </table>
	     <table>
	    	<tr><td width="50%"><font color="red"><b>Claimed Amount </b></font></td><td>${INCENTIVE_OBJ.claimedAmount}</td></tr>
	    	<tr><td width="50%"><font color="green"><b>Approved Amount </b></font></td><td>${INCENTIVE_OBJ.approvedAmount}</td></tr>
	    	<tr><td width="50%"><font color="red"><b>User Remarks </b></font></td><td>${INCENTIVE_OBJ.userRemarks}</td></tr>
	    	 <tr><td width="50%"><font color="red"><b>Management Remarks </b></font></td><td>${INCENTIVE_OBJ.managementRemarks}</td></tr>
	    	<tr><td><b>Claim Status</b></td><td><mark>${INCENTIVE_OBJ.status}</mark></td></tr>
	     </table>
	     
	     


