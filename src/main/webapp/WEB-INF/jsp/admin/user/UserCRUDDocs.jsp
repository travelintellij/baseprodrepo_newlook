<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <jsp:include page="../../menu/MenuBuilder.jsp" />

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>UserCRUDDocs</title>
                    <script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
                    <script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
                </head>
                <style>
                
        body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/crud_girl.jpg);
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
                    <form:form modelAttribute="userobj" action="search_search_filtered_clients">
                        <table class="UserCRUDDocs_tabel bs">
                            <thead  style="background:#6082B6;height:50px">
                                <tr>
                                    <th>User ID</th>
                                    <th>User Name</th>
                                    <th>User Mobile</th>
                                    <th>User Email</th>
                                    <th>Designation</th>
                                    <th>Active</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${userobj.userId }</td>
                                    <td>${userobj.username }</td>
                                    <td>${userobj.mobile }</td>
                                    <td>${userobj.email }</td>
                                    <td>${userobj.designation }</td>
                                    <td>${userobj.active }</td>
                                </tr>
                                <!-- Add more rows as needed -->
                            </tbody>
                        </table>
                    </form:form>
                    <!-- ############### 2nd table ############ -->
                    <table class="UserCRUDDocs_tabel2 bs">
                        <tr  style="background:#6082B6;height:50px">
                            <th>S. No.</th>
                            <th>Document Name</th>
                            <th colspan="2">Action</th>
                        </tr>
                        <c:set var="docCount" value="1" scope="page" />
                        <c:forEach var="file" items="${DOCS_SET}">
                    
                            <tr>
                                <td>
                                    <c:out value="${docCount}" />
                                </td>
                                <td>${file.name}</td>
                                <td width="100px">
                                    <form:form name="download_user_docForm" id="download_user_doc"
                                        action="download_user_doc" style="display:inline;">
                                        <input type="hidden" name="userId" value="${userobj.userId}" />
                                        <input type="hidden" name="fileName" value="${file}" />
                                        <input type="submit" name="Download" Value="Download"
                                            style="color: black;background-color:#32cd32 ; padding: 2px 12px;border:none;outline:none;border-radius:5px;margin-top:10px;cursor:pointer" />
                                    </form:form>

                                </td>
                                <td  width="100px">

                                    <form:form name="delete_user_docForm" id="delete_user_doc" action="delete_user_doc"
                                        style="display:inline;">
                                        <input type="hidden" name="userId" value="${userobj.userId}" />
                                        <input type="hidden" name="fileName" value="${file}" />
                                        <input type="submit" name="Delete" Value="Delete"
                                           style="cursor:pointer;color: black;background-color:red ; padding: 2px 12px;border:none;outline:none;border-radius:5px;margin-top:10px" />
                                    </form:form>

                                </td>
                            </tr>
                            <c:set var="docCount" value="${docCount + 1}" scope="page" />
                        
                        </c:forEach>
                    </table>
                    <!-- ############### 2nd table ############ -->

                    <table class="UserCRUDDocs_tabel3 bs">
                        <tr>


                            <td colspan="3">
                                <form:form name="singleUploadForm" id="singleUploadForm" action="upload_user_docs"
                                    enctype="multipart/form-data">
                                    <input type="hidden" name="userId" value="${userobj.userId }" />
                                    <input id="singleFileUploadInput" type="file" name="file" class="file-input"
                                        required />
                                    <button type="submit" class="primary submit-btn">Upload</button>
                                </form:form>
                            </td>
                        </tr>
                    </table>

                </body>

</html>