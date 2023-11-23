<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>manageStatus</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<body style="background: url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
    <div class="manageStatus containermm">
        <div class="manageStatus_wrapper">
            <form:form modelAttribute="TI_STATUS" action="manage_object_status" id="statusform">
                <form:hidden path="workloadStatusObj" id="workloadStatusObj" />
                <form:hidden path="workloadStatusObjType" id="workloadStatusObjType" />
                <form:hidden path="workloadStatusShortName" id="workloadStatusShortName" />
                <form:hidden path="id" id="id" />
        <table class="manageStatus_table">
            <thead>
                <tr style="height:90px;">
                    <th style="font-size:20px">Status Type</th>
                    <th style="font-size:20px">Status Values</th>
                    <th style="font-size:20px">Action</th>
                </tr>
            </thead>
            <tbody>

            <c:forEach var="statusOf" items="${STATUS_LIST_OF_MAP.keySet()}" varStatus="status">
                <tr style="background:#DEE9BE;padding:50px">
                    <th style="background-color:black;width:20%;color:white;border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">${status.count} : ${statusOf}</th>
                    <td style="width:60%;background:black;border-bottom:2px solid #FABA08;border-right:2px solid #FABA08;color:white">
                        <table id="dataTable${statusOf}" style="table-layout: fixed;">
                            <tr>
                                <th style="width:20%;color:black;background:#ffeedd;">Status Id</th>
                                <th style="width:20%;color:black;background:#ffeedd;">Status Object</th>
                                <th style="width:30%;color:black;background:#ffeedd;">Status Name</th>
                                <th colspan="2" style="width:30%;color:black;background:#ffeedd;">Status Action</th>
                            </tr>
                            <c:forEach var="statusValues" items="${ STATUS_LIST_OF_MAP.get(statusOf)}">
                           
                                <tr>
                                    <td style="width:20%;color:white">${statusValues.workloadStatusId }</td>
                                    <td style="width:20%;color:white">${statusValues.workloadStatusObj }</td>
            
                                    <c:choose>
                                        <c:when test="${ST_ACTION eq 'EDIT' &&  TI_STATUS.id eq statusValues.id}">
                                            <td id="updatestatus" style="width:30%;"><input name="workloadStatusName"
                                                    style="width: 450px;height:40px;" maxlength="45" type="text"
                                                    id="workloadStatusName" value="${statusValues.workloadStatusName }" /> </td>
                                            <td style="width:10%;"><input type="submit" name="UPDATE_UPDATE_STATUS" value="Submit"
                                                    onclick="toggleStatus('${statusValues.id}')"
                                                    style="border:none;outline;none;background:#32cd32;color:white;border:2px solid black;padding:5px;border-radius:3px"  /></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td style="width:30%;color:white">${statusValues.workloadStatusName }</td>
                                            <td style="width:15%;"><input class="mng-st-btn" type="submit" name="Edit Status" value="Edit"
                                                    onclick="toggleStatus('${statusValues.id}')"
                                                    style="border:2px solid black;padding:5px;border-radius:5px;outline;none;background:#32cd32;color:white" /></td>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:if test="${statusValues.active eq true}">
                                        <td style="width:15%;"><input class="mng-st-btn" type="submit" id="De-Activate Status"
                                                name="De-Activate Status" value="De-Activate Status"
                                                onclick="toggleStatus('${statusValues.id}')" style="border:none;outline;none;background:#FF3131	;color:white;border:2px solid black;padding:5px;border-radius:5px" /></td>
                                    </c:if>
                                    <c:if test="${statusValues.active eq false}">
                                        <td style="width:15%;"><input type="submit" value="Activate Status" name="Activate Status"
                                                onclick="toggleStatus('${statusValues.id}')"
                                                style="border:none;outline;none;background:#32cd32;color:white;border:2px solid black;padding:5px;border-radius:3px" /></td>
                                    </c:if>
                                </tr>
                                <c:set var="workloadStatusObj" scope="session" value="${statusValues.workloadStatusObj }" />
                                <c:set var="workloadStatusType" scope="session" value="${statusValues.workloadStatusObjType }" />
                            </c:forEach>
                        </table>
                    </td>
                    <td style="width:20%;background:black;color:white;border-bottom:2px solid #FABA08;color:white"><input type="button" id="addnewstatus"  value="Add New Status" class="mng-sts-btn" style="border-radius:5px;padding:5px;border:2px solid #FABA08;outline;none;background:#FABA08;color:black"
                            onclick="addRow('dataTable${statusOf}','${workloadStatusObj}',${ STATUS_LIST_OF_MAP.get(statusOf).size()},'${ workloadStatusType}')" />
                    </td>
                </tr>
            </c:forEach>

<!-- 

                <tr>
                    <td>Type A</td>
                    <td>
                        <table class="manageStatus__sub_table">
                            <thead>
                                <tr>
                                    <th>Status ID</th>
                                    <th>Status Object</th>
                                    <th>Status Name</th>
                                    <th>Status Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>Object A</td>
                                    <td>Status Name A</td>
                                    <td><button style="background: transparent;border:none;outline:none;color:#32cd32;margin-right:5px">Edit</button> <button style="background: transparent;border:none;outline:none;color:red">Delete</button></td>
                                </tr>
                                <!-- Add more rows as needed -->
                            <!-- </tbody>
                        </table>
                    </td>
                   
                    <td><button style="background: transparent;border:none;outline:none;color: #c71585;font-weight: bold;">Add new status</button</td> -->
                <!-- </tr> -->
                <!-- Add more rows as needed -->
            </tbody>
        </table>
        </form:form>
        </div>
    </div>

    <SCRIPT>

        function toggleStatus(id) {
            document.getElementById("id").value = id;
        }

        function addRow(tableID, WL_ST_OBJ, orgRowCount, WL_TYPE) {
            var table = document.getElementById(tableID);
            var rowCount = table.rows.length;
            var minLength = 5;
            if (rowCount - orgRowCount == 1) {
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
                element2.minLength = 5;
                element2.maxLength = 45;
                cell3.appendChild(element2);

                var cell4 = row.insertCell(3);
                var submitButton = document.createElement("input");
                submitButton.type = "submit";
                submitButton.name = "Add Status";
                submitButton.value = "Add Status";
                submitButton.style.color = "white";
                cell4.appendChild(submitButton);

                var cell5 = row.insertCell(4);
                var cancelButton = document.createElement("input");
                cancelButton.type = "button";
                cancelButton.name = "statusCancel";
                cancelButton.value = "Cancel";
                cancelButton.style.background = "blue";
                cancelButton.style.color = "white";
                cell5.appendChild(cancelButton);

                document.getElementById("workloadStatusObj").value = WL_ST_OBJ;
                document.getElementById("workloadStatusObjType").value = WL_TYPE;

                submitButton.addEventListener("click", function () {
                    if (element2.value.length >= minLength) {
                        form.submit();
                    } else {
                        alert("The length of the input must be at least " + minLength + " characters.");
                    }
                });

                cancelButton.addEventListener("click", function () {
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