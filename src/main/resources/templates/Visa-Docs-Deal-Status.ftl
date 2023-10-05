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
  /*border-right: 1px solid #cccccc;*/
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
	<center><table style="text-align:center; border: none;"><tr><td>	<img  style="display: block;margin-left:auto;margin-right: auto;" src="https://gallery.mailchimp.com/b524536bce55ad238411aa638/images/488c4b5b-8dae-4155-ac97-bd1c4c5349fa.jpg" width="150" height="150px;" ></td></tr></table></center>
	<h2 align="center"> Email Visa Status </h2>
				<#list VISA_STATUS_LIST as system>
					<table style="border:1px;width:100%;">			
					<tr>
						<th style="background-color:#7B68EE;">Country</th>
						<th style="background-color:#7B68EE;">Applicant Name</th>
						<th style="background-color:#7B68EE;">Purpose</th>
						<th style="background-color:#7B68EE;">Visa Type</th>
						<th style="background-color:#7B68EE;">Profile</th>
						<th style="background-color:#7B68EE;">Status</th>
						
					</tr>
					<tr>					
						<td style="text-align:center;">${system.countryName}</td>
						<td style="text-align:center;background-color:yellow;"><mark>${system.applicantName}</mark></td>
						<td style="text-align:center;">${system.visaPurposeString}</td>
						<td style="text-align:center;">${system.visaTypeString}</td>
						<td style="text-align:center;">${system.visaProfileString}</td>
						<td style="text-align:center;">${system.statusName}</td>
					</tr>
					<tr>
					<td colspan="6" style="text-align:center;">
						<table style="border:1px;width:80%;">
							<tr>
							<th style="background-color:green;color:white;">Document Id </th><th style="background-color:green;color:white;">Document Name </th><th style="background-color:green;color:white;">Status</th>
							</tr>
							<#list system.visaDocumentEntityList as document>
								<tr>
									<td style="background-color: #96D4D4;border: 1px solid white;border-collapse: collapse;border-radius: 10px;">${document.vsaDocServiceId} </td><td style="background-color: #96D4D4;border: 1px solid white;border-collapse: collapse;border-radius: 10px;">${document.documentTitle} </td><td style="background-color: #96D4D4;border: 1px solid white;border-collapse: collapse;border-radius: 10px;">${document.statusName}</td>
								</tr>
						   </#list>
						</table>
					</td>
					</tr>
					</table>
					
					<hr>
					<hr>
					<br><br>
			</#list>
			<br>
  
    </body>
    
</html>


