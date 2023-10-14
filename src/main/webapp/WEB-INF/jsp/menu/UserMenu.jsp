<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="index.js" defer></script>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/homePageUserMenuCss.css">
</head>
<body>
    <header>
        <div class="navbar container">
            <div class="topHeader">
                <div class="leftSec">
                    <img src="${pageContext.request.contextPath}/resources/images/revamped/Header_Logo.png" alt="">
                </div>
                <div class="rightSec">
                    <!-- ###### start of hamburgur menu#### -->
                    <input type="checkbox" class="headerCheckbox">
                    <div class="hamburgurLines">
                        <span class="line line1"></span>
                        <span class="line line2"></span>
                        <span class="line line3"></span>
                    </div>
                    <!-- ###### end of hamburgur menu#### -->
                    <ul class="topHeaderLinks ">
                        <li>
                            <a href="view_workloadhome" class="homeLink">
                                <p class="homeLinkTopMenu">Home</p>
                            </a>
                        </li>
                        <li class="tophHeaderMainLink Mql2">
                            <p>Lead Managment</p>
                            <ul class="topHeaderSubMenu">
                                <li><a href="form_register_newlead" class="hoverOnLink linkPaddingBottom">New Lead</a>
                                </li>
                                <li><a href="view_filter_leads" class="hoverOnLink">Manage Leads</a></li>
                            </ul>
                        </li>
                        <li class="tophHeaderMainLink">
                            <p>My Deals</p>
                            <ul class="topHeaderSubMenu">
                                <li><a href="view_workload_createNewDealForm" class="hoverOnLink">New Win</a>
                                </li>
                                <li><a href="view_deal_searchDealForm" class="hoverOnLink">Search Deals</a></li>
                            </ul>
                        </li>
                        <li class="tophHeaderMainLink">
                            <p>My Tasks</p>
                            <ul class="topHeaderSubMenu">
                                <li><a href="view_create_task_form_user" class="hoverOnLink">New Tasks</a></li>
                                <li><a href="view_open_task_form_user" class="hoverOnLink">View Tasks</a></li>
                            </ul>
                        </li>
                        <li class="tophHeaderMainLink">
                            <p>My Tickets</p>
                            <ul class="topHeaderSubMenu">
                                <li><a href="view_create_ticket_form_user" class="hoverOnLink">New Tickets</a>
                                </li>
                                <li><a href="view_open_ticket_form_user" class="hoverOnLink">View Tickets</a></li>
                            </ul>
                        </li>
                        <li class="tophHeaderMainLink Mql6">
                            <p>Service Line Queue</p>
                            <ul class="topHeaderSubMenu">
                                <li><a href="get_flight_service_line_queue_user" class="hoverOnLink">Flight</a></li>
                                <li><a href="get_hotel_service_line_queue_user" class="hoverOnLink">Hotal</a></li>
                                <li><a href="get_insurance_service_line_queue_user" class="hoverOnLink">Insurence</a>
                                </li>
                                <li><a href="get_landpackage_service_line_queue_user"
                                        class="hoverOnLink">LandPackage</a></li>
                                <li><a href="get_other_service_line_queue_user" class="hoverOnLink">Others</a></li>
                                <li><a href="get_sightseeing_service_line_queue_user"
                                        class="hoverOnLink">SightSeeing</a></li>
                                <li><a href="get_transfers_service_line_queue_user" class="hoverOnLink">Transfers</a>
                                </li>
                                <li><a href="get_visa_service_line_queue_user" class="hoverOnLink">Visa</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </header>

    <!-- Extra privilege role starts from here. -->

    <!-- ############### bottom top header ############### -->
    <div class="bottomHeader">
        <div class="insideBottomHeader container">
            <ul class="bottomSectionHeader">
                <!-- empolyee section -->
                <sec:authorize
                    access="hasAnyRole('USER_VIEW','USER_CREATE','USER_EDIT','USER_DELETE','MANAGE_INCENTIVE')">
                    <li class="bottomHeaderLinks">
                        <p>Employee Section</p>
                        <ul class="bottomSectionHeaderSubMenu">
                            <sec:authorize access="hasRole('USER_CREATE')">
                                <li><a href="${pageContext.request.contextPath}/createNewUser" class="hoverOnLink">Add
                                        User</a></li>
                            </sec:authorize>
                            <sec:authorize access="hasAnyRole('USER_VIEW','USER_CREATE','USER_EDIT','USER_DELETE')">
                                <li><a href="${pageContext.request.contextPath}/view_search_admin_user"
                                        class="hoverOnLink">Vw / Mod /
                                        Del</a></li>
                            </sec:authorize>
                            <sec:authorize access="hasRole('MANAGE_INCENTIVE')">
                                <li><a href="${pageContext.request.contextPath}/adminIncentiveReport"
                                        class="hoverOnLink">Incen Rpts</a></li>
                            </sec:authorize>
                        </ul>
                    </li>
                </sec:authorize>

                <!-- client section -->
                <sec:authorize access="hasAnyRole('CLIENT_VIEW','CLIENT_CREATE','CLIENT_EDIT','CLIENT_DELETE')">
                    <li class="bottomHeaderLinks">
                        <p>Client Section</p>
                        <ul class="bottomSectionHeaderSubMenu">
                            <sec:authorize access="hasRole('ROLE_CLIENT_CREATE')">
                                <li><a href="view_form_admin_new_client" class="hoverOnLink">Add N.Client</a></li>
                            </sec:authorize>
                            <li><a href="view_form_admin_search_client" class="hoverOnLink">Mng N.Client</a></li>
                        </ul>
                    </li>
                </sec:authorize>

                <sec:authorize access="hasAnyRole('SUPPLIER_VIEW','SUPPLIER_CREATE','SUPPLIER_EDIT','SUPPLIER_DELETE')">
                    <li class="bottomHeaderLinks">
                        <p>Supplier Section</p>
                        <ul class="bottomSectionHeaderSubMenu">
                            <sec:authorize access="hasRole('ROLE_SUPPLIER_CREATE')">
                                <li><a href="view_form_admin_new_supplier" class="hoverOnLink">Add N.Supp</a></li>
                            </sec:authorize>
                            <li><a href="view_form_admin_search_supplier" class="hoverOnLink">Vw / Mod / Del</a>
                            </li>
                        </ul>
                    </li>
                </sec:authorize>

                <sec:authorize
                    access="hasAnyRole('HOTEL_CHAIN_VIEW','HOTEL_CHAIN_CREATE','HOTEL_CHAIN_EDIT','HOTEL_CHAIN_DELETE','HOTEL_CREATE','HOTEL_VIEW','HOTEL_EDIT','HOTEL_DEL','ROOM_CAT_MANAGE')">
                    <li class="bottomHeaderLinks">
                        <p>Hotal Section</p>
                        <ul class="bottomSectionHeaderSubMenu">
                            <sec:authorize access="hasRole('HOTEL_CHAIN_CREATE')">
                                <li><a href="view_add_hotel_chain_form" class="hoverOnLink">Add H.Chain</a></li>
                            </sec:authorize>
                            <li><a href="view_search_hotel_chain_form" class="hoverOnLink">Mng H.Chain</a></li>
                            <sec:authorize access="hasRole('HOTEL_CREATE')">
                                <li><a href="view_add_hotel_form" class="hoverOnLink">Add Hotal</a></li>
                            </sec:authorize>
                            <sec:authorize
                                access="hasAnyRole('HOTEL_CREATE','HOTEL_VIEW','HOTEL_EDIT','HOTEL_DEL','ROOM_CAT_MANAGE')">
                                <li><a href="view_search_hotel_form" class="hoverOnLink">Mng Hotals</a></li>
                            </sec:authorize>
                        </ul>
                    </li>
                </sec:authorize>

                <sec:authorize
                    access="hasAnyRole('SIGHT_SEEING_VIEW','SIGHT_SEEING_CREATE','SIGHT_SEEING_EDIT','SIGHT_SEEING_DELETE')">
                    <li class="bottomHeaderLinks">
                        <p>Sight Seeing Section</p>
                        <ul class="bottomSectionHeaderSubMenu">
                            <sec:authorize access="hasRole('SIGHT_SEEING_CREATE')">
                                <li><a href="view_add_sightseeing_form" class="hoverOnLink">Add S.Seeing</a></li>
                            </sec:authorize>
                            <li><a href="view_search_sight_seeing_form" class="hoverOnLink">Mng S.Seeing</a></li>
                        </ul>
                    </li>
                </sec:authorize>

                <sec:authorize access="hasAnyRole('VISA_VIEW','VISA_CREATE','VISA_EDIT','VISA_DELETE')">
                    <li class="bottomHeaderLinks">
                        <p>Visa Section</p>
                        <ul class="bottomSectionHeaderSubMenu">
                            <sec:authorize access="hasRole('VISA_CREATE')">
                                <li><a href="view_add_visa_form" class="hoverOnLink">Add Visa</a></li>
                            </sec:authorize>
                            <li><a href="view_search_visa_form" class="hoverOnLink">Mng Visa</a></li>
                        </ul>
                    </li>
                </sec:authorize>

                <sec:authorize access="hasAnyRole('INCENTIVE_CAN_CLAIM','INCENTIVE_CAN_APPROVE')">
                    <li class="bottomHeaderLinks">
                        <p>Incentive</p>
                        <ul class="bottomSectionHeaderSubMenu">
                            <sec:authorize access="hasRole('INCENTIVE_CAN_CLAIM')">
                                <li><a href="newincentive" class="hoverOnLink">New IncClaim</a>
                            </sec:authorize>
                    </li>
                    <li><a href="view_default_incentives_report" class="hoverOnLink">Incen Rpts</a></li>
            </ul>
            </li>
            </sec:authorize>

            <li><a href="${pageContext.request.contextPath}/logout" class="signOut">Sign out</a></li>
            </ul>
        </div>
    </div>

    <!-- ########################## home page styling ###################### -->


 




</html>