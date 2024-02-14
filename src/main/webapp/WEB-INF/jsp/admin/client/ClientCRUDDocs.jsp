<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Document</title>
                    <link rel="stylesheet" href="style.css">
                    <script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
                    <script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>
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
                    <div class="ClientCRUDDocs container">
                        <div align="center"><b>
                                <font color="green"> ${Success} </font>
                                <font color="red"> ${Error}</font>
                            </b></div>
                        <div class="ClientCRUDDocs_wrapper bs">
                            <h1 class="hd">Client Documents</h1>
                            <div class="ClientCRUDDocs_wrapper_data">
                                <form:form modelAttribute="CLIENT_OBJ" action="search_search_filtered_clients">
                                    <table style="width:100%;text-align: center;">
                                        <thead class="bc-clr" style="height:50px;color:black">
                                            <tr>
                                                <th>Client ID</th>
                                                <th>Client Name</th>
                                                <th>City Name</th>
                                                <th>Contact Number</th>
                                                <th>Email</th>
                                                <th>Active</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>${CLIENT_OBJ.clientId }</td>
                                                <td>${CLIENT_OBJ.clientName }</td>
                                                <td>${CLIENT_OBJ.cityName }</td>
                                                <td>${CLIENT_OBJ.mobile }</td>
                                                <td>${CLIENT_OBJ.email }</td>
                                                <td>${CLIENT_OBJ.active }</td>
                                            </tr>
                                            <!-- Add more rows as needed -->
                                        </tbody>
                                    </table>
                                </form:form>
                            </div>
                        </div>
                <table class="cli_crud bs" style="width:60%;text-align: center;margin: 10px auto;">  
                <thead style="background: #6082B6;color:black;height:50px;color:black;margin-bottom:10px">
                <tr>
				<th>S. No.</th>
				<th colspan="1">Document Name</th>
				<th colspan="2" style="width:30px;text-align:center">Action</th>
			     </tr>
			     </thead>
			     <tbody style="background:white;color:black">
			<c:set var="docCount" value="1" scope="page" />
			<c:forEach var="file" items="${DOCS_SET}">
			 <tr style="padding:10px">
				<td><c:out value = "${docCount}"/>.</td>
				<td>${file.name}</td>
				<td>
					<form:form name="download_client_docForm" id="download_client_doc" action="download_client_doc" style="display:inline;">
         				<input type="hidden" name="clientId" value="${CLIENT_OBJ.clientId}"/>
         				<input type="hidden" name="fileName" value="${file}"/>
     					<input type="submit" name="Download" Value="Download" style="color: white;background-color: #32cd32; padding: 6px 12px; border:none;outline:none;border-radius:5px;margin-right:-70px;margin-top:5px;cursor:pointer" />
        			</form:form>
				</td>
				<td>				
          			<form:form name="delete_client_docForm" id="delete_client_docForm" action="delete_client_doc" style="display:inline;">
         				<input type="hidden" name="clientId" value="${CLIENT_OBJ.clientId}"/>
         				<input type="hidden" name="fileName" value="${file}"/>
          				<input type="submit" name="Delete" Value="Delete" style="color: white;background-color: red; padding: 6px 12px; border:none;outline:none;border-radius:5px;margin-top:5px;cursor:pointer" />
          			</form:form>	
				</td>
			</tr>
			<c:set var="docCount" value="${docCount + 1}" scope="page"/>
			</c:forEach>
			</tbody>
                        </table>
                        
                        <div style="margin:10px auto;width:600px;">
                        <table class="bs" style="    margin: 29px auto;
    width: 359px;">
                            <tr>
                                <td colspan="3">
                                    <form:form name="singleUploadForm" id="singleUploadForm" action="upload_client_docs"
                                        enctype="multipart/form-data">
                                        <input type="hidden" name="clientId" value="${CLIENT_OBJ.clientId }" />
                                        <input id="singleFileUploadInput" type="file" name="file" class="file-input"
                                            required  />
                                           
                                             <button type="submit" class="primary submit-btn" style="cursor:pointer;color: white;background-color: #32cd32; padding: 6px 12px; border:none;outline:none;border-radius:5px;margin-top:10px;margin-left: 138px;">Upload</button>

                                    </form:form>
                                </td>
                            </tr>
                        </table>
                        </div>
                    </div>
                </body>

</html>