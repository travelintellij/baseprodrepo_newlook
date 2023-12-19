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
		<h2><br>User Documents (Know Your Employee)</h2>
	</center>
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
	<form:form modelAttribute="userobj" action="search_search_filtered_clients">
			
			<table style="width: 90%; ">
			<tr >
				<th style="width:12%;height:30px;background-color:orange;color:black;">
					User Id
				</th>
				<th style="width:20%;height:30px;background-color:orange;color:black;">
					User Name
				</th>
				<th style="width:12%;height:30px;background-color:orange;color:black;">
					User Mobile
				</th>
				<th style="width:10%;height:30px;background-color:orange;color:black;">
					User Email
				</th>
				<th style="width:15%;height:30px;background-color:orange;color:black;">
					Designation
				</th>
				<th style="width:10%;height:30px;background-color:orange;color:black;">
					Active 
				</th>
			</tr>

			<tr >
				<td style="width:10%;height:30px">
					${userobj.userId }
				</td>
				<td style="width:20%;height:30px">
					${userobj.username }
				</td>
				<td style="width:12%;height:30px">
					${userobj.mobile }
				</td>
				<td style="width:10%;height:30px">
					${userobj.email }
				</td>
				<td style="width:15%;height:30px">
					${userobj.designation }
				</td>
				<td style="width:10%;height:30px">
					${userobj.active }
					
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
					<form:form name="download_user_docForm" id="download_user_doc" action="download_user_doc" style="display:inline;">
         				<input type="hidden" name="userId" value="${userobj.userId}"/>
         				<input type="hidden" name="fileName" value="${file}"/>
     					<input type="submit" name="Download" Value="Download" style="color: white;background-color: Green; padding: 6px 12px;" />
        			</form:form>

				</td>
				<td>
					
          			<form:form name="delete_user_docForm" id="delete_user_doc" action="delete_user_doc" style="display:inline;">
         				<input type="hidden" name="userId" value="${userobj.userId}"/>
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
			 	<form:form name="singleUploadForm" id="singleUploadForm" action="upload_user_docs" enctype="multipart/form-data" >
                 	<input type="hidden" name="userId" value="${userobj.userId }"/>
                 	<input id="singleFileUploadInput" type="file" name="file" class="file-input" required />
                    <button type="submit" class="primary submit-btn">Upload</button>
                 </form:form>
               </td>
              </tr>
		</table>
 			
 </body>
  
  </html>
  