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
    <title>Manage Clients</title>
    
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
      <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<style>
.autocomplete-suggestions { border: 1px solid #999; background: red;overflow-y:auto}
		.autocomplete-suggestion {padding: 2px 5px;color:white; background: black;overflow-y: auto;overflow-y:auto}
		.autocomplete-selected { background: #F0F0F0;overflow-y:auto} 
		.autocomplete-suggestions strong { font-weight: normal; color:black;overflow-y:auto}
		.autocomplete-group { padding: 2px 5px;overflow-y:auto}
		.autocomplete-group strong { display: block; border-bottom: 1px solid #000;  background: black ; color:black overflow-y:auto}
		.autocomplete-selected:hover{
		color:black
		}
		 body::before {
            content: "";
            background-image: url(${pageContext.request.contextPath}/resources/images/revamped/search_clients.jpg);
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
    <div class="container">
    
    
    
<div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>
        <div class="manage-client-wrapper bs">
            <h1 class="search-clients">Search Client</h1>
            <font color="green"> ${Success} </font>
            <font color="red"> ${Error}</font>
            <c:if test="${hasErrorLog}">
                <br/><a href="download_client_import_error_log" style="color: #0056b3; font-weight: bold; text-decoration: underline; margin-top: 5px; display: inline-block;">
                    <i class="fa-solid fa-download"></i> Click here to Download Failed Records Log Excel
                </a>
            </c:if>
            <div class="search-client-form">
                <form:form modelAttribute="SEARCH_CLIENTS" action="search_search_filtered_clients">
                <div class="sc-first-li">
                    <div class="sc-first-li-d1">
                        <label for="clientId" style="font-weight:600">Client Id</label>
                        <input type="number" class="contact" id="clientId" name="clientId" placeholder="clientId"
                            min="0" value="${SEARCH_CLIENTS.clientId}" />
                    </div>
                    <div class="sc-first-li-d1">
                        <label for=""  style="font-weight:600">Client Name</label>
                        <input type="text" class="contact" id="clientName" name="clientName" size="35" placeholder="clientName" value="${SEARCH_CLIENTS.clientName}" />
                    </div>
                    <div class="sc-first-li-d1">
                        <label for=""  style="font-weight:600">City Name</label>
                        <input type="text" class="contact" id="cityName" name="cityName" size="35"
                            placeholder="City / Country" value="${SEARCH_CLIENTS.cityName}" />
                        <input type="hidden" name="cityId" value="${SEARCH_CLIENTS.cityId}" />
                    </div>
                    <div class="sc-first-li-d1">
                        <label for=""  style="font-weight:600">Contact Number</label>
                        <input type="number" class="contact" id="contactNumber" name="contactNumber" min="0" size="20"
                            placeholder="Contact Number" value="${SEARCH_CLIENTS.contactNumber}" />
                    </div>
                </div>
                <div class="search-client-form">
                    <div class="sc-first-li cli-em-sec">
                        <div class="sc-first-li-d1 mp">
                            <label for=""  style="font-weight:600">Email </label> <br>
                            <input type="text" class="contact" id="email" name="email" placeholder="email"
                                value="${SEARCH_CLIENTS.email}" />
                        </div>
                        <div class="sc-first-li-d1 mp" >
                            <label for=""  style="font-weight:600">Active</label> <br>
                            <select id="active" name="active" class="anc-active" >
                                <c:if test="${active eq true }">
                                    <option value="true" selected>
                                        <c:out value="True" />
                                    </option>
                                    <option value="false">
                                        <c:out value="False" />
                                    </option>
                                </c:if>
                                <c:if test="${active eq false}">
                                    <option value="true">
                                        <c:out value="True" />
                                    </option>
                                    <option value="false" selected>
                                        <c:out value="False" />
                                    </option>

                                </c:if>
                            </select>
                        </div>
                       
                    </div>
                     <div class="sc-first-li-d1 due_today_task_data_btnss" style="margin-top:10px">
                            <input style="background-color:#32cd32;" type="submit" value="Apply Filter" />
                            <a href="view_form_admin_search_client"><input type="button" value="Clear Filter" /></a>
                            <sec:authorize access="hasAnyRole('ADMIN','CLIENT_CREATE','ROLE_CLIENT_CREATE')">
                                <input type="button" value="Import Client" id="openImportModalBtn" style="background-color:#007bff; color:white; font-weight:600; cursor:pointer; margin-left:10px;" onclick="openImportModal()" />
                                <input type="button" value="&#x25BC; Export Client" id="openExportModalBtn" style="background-color:#17a2b8; color:white; font-weight:600; cursor:pointer; margin-left:8px;" onclick="openExportModal()" />
                            </sec:authorize>
                        </div>
                </div>
                </form:form>
            </div>
        </div>
  
         </div>

<!-- Client Import Modal Popup -->
<sec:authorize access="hasAnyRole('ADMIN','CLIENT_CREATE','ROLE_CLIENT_CREATE')">
<div id="importClientModal" class="custom-modal" style="display:none; position:fixed; z-index:9999; left:0; top:0; width:100%; height:100%; background-color:rgba(0,0,0,0.6);">
    <div style="background-color:#fff; margin:10% auto; padding:25px; border-radius:8px; width:450px; box-shadow:0 4px 15px rgba(0,0,0,0.3); position:relative; font-family:sans-serif;">
        <span onclick="closeImportModal()" style="position:absolute; right:15px; top:10px; font-size:24px; font-weight:bold; cursor:pointer; color:#888;">&times;</span>
        <h2 style="margin-top:0; color:#333; font-size:20px; border-bottom:2px solid #007bff; padding-bottom:8px;">Import Client Data</h2>
        
        <div style="margin-top:15px; background-color:#eef6ff; padding:12px; border-radius:5px; font-size:13px; color:#333;">
            <p style="margin:0 0 8px 0; font-weight:bold;">Step 1: Download Template</p>
            <a href="download_client_import_template" style="display:inline-block; padding:6px 12px; background-color:#28a745; color:white; text-decoration:none; border-radius:4px; font-size:12px; font-weight:bold;">
                <i class="fa-solid fa-file-excel"></i> Download Excel Template
            </a>
        </div>

        <form action="import_clients" method="post" enctype="multipart/form-data" style="margin-top:20px;">
            <div style="font-size:13px; font-weight:bold; margin-bottom:6px; color:#333;">Step 2: Upload Populated Excel File (.xlsx / .xls)</div>
            <input type="file" name="file" accept=".xlsx, .xls" required style="width:100%; padding:8px; border:1px solid #ccc; border-radius:4px; box-sizing:border-box; margin-bottom:15px;" />
            
            <div style="text-align:right; margin-top:15px;">
                <input type="button" value="Cancel" onclick="closeImportModal()" style="padding:8px 16px; background-color:#6c757d; color:white; border:none; border-radius:4px; cursor:pointer; margin-right:8px;" />
                <input type="submit" value="Upload & Import" style="padding:8px 16px; background-color:#007bff; color:white; border:none; border-radius:4px; cursor:pointer; font-weight:bold;" />
            </div>
        </form>
    </div>
</div>

<script>
    function openImportModal() {
        document.getElementById('importClientModal').style.display = 'block';
    }
    function closeImportModal() {
        document.getElementById('importClientModal').style.display = 'none';
    }
    window.onclick = function(event) {
        var modal = document.getElementById('importClientModal');
        if (event.target == modal) {
            modal.style.display = 'none';
        }
    }
</script>
</sec:authorize>

<!-- ===== Client Export Modal ===== -->
<sec:authorize access="hasAnyRole('ADMIN','CLIENT_CREATE','ROLE_CLIENT_CREATE')">
<div id="exportClientModal" style="display:none; position:fixed; z-index:9999; left:0; top:0; width:100%; height:100%; background-color:rgba(0,0,0,0.6);">
    <div style="background-color:#fff; margin:5% auto; padding:28px 30px; border-radius:10px; width:520px; max-width:95%; box-shadow:0 6px 25px rgba(0,0,0,0.35); position:relative; font-family:sans-serif;">
        <span onclick="closeExportModal()" style="position:absolute; right:15px; top:10px; font-size:24px; font-weight:bold; cursor:pointer; color:#888;">&times;</span>
        <h2 style="margin-top:0; color:#17a2b8; font-size:20px; border-bottom:2px solid #17a2b8; padding-bottom:8px;">&#x25BC; Export Client Data</h2>

        <!-- Last Export Info Banner -->
        <div style="background:#f0f9fb; border-left:4px solid #17a2b8; padding:10px 14px; border-radius:4px; font-size:12.5px; color:#333; margin-bottom:18px;">
            <c:choose>
                <c:when test="${not empty LAST_EXPORT_DATE}">
                    <span style="font-weight:bold; color:#17a2b8;">&#128197; Last Exported On:</span>
                    <span style="margin-left:4px;">${LAST_EXPORT_DATE}</span>
                    &nbsp;&nbsp;
                    <span style="font-weight:bold; color:#17a2b8;">&#128196; Purpose:</span>
                    <span style="margin-left:4px;">${LAST_EXPORT_PURPOSE}</span>
                </c:when>
                <c:otherwise>
                    <span style="color:#6c757d;">&#8505; No previous export recorded for this session.</span>
                </c:otherwise>
            </c:choose>
        </div>

        <form id="exportClientForm" action="export_clients" method="get">

            <!-- Purpose of Export -->
            <div style="margin-bottom:14px;">
                <label for="exportPurpose" style="font-size:13px; font-weight:bold; color:#333; display:block; margin-bottom:4px;">Purpose of Export <span style="color:red;">*</span></label>
                <input type="text" id="exportPurpose" name="exportPurpose" placeholder="e.g. Marketing Campaign, Monthly Audit, Follow-up"
                       style="width:100%; padding:8px; border:1px solid #ccc; border-radius:4px; box-sizing:border-box; font-size:13px;" required />
            </div>

            <!-- City Filter -->
            <div style="margin-bottom:14px;">
                <label for="exportCityName" style="font-size:13px; font-weight:bold; color:#333; display:block; margin-bottom:4px;">Filter by City (optional)</label>
                <input type="text" id="exportCityName" name="cityName" placeholder="Start typing city name..."
                       style="width:100%; padding:8px; border:1px solid #ccc; border-radius:4px; box-sizing:border-box; font-size:13px;" autocomplete="off" />
                <input type="hidden" id="exportCityId" name="cityId" value="0" />
            </div>

            <!-- Date Filter Type -->
            <div style="margin-bottom:14px;">
                <label for="exportDateFilterType" style="font-size:13px; font-weight:bold; color:#333; display:block; margin-bottom:4px;">Filter by Creation Date</label>
                <select id="exportDateFilterType" name="dateFilterType" onchange="toggleExportDateFields()"
                        style="width:100%; padding:8px; border:1px solid #ccc; border-radius:4px; box-sizing:border-box; font-size:13px;">
                    <option value="ALL">All Dates</option>
                    <option value="TODAY">Created Today</option>
                    <option value="AFTER">Created After</option>
                    <option value="RANGE">Date Range</option>
                </select>
            </div>

            <!-- Created After Date -->
            <div id="exportAfterDateDiv" style="display:none; margin-bottom:14px;">
                <label for="exportCreatedAfterDate" style="font-size:13px; font-weight:bold; color:#333; display:block; margin-bottom:4px;">Created After Date</label>
                <input type="date" id="exportCreatedAfterDate" name="createdAfterDate"
                       style="width:100%; padding:8px; border:1px solid #ccc; border-radius:4px; box-sizing:border-box; font-size:13px;" />
            </div>

            <!-- Date Range -->
            <div id="exportDateRangeDiv" style="display:none; margin-bottom:14px;">
                <div style="display:flex; gap:12px;">
                    <div style="flex:1;">
                        <label for="exportStartDate" style="font-size:13px; font-weight:bold; color:#333; display:block; margin-bottom:4px;">From Date</label>
                        <input type="date" id="exportStartDate" name="startDate"
                               style="width:100%; padding:8px; border:1px solid #ccc; border-radius:4px; box-sizing:border-box; font-size:13px;" />
                    </div>
                    <div style="flex:1;">
                        <label for="exportEndDate" style="font-size:13px; font-weight:bold; color:#333; display:block; margin-bottom:4px;">To Date</label>
                        <input type="date" id="exportEndDate" name="endDate"
                               style="width:100%; padding:8px; border:1px solid #ccc; border-radius:4px; box-sizing:border-box; font-size:13px;" />
                    </div>
                </div>
            </div>

            <!-- Reference Filter -->
            <div style="margin-bottom:18px;">
                <label for="exportReference" style="font-size:13px; font-weight:bold; color:#333; display:block; margin-bottom:4px;">Filter by Reference (optional)</label>
                <input type="text" id="exportReference" name="reference" placeholder="e.g. Agent Name, Source"
                       style="width:100%; padding:8px; border:1px solid #ccc; border-radius:4px; box-sizing:border-box; font-size:13px;" />
            </div>

            <!-- Actions -->
            <div style="text-align:right;">
                <input type="button" value="Cancel" onclick="closeExportModal()" style="padding:8px 16px; background-color:#6c757d; color:white; border:none; border-radius:4px; cursor:pointer; margin-right:8px; font-size:13px;" />
                <input type="submit" value="&#x25BC; Download Export Excel" style="padding:8px 16px; background-color:#17a2b8; color:white; border:none; border-radius:4px; cursor:pointer; font-weight:bold; font-size:13px;" />
            </div>
        </form>
    </div>
</div>

<script>
    function openExportModal() {
        document.getElementById('exportClientModal').style.display = 'block';
    }
    function closeExportModal() {
        document.getElementById('exportClientModal').style.display = 'none';
        // reset date fields
        document.getElementById('exportAfterDateDiv').style.display = 'none';
        document.getElementById('exportDateRangeDiv').style.display = 'none';
        document.getElementById('exportDateFilterType').value = 'ALL';
    }
    function toggleExportDateFields() {
        var val = document.getElementById('exportDateFilterType').value;
        document.getElementById('exportAfterDateDiv').style.display  = (val === 'AFTER') ? 'block' : 'none';
        document.getElementById('exportDateRangeDiv').style.display  = (val === 'RANGE') ? 'block' : 'none';
    }
    // Close on backdrop click
    document.getElementById('exportClientModal').addEventListener('click', function(e) {
        if (e.target === this) closeExportModal();
    });
    // City autocomplete for export modal
    $(function() {
        $('#exportCityName').autocomplete({
            serviceUrl: '${pageContext.request.contextPath}/getCityList',
            paramName: "cityName",
            delimiter: ",",
            onSelect: function (suggestion) {
                $('#exportCityId').val(suggestion.data);
            },
            transformResult: function (response) {
                return {
                    suggestions: $.map($.parseJSON(response), function (item) {
                        return { value: item.cityName, data: item.destinationId };
                    })
                };
            }
        });
    });
</script>
</sec:authorize>
        
        
           <div class="search-clients-sec bs">
            <c:set value="${CLIENTS_LIST}" var="clientList" />
            <table class="sc-table">
                <thead style="background:#6082B6;">
                    <tr style="height:50px;color:black">
                        <th class="sc-th" style="width: 110px;"><a
                                href="search_search_filtered_clients?sortBy=clientId&clientName=${clientName}&cityId=${cityId}&cityName=${cityName}&email=${email}&active=${active}" style="color:black">Client
                                Id</a></th>
                        <th class="sc-th" style="width:300px">Client Name</th>
                        <th class="sc-th">City</th>
                        <th class="sc-th" style="width: 120px;">Country</th>
                        <th class="sc-th">Email</th>
                        <th class="sc-th">Mobile</th>
                        <th class="sc-th" style="width: 35px;">Active</th>
                        <th class="sc-th" style="width: 105px;">Action</th>
                    </tr>
                    
                </thead>
                <c:forEach items="${clientList}" var="client">
                <tbody>
                    <tr>
                        <td  style="border-bottom:2px solid black;border-right:2px solid black;border-left:2px solid black">${client.clientId }</td>
                        <td style="border-bottom:2px solid black;border-right:2px solid black;">${client.clientName }</td>
                        <td  style="border-bottom:2px solid black;border-right:2px solid black;">${client.cityName }</td>
                        <td  style="border-bottom:2px solid black;border-right:2px solid black;">${client.countryName }</td>
                        <td  style="border-bottom:2px solid black;border-right:2px solid black;">${client.email }</td>
                        <td  style="border-bottom:2px solid black;border-right:2px solid black;">${client.mobile }</td>
                        <td  style="border-bottom:2px solid black;border-right:2px solid black;">${client.active }</td>
                        <td  style="border-bottom:2px solid black;border-right:2px solid black;">
                            <i class="fa-solid fa-sliders anc-i">
                                <div class="ul-anc">
                                    <ul>
                                        
                                            <sec:authorize
                                                access="hasAnyRole('ADMIN','CLIENT_VIEW','CLIENT_EDIT','CLIENT_DELETE')">
                                                <li>
                                                <a href="view_view_admin_client?clientId=${client.clientId}">View</a>
                                                </li>
                                            </sec:authorize>
                                        
                                       
                                            <sec:authorize access="hasAnyRole('ADMIN','CLIENT_EDIT')">
                                             <li>
                                                <a  href="view_edit_admin_client?clientId=${client.clientId}">Edit</a>
                                                </li>
                                            </sec:authorize>

                                            <sec:authorize access="! hasAnyRole('ADMIN','CLIENT_EDIT')">
                                             <li>
                                                <a href="view_edit_admin_client?clientId=${client.clientId}">Delete</a>
                                                 </li>
                                            </sec:authorize>
                                       
                                       
                                            <sec:authorize access="! hasAnyRole('ADMIN','CLIENT_DELETE')">
                                             <li>
                                                <a
                                                    href="view_view_delete_client_confirmation?clientId=${client.clientId}">Delete</a>
                                                     </li>
                                            </sec:authorize>
                                       
                                        
                                            <sec:authorize access="hasAnyRole('ADMIN','CLIENT_MANAGE_DOCS')">
                                            <li>
                                                <a
                                                    href="view_view_crud_client_docs?clientId=${client.clientId}">Docs</a>
                                                     </li>
                                            </sec:authorize>
                                       
                                       
                                            <sec:authorize access="! hasAnyRole('ADMIN','CLIENT_MANAGE_DOCS')">
                                             <li>
                                                <a
                                                    href="view_view_crud_client_docs?clientId=${client.clientId}">Docs</a>
                                                     </li>
                                            </sec:authorize>
                                       
                                    </ul>
                                </div>
                            </i>
                        </td> </tr>
                        </c:forEach>
                </tbody>
            </table>
          </div>

     


	<div id="pagination" align="center">
				<font size="3" style="color:#ffa500;background:black;display:inline-block;padding:2px;border-radius:2px">Page:  </font>
			    <c:url value="view_form_admin_search_client" var="prev">
			       <c:param name="page" value="${page-1}"/>
			    </c:url>
			    <c:if test="${page > 0}">
			        <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href="<c:out value="${prev}&sortBy=${sortBy}&clientName=${clientName}&cityId=${cityId}&cityName=${cityName}&email=${email}&active=${active}" />" class="pn prev">Prev</a>
			    </c:if>
			
			    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
			        <c:choose>
			            <c:when test="${(page+1) == i.index}">
			                <span style="background:black;padding:2px 5px;border-radius:2px;color:white">${i.index}</span>
			            </c:when>
			            <c:otherwise>
			                <c:url value="view_form_admin_search_client" var="url">
			                    <c:param name="page" value="${i.index-1} "/>
			                </c:url>
			                 <a  style="padding:2px 5px;border-radius:2px;color:black" href='<c:out value="${url}&sortBy=${sortBy}&clientName=${clientName}&cityId=${cityId}&cityName=${cityName}&email=${email}&active=${active}" />'>${i.index}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:url value="view_form_admin_search_client" var="next">
			        <c:param name="page" value="${page + 1}"/>
			    </c:url>
			    <c:if test="${page + 1 < maxPages}">
			       <a  style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href='<c:out value="${next}&sortBy=${sortBy}&clientName=${clientName}&cityId=${cityId}&cityName=${cityName}&email=${email}&active=${active}" />' class="pn next">Next</a>
			    </c:if>
			    
			</div>


        <script>
            $('#cityName').autocomplete({
                serviceUrl: '${pageContext.request.contextPath}/getCityList',
                paramName: "cityName",
                delimiter: ",",
                onSelect: function (suggestion) {
                    cityID = suggestion.data;
                    id = cityID;
                    jQuery("#destinationId").val(cityID);
                    $('input[name=cityId]').val(id);
                    return false;
                },
                transformResult: function (response) {
                    return {
                        suggestions: $.map($.parseJSON(response), function (item) {
                            return {
                                value: item.cityName,
                                data: item.destinationId
                            };
                        })

                    };
                }
            });


        </script>

</body>

</html>