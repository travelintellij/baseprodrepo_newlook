<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Supplier Details</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<style>
        body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/search_supplier_bg.jpg);
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
    <div class="view_supplier_details container">
        <div class="view_supplier_details_wrapper bs">
            <h1 style="font-size: 30px;
    color: black;
    margin-bottom: 10px;text-align:center"><span style="color:#00b200;font-size: 30px"> Supplier Id :
                    ${SUPPLIER_OBJ.supplierId}</span> </h1>
            <div align="center" style="margin:10px 0"><b>
                    <font color="#32cd32  "> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <form:form method="post" action="form_view_editsupplier" modelAttribute="SUPPLIER_OBJ">
                <form:hidden path="supplierId" />
                <form:hidden path="destinationNames" />
                <form:hidden path="operatingDestinations" />
                <div class="view_supplier_details_data">
                    <div class="view_supplier_details_data_line1 a" >
                        <div class="view_supplier_details_l1_d">
                            <label for="" style="color:black;font-weight:normal">Supplier Name</label>
                            <p style="font-weight:600;color:#023e8a">${SUPPLIER_OBJ.supplierName}</p>
                        </div>
                        <div class="view_supplier_details_l1_d">
                            <label for="" style="color:black;font-weight:normal">City</label>
                            <p style="font-weight:600;color:#023e8a">${SUPPLIER_OBJ.cityName}</p>
                        </div>
                        <div class="view_supplier_details_l1_d">
                            <label for="" style="color:black;font-weight:normal">Country</label>
                            <p style="font-weight:600;color:#023e8a">${SUPPLIER_OBJ.countryName}</p>
                        </div>
                        <div class="view_supplier_details_l1_d">
                            <label for="" style="color:black;font-weight:normal">Mobile</label>
                            <p style="font-weight:600;color:#023e8a">${SUPPLIER_OBJ.mobile}</p>
                        </div>
                      
                         <div class="view_supplier_details_l1_d">
                            <label for="" style="color:black;font-weight:normal">Phone</label>
                            <p style="font-weight:600;color:#023e8a">${SUPPLIER_OBJ.phone}</p>
                        </div>
                    </div>
                    <div class="view_supplier_details_data_line1 a">
                        
                        <div class="view_supplier_details_l1_d_max_w">
                            <label for="" style="color:black;font-weight:normal"`>Email</label>
                            <p style="font-weight:600;color:#023e8a">${SUPPLIER_OBJ.email}</p>
                        </div>
                         <div class="view_supplier_details_l1_d_max_w">
                            <label for="" style="color:black;font-weight:normal">Referred By</label>
                            <p style="font-weight:600;color:#023e8a">${SUPPLIER_OBJ.referredBy}</p>
                        </div>
                    </div>
                       <div class="view_supplier_details_l1_d a" style="width:100%" >
                            <label for="" style="color:black;font-weight:normal">Company Details</label>
                            <p style="font-weight:600;color:#023e8a">
                            ${SUPPLIER_OBJ.companyDetails}
                            </p>
                        </div>
                   
                        <div class="a">
                            <label for="" style="color:black;font-weight:normal">GST Details</label>
                            <p style="font-weight:600;color:#023e8a">${SUPPLIER_OBJ.gstDetails}</p>
                        </div>
                       
                        <div class="view_supplier_details_l1_d a" style="width:100%">
                            <label for="" style="color:black;font-weight:normal">Bank Details</label>
                            <p style="font-weight:600;color:#023e8a">
                            ${SUPPLIER_OBJ.bankDetails}
                            </p>
                        </div>
                        <div class="view_supplier_details_l1_d a" style="width:100%">
                            <label for="" style="color:black;font-weight:normal">Remarks</label>
                            <p style="font-weight:600;color:#023e8a">
                           ${SUPPLIER_OBJ.remarks}
                            </p>
                        </div>
                   
                    
                    
                     <div  class="a">
                            <label for="" style="color:black;font-weight:normal">Address</label>
                            <p style="font-weight:600;color:#023e8a">
                           ${SUPPLIER_OBJ.address}
                            </p>
                        </div>
                    
                    
                    
                    <div class="view_supplier_details_data_line3 a" >
                        <h3 class="vsd_des"  style="color:black;font-weight:normal">Following Destinations are supported</h3>
                        <div class="view_supplier_details_data_line3_destination_supported">
                            <c:forEach items="${SUPPLIER_OBJ.destinations}" var="destination">
                               <span style="font-weight:600;color:#023e8a"> ${destination.cityName}, </span>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="view_supplier_details_data_line4 ">
                        <h3 class="vsd_ser" style="color:black;font-weight:normal">Service offered</h3>
                        <div class="view_supplier_details_data_line3_service_offered a vsdch">
                        <div class="vsdchsd">
                        <form:checkbox class="ch_c" path="flight" disabled="true" style="margin-right:15px;height:18px;width:18px" />
                        <label>Flight</label>
                        </div>
                               <div class="vsdchsd">
                                <form:checkbox class="ch_c" path="hotel" disabled="true" style="margin-right:15px;height:18px;width:18px"/>
                               <label>Hotel</label>
                               </div>  
                                 
                                  <div class="vsdchsd">
                                    <form:checkbox  class="ch_c" path="transfers" disabled="true" style="margin-right:15px;height:18px;width:18px"/>
                                  <label>Transfers</label>
                                  </div>
                                  
                                  <div class="vsdchsd">
                                  <form:checkbox  class="ch_c" path="sightseeing" disabled="true" style="margin-right:15px;height:18px;width:18px"/>
                                  <label>sightseeing</label>
                                  </div>
                                  
                                     <div class="vsdchsd">
                                    <form:checkbox  class="ch_c" path="visa" disabled="true" style="margin-right:15px;height:18px;width:18px"/>
                                   <label>visa</label>
                                  </div>
                                  
                                      <div class="vsdchsd">
<form:checkbox  class="ch_c" path="insurance" disabled="true" style="margin-right:15px;height:18px;width:18px"/>
                                  <label> Insurance</label>
                                  </div>  
                                   
                                       <div class="vsdchsd">
                                      
                                            <form:checkbox class="ch_c"  path="landPackage" disabled="true" style="margin-right:15px;height:18px;width:18px"/>
                                       <label> landPackage</label>
                                       </div>
                                
                                            <div class="vsdchsd">
                                            
                                            <form:checkbox class="ch_c" path="cruise" disabled="true" style="margin-right:15px;height:18px;width:18px"/>
                                            <label> Cruise</label>
                                            </div>
                                  
                                  <div class="vsdchsd">
                                  
                                            <form:checkbox class="ch_c" path="others" disabled="true" style="margin-right:15px;height:18px;width:18px"/>    
                                  <label> others</label>       
                                  </div>
                                           
                        </div>
                    </div>
                 
                 <div class="view_supplier_details_data_line5_box a" style="margin-top:2px solid gray"> 
                   <div class="view_supplier_details_data_line_com">
                        <h3 class="vsd_consoli"  style="color:black;font-weight:normal">consolidater</h3>
                        <div class="view_supplier_details_data_line3_consoli">
                            <form:checkbox class="ch_c" path="consolidator" disabled="true" style="height:18px;width:18px" />
                        </div>
                    </div>
                    <div class="view_supplier_details_data_line_com">
                        <h3 class="vsd_sp"  style="color:black;font-weight:normal">Supplier Prefrences</h3>
                        <div class="view_supplier_details_data_line3_supp_pre">
                            <p style="font-weight:600;color:#023e8a">${SUPPLIER_OBJ.supplierRating} Star
                                (Scale 1 to 5)</p>
                        </div>
                    </div>
                    <div class="view_supplier_details_data_line_com">
                        <h3 class="vsd_sp"  style="color:black;font-weight:normal">Negotiates</h3>
                        <div class="view_supplier_details_data_line3_supp_pre">
                            <p style="font-weight:600;color:#023e8a">${SUPPLIER_OBJ.negotiates}</p>
                        </div>
                    </div>
                    </div>
                    <div class="due_today_task_data_btns vsd_btns_af">
                        <input type="submit" value="Edit Supplier" />
                        <a href="view_form_admin_search_supplier">Search Supplier</a>
                        <a href="view_supplier_contacts_listing?supplierId=${SUPPLIER_OBJ.supplierId}">Contats
                            listing</a>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
 


    <script type="text/javascript" defer>

        $(function () {
            var ms = $('#destinationHandling').magicSuggest({
                data: '${pageContext.request.contextPath}/getDestinationList',
                valueField: 'id',
                displayField: 'tagName',
                //name: 'operatingDestinations',
                maxDropHeight: 145,
                maxSuggestions: 10,
                resultAsString: true
            });
            //ms.addToSelection([{"id":4,"tagName":"Mumbai"},{"id":542,"tagName":"New Delhi"}]);

            $(ms).on('load', function () {
                if (this._dataSet === undefined) {
                    this._dataSet = true;
                    ms.addToSelection(${ SUPPLIER_OBJ.destinationNames });
                    ms.setDataUrlParams({});
                }
            });


            $(ms).on('selectionchange', function (e, m) {
                $("#operatingDestinations").val(ms.getValue());
            });
        });



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
                        return { value: item.cityName, data: item.destinationId };
                    })

                };
            }
        });

        $('#countryName').autocomplete({
            serviceUrl: '${pageContext.request.contextPath}/getCountryList',
            paramName: "countryName",
            delimiter: ",",
            onSelect: function (suggestion) {
                cityID = suggestion.data;
                id = cityID;
                jQuery("#countryId").val(cityID);
                $('input[name=countryId]').val(id);
                return false;
            },
            transformResult: function (response) {
                return {
                    suggestions: $.map($.parseJSON(response), function (item) {
                        return { value: item.countryName, data: item.destinationId };
                    })

                };
            }
        });

    </script>

</body>

</html>