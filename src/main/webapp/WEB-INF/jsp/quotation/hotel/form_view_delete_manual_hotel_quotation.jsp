<!DOCTYPE html>
<html lang="en">
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

                <body>
                    <form:form modelAttribute="MANUAL_HTL" action="delete_delete_hotel_manual_quotation">
                        <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
                        <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
                        <input type="hidden" name="manualHotelQuotationId"
                            value="${MANUAL_HTL.manualHotelQuotationId}" />
                        <form:hidden path="optionNo" />
                        <div class="main_p container">
                            <div class="main_p_wrapper" style="margin-top:100px">
                                <h1 style="margin:10px 0;color:red">Id - ${MANUAL_HTL.manualHotelQuotationId}</h1>
                                <div class="main_p_wrapper_data">
                                    <div class="main_p_wrapper_data_line bc-clr">
                                        <div class="main_p_wrapper_dl ">
                                            <label for="" class="lb">City</label>
                                            <p>${MANUAL_HTL.cityName}</p>
                                        </div>
                                        <div class="main_p_wrapper_dl">
                                            <label for="" class="lb">Hotal Name</label>
                                            <p>${MANUAL_HTL.hotelName}</p>
                                        </div>
                                        <div class="main_p_wrapper_dl">
                                            <label for="" class="lb">Category</label>
                                            <p>${MANUAL_HTL.roomCategoryName}</p>
                                        </div>
                                        <div class="main_p_wrapper_dl">
                                            <label for="" class="lb">Meal Plan</label>
                                            <p>${MANUAL_HTL.mealPlanName}</p>
                                        </div>
                                    </div>

                                    <div class="main_p_wrapper_data_line bc-clr">
                                        <div class="main_p_wrapper_dl ">
                                            <label for="" class="lb">CheckIn Date</label>
                                            <p>
                                                <fmt:formatDate value="${MANUAL_HTL.checkInDate}"
                                                    pattern="dd-MM-yyyy" />
                                            </p>
                                        </div>
                                        <div class="main_p_wrapper_dl">
                                            <label for="" class="lb">CheckOut Date</label>
                                            <p>
                                                <fmt:formatDate value="${MANUAL_HTL.checkOutDate}"
                                                    pattern="dd-MM-yyyy" />
                                            </p>
                                        </div>


                                        <div class="main_p_wrapper_dl">
                                            <label for="" class="lb">Adults</label>
                                            <p>${MANUAL_HTL.adults}</p>
                                        </div>
                                        <div class="main_p_wrapper_dl">
                                            <label for="" class="lb">Children</label>
                                            <p>${MANUAL_HTL.children}</p>
                                        </div>
                                    </div>
                                    <div class="main_p_wrapper_data_line bc-clr">
                                        <div class="main_p_wrapper_dl ">
                                            <label for="" class="lb">Extra Bed</label>
                                            <p>${MANUAL_HTL.extrabed}</p>
                                        </div>

                                        <div class="main_p_wrapper_dl">
                                            <label for="" class="lb">Number of Rooms</label>
                                            <p>${MANUAL_HTL.noOfRooms}</p>
                                        </div>
                                        <div class="main_p_wrapper_dl">
                                            <label for="" class="lb">Total Cost</label>
                                            <p>${MANUAL_HTL.hotelStayCost}</p>
                                        </div>
                                        <div class="main_p_wrapper_dl">
                                            <label for="" class="lb">Total Markup</label>
                                            <p>${MANUAL_HTL.hotelStayMarkup}</p>
                                        </div>
                                    </div>
                                    <div class="main_p_wrapper_data_line bc-clr">
                                        <div class="main_p_wrapper_dl ">
                                            <label for="" class="lb">Display Order</label>
                                            <p>${MANUAL_HTL.displayOrder}</p>
                                        </div>
                                    </div>
                                    <div class="main_p_wrapper_data_line bc-clr">
                                        <div class="main_p_wrapper_dl_rem ">
                                            <label for="" class="lb">Remarks</label>
                                            <p>${hotelQtnObj.remarks}</p>
                                        </div>
                                    </div>
                                    <div class="due_today_task_data_btnss">
                                        <input type="submit" name="deleteHotel" id="deleteHotel"
                                            Value="Confirm Delete Stay" style="background-color:red;" />
                                        <a
                                            href="form_view_hotel_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}&hotelOptionNo=${QTN_OBJ.hotelOptionNo}"><input
                                                type="button"  value="Cancel" /></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form:form>

                    <script>
                        $('#cityName').autocomplete({
                            serviceUrl: '${pageContext.request.contextPath}/getCityList',
                            paramName: "cityName",
                            delimiter: ",",
                            onSelect: function (suggestion) {
                                cityID = suggestion.data;
                                id = cityID;
                                jQuery("#cityId").val(cityID);
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


                        $('#hotelName').autocomplete(
                            {
                                serviceUrl: "${pageContext.request.contextPath}/getCityHotelList",
                                minChars: 3,
                                paramName: "hotelName",
                                params: {
                                    cityId: function () {
                                        return $('#cityId').val()
                                    }
                                },
                                delimiter: ",",
                                onSelect: function (suggestion) {
                                    //$('#roomCategory').append(new Option(suggestion.value,suggestion.data));
                                    //populateRoomCategory(event, ui);
                                    $('#roomCategoryId').empty();
                                    $.each(suggestion.roomCat, function (key, value) {
                                        $('#roomCategoryId').append($("<option class='service-small'>").val(key).text(value));
                                        //$('#roomCategory').append(new Option(value,key));
                                    });
                                    hotelID = suggestion.data;
                                    id = hotelID;
                                    jQuery("#hotelId").val(hotelID);
                                    $('input[name=hotelName]').val(suggestion.value);
                                    //alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
                                    return false;
                                },
                                transformResult: function (response) {
                                    return {
                                        suggestions: $.map($.parseJSON(response),
                                            function (item) {
                                                /*for(var k in item.keyValueList) {
                                                    if(item[k] instanceof Object) {
                                                        $.each(item[k], function(key, value) {
                                                            alert(key);
                                                        });
                                                    } else {
                                                        alert('not object');
                                                    };
                                                }*/
                                                //alert(item.keyValueList);
                                                return {
                                                    value: item.tagName,
                                                    data: item.id,
                                                    roomCat: item.keyValueList
                                                };
                                            })

                                    };
                                }

                            });

                        $(document).ready(function () {
                            // Handler for .ready() called.

                            var nt = document.getElementById('newflightStop');
                            if (nt != null) {
                                $('html, body').animate({
                                    scrollTop: $('#newflightStop').offset().top
                                }, 'slow');

                            }

                        });

                    </script>
                </body>

</html>