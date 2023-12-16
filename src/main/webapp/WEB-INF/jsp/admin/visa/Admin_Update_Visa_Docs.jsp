<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
    <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
</head>
<body>
    <div align="center"><b>
            <font color="green"> ${Success} </font>
            <font color="red"> ${Error}</font>
        </b></div>
    
    <table border="1 px;" style="width:80%; border-collapse: collapse;" align="center">
        <c:choose>
            <c:when test="${VISA_MASTER_ACTION eq 'UPDATE'}">
                <form:form method="post" action="edit_edit_visa_master" modelAttribute="VISA_OBJ">
                    <input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
                    <input type="hidden" name="countryName" value="${VISA_OBJ.countryName}" />
                    <input type="hidden" name="countryCode" value="${VISA_OBJ.countryCode}" />
                    <input type="hidden" name="profile" value="${VISA_OBJ.profile}" />
                    <input type="hidden" name="visaType" value="${VISA_OBJ.visaType}" />
                    <input type="hidden" name="visaPurpose" value="${VISA_OBJ.visaPurpose}" />
                    <tr>
                        <td colspan="2">&nbsp;</td>
                        <th colspan="2" style="width:20%;">Country Name</th>
                        <td colspan="2" style="width:20%; padding-bottom: 15px; vertical-align: bottom;">
                            ${VISA_OBJ.countryName}
                        </td>
                        <td colspan="2">&nbsp;</td>
                    </tr>
    
                    <tr>
                        <th style="width:10%;">Consulate City</th>
                        <td style="width:10%; padding-bottom: 5px;">
                            ${VISA_OBJ.cityName}
    
                        </td>
                        <th style="width:10%;">Visa Profile</th>
                        <td style="width:10%;">
                            ${VISA_PROFILE.get(VISA_OBJ.profile)}
                        </td>
                        <th style="width:10%;">Visa Type</th>
                        <td style="width:10%;">${VISA_TYPE.get(VISA_OBJ.visaType)}
    
                        </td>
                        <th style="width:10%;">Visa Purpose</th>
                        <td style="width:10%;">${VISA_PURPOSE.get(VISA_OBJ.visaPurpose)}</td>
    
    
                    </tr>
                    <tr>
                        <th style="width:10%;">Standard Cost</th>
                        <td style="width:10%; padding-bottom: 5px;">
                            <input style="width:100px;" type="text" name="standardCost" value="${VISA_OBJ.standardCost}" />
                        </td>
                        <th style="width:10%;">B2B Price</th>
                        <td style="width:10%; padding-bottom: 5px;">
                            <input style="width:100px;" type="text" name="standardB2bPrice"
                                value="${VISA_OBJ.standardB2bPrice}" />
                        </td>
                        <th style="width:10%;">B2C Price</th>
                        <td style="width:10%; padding-bottom: 5px;">
                            <input style="width:100px;" type="text" name="standardB2cPrice"
                                value="${VISA_OBJ.standardB2cPrice}" />
                        </td>
                        <th style="width:10%;">Processing Time</th>
                        <td style="width: 10%; padding-bottom: 5px;">
                            <input style="width:50px;" type="text" name="processingTime"
                                value="${VISA_OBJ.processingTime}" /> Days
                        </td>
    
                    </tr>
    
                    <tr>
                        <th style="width:10%;" colspan="4">Internal Remarks (Will never be shared with clients)</th>
                        <th style="width:10%;" colspan="4">Other Costs (Like extended validity visa options)</th>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align:center;">
                            <textarea style="width: 500px; height: 100px;border: 2px solid green; border-radius: 4px;"
                                rows="3" cols="1500" name="internalRemarks" htmlEscape="false"
                                maxlength="1040">${VISA_OBJ.internalRemarks}</textarea>
                        </td>
    
                        <td colspan="4">
                            <textarea style="width: 500px; height: 100px;border: 2px solid green; border-radius: 4px;"
                                rows="3" cols="1500" name="otherCosts" htmlEscape="false">${VISA_OBJ.otherCosts}</textarea>
                        </td>
                    </tr>
    
                    <tr>
                        <th style="width:10%;" colspan="8">Remarks</th>
                    </tr>
                    <tr>
                        <td colspan="8">
                            <textarea style="width: 1000px; height: 200px;border: 2px solid green; border-radius: 4px;"
                                rows="3" cols="1500" name="remarks" htmlEscape="false">${VISA_OBJ.remarks}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="border: 0px; text-align: right;">
                            <input type="submit" name="submit" value="Update" />
                        </td>
    
                </form:form>
                <form:form method="post" action="view_list_visa_proceed_docs_form" modelAttribute="VISA_OBJ">
                    <input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
                    <td colspan="4" style="border: 0px; text-align: left;">
                        <input type="submit" name="submit" value="Cancel" style="background-color: blue;" />
                    </td>
                </form:form>
    
                </tr>
            </c:when>
            <c:otherwise>
                <div class="Admin_Update_Visa_Docs container">
            <div class="Admin_Update_Visa_Docs_wrapper">
                <h1>Country Name <span>${VISA_OBJ.countryName}</span></h1>
                <div class="Admin_Update_Visa_Docs_wrapper_data">
                    <div class="Admin_Update_Visa_Docs_wrapper_data_line">
                        <div class="Admin_Update_Visa_Docs_wrapper_data_l1">
                            <label for="" class="lb">Consulate City</label>
                            <p>${VISA_OBJ.cityName}</p>
                            <input type="hidden" name="countryCode" id="countryCode" />
                        </div>
                        <div class="Admin_Update_Visa_Docs_wrapper_data_l1">
                            <label for="" class="lb">Visa Profile</label>
                            <p>${VISA_PROFILE.get(VISA_OBJ.profile)}</p>
                        </div>
                        <div class="Admin_Update_Visa_Docs_wrapper_data_l1">
                            <label for="" class="lb">Visa Type</label>
                            <p>${VISA_TYPE.get(VISA_OBJ.visaType)}</p>
                        </div>
                        <div class="Admin_Update_Visa_Docs_wrapper_data_l1">
                            <label for="" class="lb">Visa Purpose</label>
                            <p>${VISA_PURPOSE.get(VISA_OBJ.visaPurpose)}</p>
                        </div>
                    </div>
                    <div class="Admin_Update_Visa_Docs_wrapper_data_line">
                        <div class="Admin_Update_Visa_Docs_wrapper_data_l1">
                            <label for="" class="lb">Standrad Cost</label>
                            <p>${VISA_OBJ.standardCost}</p>
                        </div>
                        <div class="Admin_Update_Visa_Docs_wrapper_data_l1">
                            <label for="" class="lb">B2B Price</label>
                            <p>${VISA_OBJ.standardB2bPrice}</p>
                        </div>
                        <div class="Admin_Update_Visa_Docs_wrapper_data_l1">
                            <label for="" class="lb">B2C Price</label>
                            <p>${VISA_OBJ.standardB2cPrice}</p>
                        </div>
                        <div class="Admin_Update_Visa_Docs_wrapper_data_l1">
                            <label for="" class="lb">Processing Time</label>
                            <p>${VISA_OBJ.processingTime} Days</p>
                        </div>
                    </div>
                    <div class="Admin_Update_Visa_Docs_wrapper_data_line">
                        <div class="Admin_Update_Visa_Docs_wrapper_data_l1_rem">
                            <label for="" class="lb">Internal Remarks (will never be shared with the clients)</label>
                            <p>${VISA_OBJ.internalRemarks}</p>
                        </div>
                        <div class="Admin_Update_Visa_Docs_wrapper_data_l1_rem">
                            <label for="" class="lb">Other Costs (like extended validity visa options)</label>
                            <p>${VISA_OBJ.otherCosts}</p>
                        </div>
                    </div>
                    <div class="Admin_Update_Visa_Docs_wrapper_data_line">
                        <div class="Admin_Update_Visa_Docs_wrapper_data_l1_rems">
                            <label for="" class="lb">Remarks</label>
                            <p>${VISA_OBJ.remarks}</p>
                        </div>
                    </div>
                    <div class="due_today_task_data_btns">
                        <a href="">Edit</a>
                        <a href="">Cancel</a>
                    </div>
                </div>
            </div>
        </div>
            </c:otherwise>
        </c:choose>
    </table>
    
    
    <c:if test="${VISA_MASTER_ACTION ne 'UPDATE'}">
        <table style="width:80%; border-collapse: collapse;" align="center">
            <form:form modelAttribute="VISA_OBJ" action="view_update_visa_master_form" style="display:inline;">
                <input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
                <tr>
                    <td colspan="8" style="text-align:center;">
                        <sec:authorize access="hasAnyRole('ADMIN','VISA_EDIT')">
                            <input type="submit" name="submit" value="Edit" />
                        </sec:authorize>
                        <sec:authorize access="! hasAnyRole('ADMIN','VISA_EDIT')">
                            <input type="button" name="submit" value="Edit" style="background-color: #dddddd;" diabled />
                        </sec:authorize>
                        <a href="search_search_visa_master?countryCode=${VISA_OBJ.countryCode} "><input type="button"
                                style="background-color: blue;" value="Cancel" /></a>
    
                    </td>
                </tr>
            </form:form>
        </table>
    </c:if>
    
    <br><br>
    <h2 align="center">Visa Documents</h2>
    <table border="1 px;" style="width:75%; border-collapse: collapse;" align="center">
        <tr>
            <th style="width:15%;">Document Id</th>
            <th style="width:25%;">Document Title</th>
            <th style="width:40%;">Document Description</th>
            <th style="width:20%;">Action</th>
        </tr>
        <c:forEach var="visaDocObj" items="${VISA_DOC_LIST}">
            <c:choose>
                <c:when test="${ORG_VISA_DOC_OBJ.visaDocId eq visaDocObj.visaDocId  && VISA_DOC_ACTION eq 'UPDATE' }">
                    <form:form modelAttribute="VISA_DOC_OBJ" action="edit_edit_visa_doc" style="display:inline;">
                        <tr>
                            <td style="width:15%;">${ORG_VISA_DOC_OBJ.visaDocId}</td>
                            <td style="width:25%;"><input style="width:300px;" type="text" id="documentTitle"
                                    name="documentTitle" placeholder="document Title"
                                    value="${ORG_VISA_DOC_OBJ.documentTitle}" required /></td>
                            <td style="width:40%;"><textarea rows="3" cols="30" name="description"
                                    required>${ORG_VISA_DOC_OBJ.description}</textarea> </td>
                            <td style="width:20%;">
                                <table>
                                    <tr>
                                        <td>
                                            <input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
                                            <input type="hidden" name="visaDocId" value="${ORG_VISA_DOC_OBJ.visaDocId}" />
                                            <input type="submit" name="submit" value="Update" style="padding: 6px 12px;" />
                                        </td>
                    </form:form>
                    <td style="cellspacing: 0px;">
                        <form:form modelAttribute="VISA_DOC_OBJ" action="view_list_visa_proceed_docs_form"
                            style="display:inline;">
                            <input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
                            <input type="submit" name="submit" value="Cancel"
                                style="background-color: blue; padding: 6px 12px;" />
                        </form:form>
                    </td>
                    </tr>
    </table>
    </td>
    </tr>
    </c:when>
    <c:otherwise>
        <tr>
            <td style="width:15%;">${visaDocObj.visaDocId}</td>
            <td style="width:25%;">${visaDocObj.documentTitle}</td>
            <td style="width:40%;">${visaDocObj.description}</td>
            <td style="width:20%;">
                <form:form modelAttribute="VISA_DOC_OBJ" action="view_update_visa_doc_form" style="display:inline;">
    
                    <input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
                    <input type="hidden" name="visaDocId" value="${visaDocObj.visaDocId}" />
                    <input type="hidden" name="documentTitle" value="${visaDocObj.documentTitle}" />
                    <input type="hidden" name="description" value="${visaDocObj.description}" />
                    <!-- 
    									<input type="image" src="${pageContext.request.contextPath}/resources/images/edit.jpg" height="20" width="20"/>
    									 -->
                    <sec:authorize access="hasAnyRole('ADMIN','VISA_EDIT')">
                        <input type="submit" style="background-color:blue;padding: 6px 12px;" value="Edit" />
                    </sec:authorize>
                    <sec:authorize access="! hasAnyRole('ADMIN','VISA_EDIT')">
                        <input type="button" style="background-color:#dddddd;padding: 6px 12px;" value="Edit" disabled />
                    </sec:authorize>
                </form:form>
                <form:form modelAttribute="VISA_DOC_OBJ" action="view_delete_visa_doc_form" style="display:inline;">
                    <input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
                    <input type="hidden" name="visaDocId" value="${visaDocObj.visaDocId}" />
                    <!-- 
    									<input type="image" src="${pageContext.request.contextPath}/resources/images/delete.jpg" height="20" width="20"/>
    									 -->
                    <sec:authorize access="hasAnyRole('ADMIN','VISA_DELETE')">
                        <input type="submit" style="background-color:red;padding: 6px 12px;" value="Delete" />
                    </sec:authorize>
                    <sec:authorize access="! hasAnyRole('ADMIN','VISA_DELETE')">
                        <input type="button" style="background-color:#dddddd;padding: 6px 12px;" value="Delete" disabled />
                    </sec:authorize>
    
                </form:form>
            </td>
        </tr>
    </c:otherwise>
    </c:choose>
    </c:forEach>
    <c:if test="${VISA_DOC_ACTION eq 'ADD'}">
        <form:form modelAttribute="VISA_DOC_OBJ" action="add_add_visa_doc" style="display:inline;">
            <tr style="background-color:lightgreen;">
                <td>Auto Generated</td>
                <td><input style="width:300px;" type="text" id="documentTitle" name="documentTitle"
                        placeholder="document Title" required /></td>
                <td><textarea rows="3" cols="30" name="description" required></textarea> </td>
                <td>
                    <table>
                        <tr>
                            <td style="width:50%;">
                                <input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
    
                                <sec:authorize access="hasAnyRole('ADMIN','VISA_ADD')">
                                    <input type="submit" name="submit" value="Add" style="padding: 6px 12px;" />
                                </sec:authorize>
                                <sec:authorize access="! hasAnyRole('ADMIN','VISA_ADD')">
                                    <input type="button" name="submit" value="Add"
                                        style="background-color:#dddddd;padding: 6px 12px;" disabled />
                                </sec:authorize>
                            </td>
        </form:form>
        <td style="width:50%;">
            <form:form modelAttribute="VISA_DOC_OBJ" action="view_list_visa_proceed_docs_form" style="display:inline;">
                <input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
                <input type="submit" name="submit" value="Cancel" style="background-color: blue; padding: 6px 12px;" />
            </form:form>
        </td>
        </tr>
        </table>
        </td>
        </tr>
    
    </c:if>
    </table>
    <c:if test="${VISA_DOC_ACTION ne 'ADD'}">
        <table style="width:70%; border-collapse: collapse;" align="center">
            <form:form modelAttribute="VISA_OBJ" action="view_add_visa_proceed_docs_form" style="display:inline;">
                <!-- <input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" /> -->
                <form:hidden path="visaId" />
                <!-- 
    			<input type="hidden" name="profile" value="${VISA_OBJ.profile}" />
    			<input type="hidden" name="visaType" value="${VISA_OBJ.visaType}" />
    			 -->
                <tr>
                    <td colspan="4">
                        <sec:authorize access="hasAnyRole('ADMIN','VISA_CREATE')">
                            <input type="submit" name="submit" value="Add Document" />
                        </sec:authorize>
                        <sec:authorize access="! hasAnyRole('ADMIN','VISA_CREATE')">
                            <input type="button" name="submit" value="Add Document" style="background-color:#dddddd"
                                disabled />
                        </sec:authorize>
                    </td>
                </tr>
            </form:form>
        </table>
    </c:if>
    
    <script>
        $('#countryName').autocomplete({
            serviceUrl: '${pageContext.request.contextPath}/getCountryList',
            paramName: "countryName",
            delimiter: ",",
            onSelect: function (suggestion) {
                cityID = suggestion.data;
                id = cityID;
                jQuery("#countryCode").val(cityID);
                $('input[name=countryCode]').val(id);
                return false;
            },
            transformResult: function (response) {
                return {
                    suggestions: $.map($.parseJSON(response), function (item) {
                        return { value: item.countryName, data: item.countryCode };
                    })

                };
            }
        });
    </script>
</body>
</html>