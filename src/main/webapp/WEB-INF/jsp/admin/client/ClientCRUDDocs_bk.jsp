<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>


<jsp:include page="../../menu/MenuBuilder.jsp" />

<style>
table {
  width: 100%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
  
}

th {
  background: #FFD700;
  height: 40px;
  width: 10%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: black;
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
  color: white;
  padding: 10px 20px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}

</style>

	<center>
		<h2><br>Client Documents</h2>
	</center>
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<form:form modelAttribute="CLIENT_OBJ" action="search_search_filtered_clients">
			
			<table style="width: 90%; ">
			<tr >
				<th style="width:12%;height:30px;background-color:orange;color:black;">
					Client Id
				</th>
				<th style="width:20%;height:30px;background-color:orange;color:black;">
					Client Name
				</th>
				<th style="width:12%;height:30px;background-color:orange;color:black;">
					City Name
				</th>
				<th style="width:10%;height:30px;background-color:orange;color:black;">
					Contact Number
				</th>
				<th style="width:15%;height:30px;background-color:orange;color:black;">
					Email
				</th>
				<th style="width:10%;height:30px;background-color:orange;color:black;">
					Active
				</th>
			</tr>

			<tr >
				<td style="width:10%;height:30px">
					${CLIENT_OBJ.clientId }
				</td>
				<td style="width:20%;height:30px">
					${CLIENT_OBJ.clientName }
				</td>
				<td style="width:12%;height:30px">
					${CLIENT_OBJ.cityName }
				</td>
				<td style="width:10%;height:30px">
					${CLIENT_OBJ.mobile }
				</td>
				<td style="width:15%;height:30px">
					${CLIENT_OBJ.email }
				</td>
				<td style="width:10%;height:30px">
					${CLIENT_OBJ.active }
					
				</td>
			</tr>
		</table>
				
	</form:form>
	
	<table style="width:50%;">
			<tr>
				<th>S. No.</th>
				<th>Document Name</th>
				<th colspan="2">Action</th>
			</tr>
			<c:set var="docCount" value="1" scope="page" />
			<c:forEach var="file" items="${DOCS_SET}">
			 <tr>
				<td><c:out value = "${docCount}"/>.</td>
				<td>${file.name}</td>
				<td>
					<form:form name="download_client_docForm" id="download_client_doc" action="download_client_doc" style="display:inline;">
         				<input type="hidden" name="clientId" value="${CLIENT_OBJ.clientId}"/>
         				<input type="hidden" name="fileName" value="${file}"/>
     					<input type="submit" name="Download" Value="Download" style="color: white;background-color: Green; padding: 6px 12px;" />
        			</form:form>

				</td>
				<td>
					
          			<form:form name="delete_client_docForm" id="delete_client_docForm" action="delete_client_doc" style="display:inline;">
         				<input type="hidden" name="clientId" value="${CLIENT_OBJ.clientId}"/>
         				<input type="hidden" name="fileName" value="${file}"/>
          				<input type="submit" name="Delete" Value="Delete" style="color: white;background-color: red; padding: 6px 12px;" />
          			</form:form>
				
				</td>
			</tr>
			<c:set var="docCount" value="${docCount + 1}" scope="page"/>
			</c:forEach>
		</table>
		<br>
		<table style="width:30%;">
			<tr>
			
			
			 <td colspan="3">
			 	<form:form name="singleUploadForm" id="singleUploadForm" action="upload_client_docs" enctype="multipart/form-data" >
                 	<input type="hidden" name="clientId" value="${CLIENT_OBJ.clientId }"/>
                 	<input id="singleFileUploadInput" type="file" name="file" class="file-input" required />
                    <button type="submit" class="primary submit-btn">Upload</button>
                 </form:form>
               </td>
              </tr>
		</table>
 			
 </body>
  
  </html>
  