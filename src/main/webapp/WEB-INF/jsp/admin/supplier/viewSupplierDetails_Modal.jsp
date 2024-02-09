
<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>View Supplier Details</title>
       <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
            </head>

            <body>
                <div class="view_supplier_details container">
                    <div class="view_supplier_details_wrapper" style=";z-index:9;margin-top:25px;background:#94d2bd;box-shadow: 0 0 10px 5px #94d2bd, 0 0 20px 10px #94d2bd">
                    <h1 style="text-align:center;font-size:30px;margin-bottom:10px;color:black">Supplier Details </h1>
                        <div align="center"><b>
                                <font color="green"> ${Success} </font>
                                <font color="red"> ${Error}</font>
                            </b></div>
                        <form:form method="post" action="form_view_editsupplier" modelAttribute="SUPPLIER_OBJ">
                            <form:hidden path="supplierId" />
                            <form:hidden path="destinationNames" />
                            <form:hidden path="operatingDestinations" />
                            <div class="view_supplier_details_data">
                                <div class="view_supplier_details_modal_data_line1 vsdm_d1" style="margin-bottom:10px;background:#d8e2dc">
                                    <div class="view_supplier_details_l1">
                                        <label for="" style="color:Black;font-weight:bolder">Supplier Id</label>
                                        <p>${SUPPLIER_OBJ.supplierId}</p>
                                    </div>
                                    <div class="view_supplier_details_l1">
                                        <label for="" style="color:black;font-weight:bold">Supplier Name</label>
                                        <p>${SUPPLIER_OBJ.supplierName}</p>
                                    </div>
                                    <div class="view_supplier_details_l1">
                                        <label for="" style="color:black;font-weight:bold">City</label>
                                        <p>${SUPPLIER_OBJ.cityName}</p>
                                    </div>
                                    <div class="view_supplier_details_l1">
                                        <label for="" style="color:black;font-weight:bold">Country</label>
                                        <p>${SUPPLIER_OBJ.countryName}</p>
                                    </div>
                                    <div class="view_supplier_details_l1">
                                        <label for="" style="color:black;font-weight:bold">Mobile</label>
                                        <p>${SUPPLIER_OBJ.mobile}</p>
                                    </div>
                                </div>
                                <div class="view_supplier_details_modal_data_line2 vsdm_d2"  style="margin-bottom:10px;background:#d8e2dc">
                                    <div class="view_supplier_details_l1">
                                        <label for="" style="color:black;font-weight:bold">Referred By</label>
                                        <p>${SUPPLIER_OBJ.referredBy}</p>
                                    </div>    
                                    <div class="view_supplier_details_l1">
                                        <label for="" style="color:black;font-weight:bold">Phone</label>
                                        <p>${SUPPLIER_OBJ.phone}</p>
                                    </div>
                                    <div class="view_supplier_details_l1">
                                        <label for="" style="color:black;font-weight:bold">Company Details</label>
                                        <p>
                                        ${SUPPLIER_OBJ.companyDetails}
                                        </p>
                                    </div>
                                     <div class="view_supplier_details_l1">
                                        <label for="" style="color:black;font-weight:bold">GST Details</label>
                                        <p>${SUPPLIER_OBJ.gstDetails}</p>
                                    </div>
                                </div>
                                
                                <div class="view_supplier_details_modal_data_line3"  style="margin-bottom:10px;background:#d8e2dc">
                                 <div class="view_supplier_details_l1">
                                        <label for="" style="color:black;font-weight:bold">Email</label>
                                        <p>${SUPPLIER_OBJ.email}</p>
                                    </div>
                                    
                                     <div class="view_supplier_details_l1">
                                        <label for="" style="color:black;font-weight:bold">Company Details</label>
                                        <p>
                                       ${SUPPLIER_OBJ.companyDetails}
                                        </p>
                                    </div>
                                </div>
                                <div class="view_supplier_details_modal_data_line1"  style="margin-bottom:10px;background:#d8e2dc">
                                    <div class="view_supplier_details_l1">
                                        <label for="" style="color:black;font-weight:bold">Address</label>
                                        <p style="color:black">
                                       ${SUPPLIER_OBJ.address}
                                        </p>
                                    </div>
                                    <div class="view_supplier_details_l1">
                                        <label for="" style="color:black;font-weight:bold">Bank Details</label>
                                        <p>
                                        ${SUPPLIER_OBJ.bankDetails}
                                        </p>
                                    </div>
                                    <div class="view_supplier_details_l1">
                                        <label for="" style="color:black;font-weight:bold">Remarks</label>
                                        <p>
                                        ${SUPPLIER_OBJ.remarks}
                                        </p>
                                    </div>
                                </div>
                             
                                <div class="view_supplier_details_data_line3"  style="margin-bottom:10px;background:#d8e2dc">
                                    <h3 class="vsd_des" style="color:black;font-weight:bold">Following Destinations are supported</h3>
                                    <div class="view_supplier_details_data_line3_destination_supported">
                                        <c:forEach items="${SUPPLIER_OBJ.destinations}" var="destination">
                                           <p style="display:inline-block"> ${destination.cityName}, </p>
                                        </c:forEach>
                                    </div>
                                </div>
                             
                                <div class="view_supplier_details_data_line4"  style="margin-bottom:10px;background:#d8e2dc">
                                    <div class="view_supplier_details_data_line3_service_offered" style="color:black">
                                       <h1 style="color:black;font-weight:bold"> Service Offerred</h1>
                                                Flight <form:checkbox class="ch_c" path="flight" disabled="true"  style="margin-right:10px"/><span
                                                            class="checkmark"></span>
                                                    
                                                Hotel<form:checkbox class="ch_c" path="hotel" disabled="true" style="margin-right:10px;margin-left:5px" /><span
                                                            class="checkmark"></span>
                                                 
                                                Transfers<form:checkbox class="ch_c" path="transfers" disabled="true" style="margin-right:10px;margin-left:5px"/><span
                                                            class="checkmark"></span>
                                                
       
                                           SightSeeing<form:checkbox class="ch_c" path="sightseeing" disabled="true" style="margin-right:10px;margin-left:5px"/><span
                                                            class="checkmark"></span>
                                                    
                                               Visa<form:checkbox class="ch_c" path="visa" disabled="true" style="margin-right:10px;margin-left:5px"/><span
                                                            class="checkmark"></span>
                                                   
                                               Insurance<form:checkbox class="ch_c" path="insurance" disabled="true" style="margin-right:10px;margin-left:5px"/><span
                                                            class="checkmark"></span>
                                                    
                                           Package<form:checkbox class="ch_c" path="landPackage" disabled="true" style="margin-right:10px;margin-left:5px"/><span
                                                            class="checkmark"></span>
                                                  
                                                Cruise<form:checkbox class="ch_c" path="cruise" disabled="true" style="margin-right:10px;margin-left:5px"/><span
                                                            class="checkmark"></span>
                                              
                                          Others <form:checkbox class="ch_c" path="others" disabled="true" style="margin-right:10px;margin-left:5px"/><span
                                                            class="checkmark"></span>
                                                    
                                           
                                    </div>
                                </div>
                               
                               
                                
                                <div class="view_supplier_details_modal_data_line_con"  style="margin-bottom:10px;background:#d8e2dc">
                                 <div class="view_supplier_details_data_line">
                                    <h3 class="vsd_consoli" style="color:black;font-weight:bold">consolidater</h3>
                                    <div class="view_supplier_details_data_line3_consoli">
                                        <form:checkbox path="consolidator" disabled="true" />
                                    </div>
                                </div>
                                <div class="view_supplier_details_data_line">
                                    <h3 class="vsd_sp" style="color:black;font-weight:bold">Supplier Prefrences</h3>
                                    <div class="view_supplier_details_data_line3_supp_pre">
                                        <p>${SUPPLIER_OBJ.supplierRating} Star
                                            (Scale 1 to 5)</p>
                                    </div>
                                </div>
                                <div class="view_supplier_details_data_line">
                                    <h3 class="vsd_sp" style="color:black;font-weight:bold">Negotiates</h3>
                                    <div class="view_supplier_details_data_line3_supp_pre">
                                        <p>${SUPPLIER_OBJ.negotiates}</p>
                                    </div>
                                </div>
                                </div>
                               
                                <div class="due_today_task_data_btns VSD_MODAL_BTNS" style="display: flex;justify-content: center;">
                                    <input type="submit" value="Edit Supplier" style="background:#cbf3f0">
                                    <a href="view_supplier_contacts_listing?supplierId=${SUPPLIER_OBJ.supplierId}" style="background:#cbf3f0">Contacts Listing</a>
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