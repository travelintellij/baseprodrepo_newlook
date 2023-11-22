<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>


<jsp:include page="../../menu/MenuBuilder.jsp" />

<style>
/* The Modal (background) */
	.modal {
	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 1; /* Sit on top */
	  padding-top: 50px; /* Location of the box */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 90%; /* Full height */
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
	  width: 90%;
	  height: 90%;
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
	  background-color: lightblue;
	  color: white;
	}
	
	.modal-body {padding: 2px 16px;}
	
	.modal-footer {
	  padding: 2px 16px;
	  background-color: lightblue;
	  color: white;
	}
	
table {
  width: 100%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
}

th {
  background: #D33F14;
  height: 40px;
  width: 10%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
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

input[type=button], input[type=submit], input[type=reset] {
  background-color: #4CAF50;
  border: none;
  color: black;
  padding: 10px 20px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}

</style>

	<center>
		<h2><br>Status Management</h2>
	</center>
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
	<form:form modelAttribute="TI_STATUS" action="manage_object_status" id="statusform">
			<form:hidden path = "workloadStatusObj" id="workloadStatusObj" />
			<form:hidden path = "workloadStatusObjType" id="workloadStatusObjType" />
			<form:hidden path = "workloadStatusShortName" id="workloadStatusShortName" />
			<form:hidden path = "id" id="id" />
			<table style="width: 90%;table-layout: fixed; ">
			<tr>
				<th style="width:20%;">Status Type</th>
				<th style="width:70%;">Status Values</th>
				<th style="width:10%;">Action</th>
			</tr>
			<c:forEach var="statusOf" items="${STATUS_LIST_OF_MAP.keySet()}" varStatus="status">
            <tr>
            	<th style="background-color:grey;width:20%;">${status.count} : ${statusOf}</th>
	            <td style="width:60%;">
	            	<table id="dataTable${statusOf}" style="table-layout: fixed;">
	            	<tr>
		            	<th style="width:20%;">Status Id</th>
		            	<th style="width:20%;">Status Object</th>
		            	<th style="width:30%;">Status Name</th>
		            	<th colspan="2" style="width:30%;">Status Action</th>
	            	</tr>
	            	<c:forEach var="statusValues" items="${ STATUS_LIST_OF_MAP.get(statusOf)}">

	            	<tr>
	            		<td style="width:20%;">${statusValues.workloadStatusId }</td>
	            		<td style="width:20%;">${statusValues.workloadStatusObj }</td>
	            		
	            		<c:choose>
	            		<c:when test="${ST_ACTION eq 'EDIT' &&  TI_STATUS.id eq statusValues.id}">
	            			<td id="updatestatus" style="width:30%;"><input name="workloadStatusName" style="width: 450px;height:40px;" maxlength="45" type="text" id="workloadStatusName"  value="${statusValues.workloadStatusName }" /> </td>
	            			<td style="width:15%;"><input type="submit" name="UPDATE_UPDATE_STATUS" value="Submit" onclick="toggleStatus('${statusValues.id}')" style="background-color: blue;color: white;"/></td>
	            		</c:when>
	            		<c:otherwise>
	            			<td style="width:30%;">${statusValues.workloadStatusName }</td>
	            			<td style="width:15%;"><input type="submit" name="Edit Status" value="Edit" onclick="toggleStatus('${statusValues.id}')" style="background-color: green;color: white;"/></td>
	            		</c:otherwise>
	            		</c:choose>
	            		
	            		
	            		
	            		<c:if test="${statusValues.active eq true}">
	            			<td style="width:15%;"><input type="submit" id="De-Activate Status" name="De-Activate Status" value="De-Activate Status" onclick="toggleStatus('${statusValues.id}')"  style="background-color: red;"/></td>
	            		</c:if>
	            		<c:if test="${statusValues.active eq false}">
	            			<td style="width:15%;"><input type="submit" value="Activate Status" name="Activate Status" onclick="toggleStatus('${statusValues.id}')" style="background-color: green;color:white;"/></td>
	            		</c:if>
	            		
	            		
	            		
	            	
	            	
	            	</tr>
	            		<c:set var = "workloadStatusObj" scope = "session" value = "${statusValues.workloadStatusObj }"/>
	            		<c:set var = "workloadStatusType" scope = "session" value = "${statusValues.workloadStatusObjType }"/>
	            	</c:forEach>
	            	</table>
	            </td>
				<td style="width:20%;"><input type="button" id="addnewstatus" style="color:white;" value="Add New Status" onclick="addRow('dataTable${statusOf}','${workloadStatusObj}',${ STATUS_LIST_OF_MAP.get(statusOf).size()},'${ workloadStatusType}')" /></td>
            </tr>
	        </c:forEach>
			</table>
			
			</form:form>
 
 <SCRIPT>
 
 function toggleStatus(id) {
	 document.getElementById("id").value = id;
 }

 function addRow(tableID,WL_ST_OBJ,orgRowCount,WL_TYPE) {
	 	var table = document.getElementById(tableID);
		var rowCount = table.rows.length;
		var minLength = 5;
		if(rowCount-orgRowCount==1){
			var form = document.getElementById("statusform");
			var row = table.insertRow(rowCount);
			var cell1 = row.insertCell(0);
			cell1.innerHTML = "Auto Generated";
			var cell2 = row.insertCell(1);
			cell2.innerHTML = WL_ST_OBJ;
	
			var cell3 = row.insertCell(2);
			var element2 = document.createElement("input");
			element2.type = "text";
			element2.name = "workloadStatusName";
			element2.minLength=5;
			element2.maxLength=45;
			cell3.appendChild(element2);

			var cell4 = row.insertCell(3);
			var submitButton = document.createElement("input");
			submitButton.type = "submit";
			submitButton.name = "Add Status";
			submitButton.value = "Add Status";
			submitButton.style.color="white";
			cell4.appendChild(submitButton);

			var cell5 = row.insertCell(4);
			var cancelButton = document.createElement("input");
			cancelButton.type = "button";
			cancelButton.name = "statusCancel";
			cancelButton.value = "Cancel";
			cancelButton.style.background="blue";
			cancelButton.style.color="white";
			cell5.appendChild(cancelButton);

			document.getElementById("workloadStatusObj").value = WL_ST_OBJ;
			document.getElementById("workloadStatusObjType").value = WL_TYPE;

			 submitButton.addEventListener("click", function() {
			      if (element2.value.length >= minLength) {
				      form.submit();
			      } else {
			        alert("The length of the input must be at least " + minLength + " characters.");
			      }
			    });

			 cancelButton.addEventListener("click", function() {
				 table.deleteRow(rowCount);
			    });
			
		}
		

	}


 $(document).ready(function () {
	    // Handler for .ready() called.
	    var ut = document.getElementById('updatestatus'); 
	    if (ut != null) { 
	    	$('html, body').animate({
	            scrollTop: $('#updatestatus').offset().top
	        }, 'slow');
	    }
	    
	});

 /*
	function addRow(tableID,WL_ST_OBJ) {
			var table = document.getElementById(tableID);
			
			var rowCount = table.rows.length;
			var row = table.insertRow(rowCount);

			var cell1 = row.insertCell(0);
			cell1.innerHTML = "Auto Generated";
			var cell2 = row.insertCell(1);
			cell2.innerHTML = WL_ST_OBJ;

			var cell3 = row.insertCell(2);
			var element2 = document.createElement("input");
			element2.type = "text";
			element2.name = "txtbox[]";
			cell3.appendChild(element2);
			

		}

		function deleteRow(tableID) {
			try {
			var table = document.getElementById(tableID);
			var rowCount = table.rows.length;

			for(var i=0; i<rowCount; i++) {
				var row = table.rows[i];
				var chkbox = row.cells[0].childNodes[0];
				if(null != chkbox && true == chkbox.checked) {
					table.deleteRow(i);
					rowCount--;
					i--;
				}


			}
			}catch(e) {
				alert(e);
			}
		}
		*/

	</SCRIPT>
 </body>
 
  
  </html>
  