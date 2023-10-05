<html>
<style>

table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
table {
  width: 100%;
  height: 30px;
  //border-collapse: collapse;
  //border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
}

th {
  background: #7B68EE;
  height: 20px;
  width: 10%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  //border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
}
tr {
  border-bottom: 1px solid #cccccc;
}

td {
  //border-right: 1px solid #cccccc;
  padding: 5px;
  transition: all 0.2s;
  text-align: center;
}

.heavyTable {
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
  animation: float 5s infinite;
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

</style>
 <body>
 <br>
	<img  style="display: block;margin-left:auto;margin-right: auto;" src="https://mcusercontent.com/12723dec99da43593af717ad4/images/a320187a-30ab-4f38-b836-beae49fc80f9.jpg" width="200" height="50px;" >
	<h2 align="center"> Email Visa Docs </h2>
				
				
				<#list VISA_DOCT_LIST as system>
					<table style="border:1;width:100%;">			
					<tr>
						<th style="background-color:#7B68EE;">Country</th>
						<th style="background-color:#7B68EE;">Profile</th>
						<th style="background-color:#7B68EE;">Purpose</th>
						<th style="background-color:#7B68EE;">Visa Type</th>
						
					</tr>
					<tr>					
						<td>${COUNTRY_NAME}</td>
						<td style="background-color:yellow;"><mark><#if system.profileString??> ${system.profileString} </#if></mark></td>
						<td><#if system.visaPurpose??> ${system.visaPurposeString} </#if> </td>
						<td><#if system.visaTypeString??> ${system.visaTypeString} </#if> </td>
						
					</tr>
					<tr>
					<td colspan="4" style="text-align:center;">
						<table style="border:1;width:80%;">
							<tr>
							<th style="background-color:green;">Document Id </th><th style="background-color:green;">Document Name </th><th style="background-color:green;">Details</th>
							</tr>
							<#list system.visaDocumentEntityList as document>
								<tr>
									<td>${document.visaDocId} </td><td>${document.documentTitle} </td><td>${document.description}</td>
								</tr>
						   </#list>
						</table>
					</td>
					</tr>
					</table><br>
					
					Visa Pricing Information (Per Person): <br>
					
					<#if VISA_INFO_MAILER.visaCostToIncludeList == "b2ccost">
							Price : ${system.standardB2cPrice} <br>
						<#elseif VISA_INFO_MAILER.visaCostToIncludeList == "b2bcost">
							B2B Price: ${system.standardB2bPrice} <BR>
						<#elseif VISA_INFO_MAILER.visaCostToIncludeList == "bothcosts">
							B2B Price: ${system.standardB2bPrice} <br>
							B2C Price: ${system.standardB2cPrice} <br>
					</#if>
					<br>
					<#if system.otherCosts??>
						<p style="white-space: pre;"><#compress>${system.otherCosts}</#compress></p>
					</#if>
					
					<hr>
					<hr>
					<br><br>
			</#list>
			<br>
			<i>
			//Pricing is subject to change if not updated. <br>
			// Document pickup and editing charges seperate. 
			</i>
			
		
		
  
    </body>
    
</html>


