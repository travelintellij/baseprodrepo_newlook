<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
    <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>
<style>

        body::before {
            content: "";
            background-image:   url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);
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

<div class="container" style="margin-top:115px; ">
   
	 
			<table border="1 px;" style="width:100%; border-collapse: collapse;"  align="center">
				<c:choose>

			    <c:when test="${VISA_MASTER_ACTION eq 'UPDATE'}">
        <form:form method="post" action="edit_edit_visa_master" modelAttribute="VISA_OBJ">
            <input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
            <input type="hidden" name="countryName" value="${VISA_OBJ.countryName}" />
            <input type="hidden" name="countryCode" value="${VISA_OBJ.countryCode}" />
            <input type="hidden" name="profile" value="${VISA_OBJ.profile}" />
            <input type="hidden" name="visaType" value="${VISA_OBJ.visaType}" />
            <input type="hidden" name="visaPurpose" value="${VISA_OBJ.visaPurpose}" />
            <div class="admin_visa_update_fr container">
                <div class="admin_visa_update_fr_wrapper">
                    <h1 style="font-size: 25px;margin:15px 0;text-align: center;">Country Name: <span style="font-size: 25px;color:#32cd32  ">
                            ${VISA_OBJ.countryName}</span> </h1>
                    <div class="admin_visa_update_fr_wrapper_data">
                        <div class="admin_visa_update_fr_wrapper_data_line" style="margin-bottom:10px">
                            <div class="admin_visa_update_fr_wrapper_data_l1">
                                <label for="" class="lb">Consulate City</label>
                                <p>${VISA_OBJ.cityName}</p>
                            </div>
                            <div class="admin_visa_update_fr_wrapper_data_l1">
                                <label for="" class="lb">Visa Profile</label>
                                <p>${VISA_PROFILE.get(VISA_OBJ.profile)}</p>
                            </div>
                            <div class="admin_visa_update_fr_wrapper_data_l1">
                                <label for="" class="lb">Visa Type</label>
                                <p>${VISA_TYPE.get(VISA_OBJ.visaType)}</p>
                            </div>
                            <div class="admin_visa_update_fr_wrapper_data_l1">
                                <label for="" class="lb">Visa Purpose</label>
                                <p>${VISA_PURPOSE.get(VISA_OBJ.visaPurpose)}</p>
                            </div>
                        </div>
                        <div class="admin_visa_update_fr_wrapper_data_line">
                            <div class="admin_visa_update_fr_wrapper_data_l1">
                                <label for="" class="lb">Standard Cost</label>
                                <input type="text" name="standardCost" value="${VISA_OBJ.standardCost}" />
                            </div>
                            <div class="admin_visa_update_fr_wrapper_data_l1">
                                <label for="" class="lb">B2B Price</label>
                                <input type="text" name="standardB2bPrice" value="${VISA_OBJ.standardB2bPrice}" />
                            </div>
                            <div class="admin_visa_update_fr_wrapper_data_l1">
                                <label for="" class="lb">B2C Price</label>
                                <input type="text" name="standardB2cPrice" value="${VISA_OBJ.standardB2cPrice}" />
                            </div>
                            <div class="admin_visa_update_fr_wrapper_data_l1">
                                <label for="" class="lb">Processing Time</label>
                                <input type="text" name="processingTime" value="${VISA_OBJ.processingTime}" /> Days
                            </div>
                        </div>
                        <div class="admin_visa_update_fr_wrapper_data_line">
                            <div class="admin_visa_update_fr_wrapper_data_rem">
                                <label for="" class="lb">Internal Remarks</label><br>
                                <textarea rows="2" cols="66" name="internalRemarks" htmlEscape="false"
                                    maxlength="1040">${VISA_OBJ.internalRemarks}</textarea>
                            </div>
                            <div class="admin_visa_update_fr_wrapper_data_rem">
                                <label for="" class="lb">Other Costs</label><br>
                                <textarea rows="2" cols="66" name="otherCosts"
                                    htmlEscape="false">${VISA_OBJ.otherCosts}</textarea>
                            </div>
                        </div>
                        <div class="admin_visa_update_fr_wrapper_data_line">
                            <div class="admin_visa_update_fr_wrapper_data_rems">
                                <label for="" class="lb">Remarks</label><br>
                                <textarea rows="2" cols="139" name="remarks"
                                    htmlEscape="false">${VISA_OBJ.remarks}</textarea>
                            </div>
                        </div>
                        <div class="due_today_task_data_btns">
                                <input type="submit" name="submit" value="Update"/>
                                <form:form method="post" action="view_list_visa_proceed_docs_form" modelAttribute="VISA_OBJ">
						         <input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
							     <input type="submit" name="submit" value="Cancel" />
						</form:form>
                        </div>
                    </div>
                </div>
            </div>
				</form:form>
			
			
			</c:when>
			<c:otherwise>			
 			 <div class="abc_fom container">
        <div class="abc_fom_wrapper">
            <h1 style="font-size: 25px;margin:10px 0">Country Name : <span style="font-size: 25px;margin:10px 0">${VISA_OBJ.countryName}</span> </h1>
            <div class="abc_fom_wrapper_data">
                <div class="abc_fom_wrapper_data_line a">
                    <div class="abc_fom_wrapper_data_l1">
                        <label for="" class="lb">Consulate City</label>
                        <p>${VISA_OBJ.cityName}</p>
                        <input type="hidden" name="countryCode" id="countryCode" />
                    </div>
                    <div class="abc_fom_wrapper_data_l1">
                        <label for="" class="lb">Visa Profile</label>
                        <p>${VISA_PROFILE.get(VISA_OBJ.profile)}</p>
                    </div>
                    <div class="abc_fom_wrapper_data_l1">
                        <label for="" class="lb">Visa Type</label>
                        <p>${VISA_TYPE.get(VISA_OBJ.visaType)}</p>
                    </div>
                    <div class="abc_fom_wrapper_data_l1">
                        <label for="" class="lb">Visa Purpose</label>
                        <p>${VISA_PURPOSE.get(VISA_OBJ.visaPurpose)}</p>
                    </div>
                </div>
                <div class="abc_fom_wrapper_data_line a">
                    <div class="abc_fom_wrapper_data_l1">
                        <label for="" class="lb">Standrad Cost</label>
                        <p>${VISA_OBJ.standardCost}</p>
                    </div>
                    <div class="abc_fom_wrapper_data_l1">
                        <label for="" class="lb">B2B Price</label>
                        <p>${VISA_OBJ.standardB2bPrice}</p>
                    </div>
                    <div class="abc_fom_wrapper_data_l1">
                        <label for="" class="lb">B2C Price</label>
                        <p>${VISA_OBJ.standardB2cPrice}</p>
                    </div>
                    <div class="abc_fom_wrapper_data_l1">
                        <label for="" class="lb">Processing Time</label>
                        <p>${VISA_OBJ.processingTime} Days</p>
                    </div>
                </div>
                <div class="abc_fom_wrapper_data_line a">
                    <div class="abc_fom_wrapper_data_l1_rem">
                        <label for="" class="lb">Internal Remarks</label>
                        <p>${VISA_OBJ.internalRemarks}</p>
                    </div>
                    <div class="abc_fom_wrapper_data_l1_rem">
                        <label for="" class="lb">Other Costs</label>
                        <p>${VISA_OBJ.otherCosts}</p>
                    </div>
                </div>
                <div class="abc_fom_wrapper_data_line a">
                    <div class="abc_fom_wrapper_data_l1_rems">
                        <label for="" class="lb">Remarks</label>
                        <p>${VISA_OBJ.remarks}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
		 </c:otherwise>
		</c:choose>
		</table>
		
		<div class="btn-div" style="background:black;padding-bottom:20px;border-bottom-left-radius: 10px;border-bottom-right-radius: 10px;">
		<c:if test="${VISA_MASTER_ACTION ne 'UPDATE'}">
			<table  style="width:100%; border-collapse: collapse;"  align="center">
			<form:form modelAttribute="VISA_OBJ" action="view_update_visa_master_form" style="display:inline;">	
				<input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
				<tr>
				<td colspan="8" style="text-align:center;">
			   <div class="due_today_task_data_btns">
					<sec:authorize access="hasAnyRole('ADMIN','VISA_EDIT')">
						<input type="submit" name="submit" value="Edit" style="cursor:pointer" />
					</sec:authorize>
					<sec:authorize access="! hasAnyRole('ADMIN','VISA_EDIT')">
						<input type="button" name="submit" value="Edit" style="background-color: #dddddd;cursor:pointer" disabled/>
					</sec:authorize> 
					<a href="search_search_visa_master?countryCode=${VISA_OBJ.countryCode} " >Cancel
				</td>
				</tr>
				</form:form>
			</table>
		</c:if>
		</div>
		<br><br>
		
	
		
		<div style="margin-top:-45px">
		
		<table border="1 px;" style="width:1500px;margin-left:-150px; border-collapse: collapse;background:black;color:white;"  align="center">
			<tr style="height:50px;background:#6082B6">
				<div style="border-radius:5px;margin-bottom:20px;margin-left:400px;background:black;width:400px;text-align:center"><b><font color="#32cd32" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
				<th style="width:2%;color:black;text-align:center">Document Id</th>
				<th style="width:20%;color:black;">Document Title</th>
				<th style="width:40%;color:black">Document Description</th>
				<th style="width:20%;color:black;text-align:center">Action</th>
			</tr>
			<c:forEach var="visaDocObj" items="${VISA_DOC_LIST}">
				<c:choose>
				<c:when test="${ORG_VISA_DOC_OBJ.visaDocId eq visaDocObj.visaDocId  && VISA_DOC_ACTION eq 'UPDATE' }">
					<form:form modelAttribute="VISA_DOC_OBJ" action="edit_edit_visa_doc" style="display:inline;">
					<tr><td style="width:5%;text-align:center">${ORG_VISA_DOC_OBJ.visaDocId}</td>
					<td style="width:25%;text-align:center"><input style="width:300px;" type="text" id="documentTitle"  name="documentTitle" placeholder="document Title" value="${ORG_VISA_DOC_OBJ.documentTitle}" required /></td>
					<td style="width:40%;text-align:center"><textarea rows="3" cols="80" name="description" required>${ORG_VISA_DOC_OBJ.description}</textarea> </td>
					<td style="width:20%;">
						<table style="margin: 0 auto;">
							<tr>
								<td>
										<input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
										<input type="hidden" name="visaDocId" value="${ORG_VISA_DOC_OBJ.visaDocId}" />
										<input type="submit" name="submit" value="Update" style="color:white;background-color:#32cd32;border:2px solid black;border-radius:5px;outline:none;padding: 3px 10px;cursor:pointer"  /> 
								</td>
								</form:form>
								<td style="cellspacing: 0px;">
									<form:form modelAttribute="VISA_DOC_OBJ" action="view_list_visa_proceed_docs_form" style="display:inline;">
										<input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
										<input type="submit" name="submit" value="Cancel" style="color:white;background-color:red;border:2px solid black;border-radius:5px;outline:none;padding: 3px 10px;cursor:pointer" /> 
									</form:form>
								</td>
							</tr>
						</table>
					</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr><td style="width:2%;text-align:center">${visaDocObj.visaDocId}</td>
					<td style="width:25%;">${visaDocObj.documentTitle}</td>
					<td style="width:40%;">${visaDocObj.description}</td>
					<td style="width:20%;text-align:center">
							<form:form modelAttribute="VISA_DOC_OBJ" action="view_update_visa_doc_form" style="display:inline;">

									<input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
									<input type="hidden" name="visaDocId" value="${visaDocObj.visaDocId}" />
									<input type="hidden" name="documentTitle" value="${visaDocObj.documentTitle}" />
									<input type="hidden" name="description" value="${visaDocObj.description}" />
									<!-- 
									<input type="image" src="${pageContext.request.contextPath}/resources/images/edit.jpg" height="20" width="20"/>
									 -->
									<sec:authorize access="hasAnyRole('ADMIN','VISA_EDIT')">
										<input type="submit" style="background-color:#32cd32;color:white;border:2px solid black;border-radius:5px;outline:none;padding: 3px 10px;cursor:pointer" value="Edit" />
									</sec:authorize>
									<sec:authorize access="! hasAnyRole('ADMIN','VISA_EDIT')">
										<input type="button" style="background-color:#32cd32;color:gray;border:2px solid black;border-radius:5px;outline:none;padding: 3px 10px;cursor:pointer" value="Edit" disabled />
									</sec:authorize>
							</form:form>
							<form:form modelAttribute="VISA_DOC_OBJ" action="view_delete_visa_doc_form" style="display:inline;">
									<input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
									<input type="hidden" name="visaDocId" value="${visaDocObj.visaDocId}" />
									<!-- 
									<input type="image" src="${pageContext.request.contextPath}/resources/images/delete.jpg" height="20" width="20"/>
									 -->
									<sec:authorize access="hasAnyRole('ADMIN','VISA_DELETE')">
										<input type="submit" style="color:white;background-color:red;border:2px solid black;border-radius:5px;outline:none;padding: 3px 10px;cursor:pointer" value="Delete" />
									</sec:authorize>
									<sec:authorize access="! hasAnyRole('ADMIN','VISA_DELETE')">
										<input type="button" style="color:gray;background-color:red;border:2px solid black;border-radius:5px;outline:none;padding: 3px 10px;cursor:pointer" value="Delete" disabled/>
									</sec:authorize>

							</form:form>
					</td>
					</tr>
				</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${VISA_DOC_ACTION eq 'ADD'}">
				<form:form modelAttribute="VISA_DOC_OBJ" action="add_add_visa_doc" style="display:inline;">
					<tr style="background-color:black;color:orangered;text-align:center"><td>Auto Generated</td>
					<td><input style="width:300px;" type="text" id="documentTitle"  name="documentTitle" placeholder="document Title" required /></td>
					<td><textarea rows="1" cols="60" name="description" placeholder="Description" required></textarea> </td>
					<td>
						<table style="margin: 0 auto;">
							<tr style="text-align:center" >
						
								<td style="text-align:center;">
										<input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
										
										<sec:authorize access="hasAnyRole('ADMIN','VISA_ADD')">
											<input type="submit" name="submit" value="Add" style="color:white;background-color:#32cd32  ;border:2px solid black;border-radius:5px;outline:none;padding: 3px 5px;cursor:pointer"  />
										</sec:authorize> 
										<sec:authorize access="! hasAnyRole('ADMIN','VISA_ADD')">
											<input type="button" name="submit" value="Add" style="color:gray;background-color:#32cd32  ;border:2px solid black;border-radius:5px;outline:none;padding: 3px 10px;cursor:pointer"  disabled/>
										</sec:authorize>
								</td>
								</form:form>
								<td style="text-align:center">
									<form:form modelAttribute="VISA_DOC_OBJ" action="view_list_visa_proceed_docs_form" style="display:inline;">
										<input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
										<input type="submit" name="submit" value="Cancel" style="color:white;background-color:red  ;border:2px solid black;border-radius:5px;outline:none;padding: 3px 10px;cursor:pointer" /> 
									</form:form>
								</td>
								
							</tr>
						</table>
					</td>
					</tr>
				
			</c:if>
		</table>
		</div>
		<c:if test="${VISA_DOC_ACTION ne 'ADD'}">
		<table  style="width:70%; border-collapse: collapse;"  align="center">
		<form:form modelAttribute="VISA_OBJ" action="view_add_visa_proceed_docs_form" style="display:inline;">	
			<!-- <input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" /> -->
			<form:hidden path="visaId"/>
			<!-- 
			<input type="hidden" name="profile" value="${VISA_OBJ.profile}" />
			<input type="hidden" name="visaType" value="${VISA_OBJ.visaType}" />
			 -->
			<tr>
			<td colspan="4">
				<sec:authorize access="hasAnyRole('ADMIN','VISA_CREATE')">
					<input type="submit" name="submit" value="Add Document" style="color:white;background-color:#32cd32;border:2px solid black;border-radius:5px;outline:none;padding: 3px 10px;"/>
				</sec:authorize>
				<sec:authorize access="! hasAnyRole('ADMIN','VISA_CREATE')">
					<input type="button" name="submit" value="Add Document" style="color:gray;background-color:#32cd32;border:2px solid black;border-radius:5px;outline:none;padding: 3px 10px;" disabled />
				</sec:authorize>
			</td>
			</tr>
			</form:form>
		</table>
		</c:if>
    </div>
<script>
	$('#countryName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getCountryList',
	paramName: "countryName",
	delimiter: ",",
	onSelect: function(suggestion) {
        cityID = suggestion.data;
        id=cityID;
        jQuery("#countryCode").val(cityID);
        $('input[name=countryCode]').val(id);
        return false;
    },
	transformResult: function(response) {
        return {
            suggestions: $.map($.parseJSON(response), function(item) {
            	return { value: item.countryName, data: item.countryCode };
            })
            
        };
    }
});
</script>>
</body>
</html>