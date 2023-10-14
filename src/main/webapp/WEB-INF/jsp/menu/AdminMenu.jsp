<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="index.js" defer></script>
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body>
    <header>
        <div class="navbar container">
            <div class="topHeader">
                <div class="leftSec" href="${pageContext.request.contextPath}/AdminHome">
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
                    <ul class="topHeaderLinks">
                        <li>
                            <a href="${pageContext.request.contextPath}/AdminHome" class="homeLink">
                                <p>Home</p>
                            </a>
                        </li>
                        <li class="tophHeaderMainLink Mql2">
                            <p>Employee Section</p>
                            <ul class="topHeaderSubMenu">
                                <li><a href="${pageContext.request.contextPath}/createNewUser"
                                        class="hoverOnLink linkPaddingBottom">Add
                                        User</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/view_search_admin_user"
                                        class="hoverOnLink">Vw /
                                        Mod / Del</a></li>
                                <li><a href="${pageContext.request.contextPath}/adminIncentiveReport"
                                        class="hoverOnLink">Incentive
                                        Reports</a></li>
                            </ul>
                        </li>
                        <li class="tophHeaderMainLink">
                            <p>Client Section</p>
                            <ul class="topHeaderSubMenu">
                                <li><a href="${pageContext.request.contextPath}/view_form_admin_new_client"
                                        class="hoverOnLink">Add New
                                        Client</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/view_form_admin_search_client"
                                        class="hoverOnLink">Vw /
                                        Mod / Del</a></li>
                            </ul>
                        </li>
                        <li class="tophHeaderMainLink">
                            <p>Supplier Section</p>
                            <ul class="topHeaderSubMenu">
                                <li><a href="${pageContext.request.contextPath}/view_form_admin_new_supplier"
                                        class="hoverOnLink">Add
                                        New Supplier</a></li>
                                <li><a href="${pageContext.request.contextPath}/view_form_admin_search_supplier"
                                        class="hoverOnLink">Vw /
                                        Mod / Del</a></li>
                            </ul>
                        </li>
                        <li class="tophHeaderMainLink">
                            <p>Hotel Section</p>
                            <ul class="topHeaderSubMenu">
                                <li><a href="view_add_hotel_chain_form" class="hoverOnLink">Add Hotel Chain</a>
                                </li>
                                <li><a href="view_search_hotel_chain_form" class="hoverOnLink">Manage H.Chain</a>
                                </li>
                                <li><a href="view_add_hotel_form" class="hoverOnLink">Add Hotel</a></li>
                                <li><a href="view_search_hotel_form" class="hoverOnLink">Manage Hotels</a></li>
                            </ul>
                        </li>
                        <li class="tophHeaderMainLink">
                            <p>Sight Seeing Section</p>
                            <ul class="topHeaderSubMenu">
                                <li><a href="view_add_sightseeing_form" class="hoverOnLink">Add Sight Seeing</a>
                                </li>
                                <li><a href="view_search_sight_seeing_form" class="hoverOnLink">Vw /
                                        Mod / Del</a></li>
                            </ul>
                        </li>
                        <li class="tophHeaderMainLink">
                            <p>Visa Section</p>
                            <ul class="topHeaderSubMenu">
                                <li><a href="view_add_visa_form" class="hoverOnLink">Add Visa Master</a>
                                </li>
                                <li><a href="view_search_visa_form" class="hoverOnLink">Vw / Mod Visa</a></li>
                                <li><a href="view_add_visa_consulate_form" class="hoverOnLink">Add V.Consulate</a>
                                </li>
                                <li><a href="view_search_visa_consulate_form" class="hoverOnLink">Vw / Mod V.Con</a>
                                </li>
                            </ul>
                        </li>
                        <li class="tophHeaderMainLink">
                            <p class="lastOp">Others</p>
                            <ul class="topHeaderSubMenu">
                                <li><a href="view_add_city_form" class="hoverOnLink">Add City</a>
                                </li>
                                <li><a href="view_search_city_form" class="hoverOnLink">Vw /
                                        Mod / Del</a></li>
                                <li><a href="view_manage_multiple_status" class="hoverOnLink">Status Mgmt</a></li>
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

                <!-- client section -->
                <li class="bottomHeaderLinks">
                    <p>Lead Management</p>
                    <ul class="bottomSectionHeaderSubMenu">
                        <li><a href="form_register_newlead" class="hoverOnLink">New Lead</a></li>
                        <li><a href="view_filter_leads" class="hoverOnLink">Manage Leads</a></li>
                    </ul>
                </li>


                <li class="bottomHeaderLinks">
                    <p>Incentive</p>
                    <ul class="bottomSectionHeaderSubMenu">
                        <li><a href="newincentive" class="hoverOnLink">New IncClaim</a></li>
                        <li><a href="view_default_incentives_report" class="hoverOnLink">IncClaim Rpts</a>
                        </li>
                    </ul>
                </li>


                <li class="bottomHeaderLinks">
                    <p>My-Deals</p>
                    <ul class="bottomSectionHeaderSubMenu">
                        <li><a href="view_workload_createNewDealForm" class="hoverOnLink">New Win</a></li>
                        <li><a href="view_deal_searchDealForm" class="hoverOnLink">Search Deal</a></li>
                    </ul>
                </li>

                <li class="bottomHeaderLinks">
                    <p>My-Tasks</p>
                    <ul class="bottomSectionHeaderSubMenu">
                        <li><a href="view_create_task_form_user" class="hoverOnLink">New Task</a></li>
                        <li><a href="view_open_task_form_user" class="hoverOnLink">View Tasks</a></li>
                    </ul>
                </li>

                <li class="bottomHeaderLinks">
                    <p>My-Tickets</p>
                    <ul class="bottomSectionHeaderSubMenu">
                        <li><a href="view_create_ticket_form_user" class="hoverOnLink">New Ticket</a></li>
                        <li><a href="view_open_ticket_form_user" class="hoverOnLink">View Ticket</a></li>
                    </ul>
                </li>


                <li class="bottomHeaderLinks">
                    <p>Service Line Queue</p>
                    <ul class="bottomSectionHeaderSubMenu">
                        <li><a href="get_flight_service_line_queue_user" class="hoverOnLink">Flight</a></li>
                        <li><a href="get_hotel_service_line_queue_user" class="hoverOnLink">Hotel</a></li>
                        <li><a href="get_insurance_service_line_queue_user" class="hoverOnLink">Insurance</a></li>
                        <li><a href="get_landpackage_service_line_queue_user" class="hoverOnLink">LandPackage</a></li>
                        <li><a href="get_other_service_line_queue_user" class="hoverOnLink">Others</a></li>
                        <li><a href="get_sightseeing_service_line_queue_user" class="hoverOnLink">SightSeeing</a></li>
                        <li><a href="get_transfers_service_line_queue_user" class="hoverOnLink">Transfers</a></li>
                        <li><a href="get_visa_service_line_queue_user" class="hoverOnLink">Visa</a></li>
                    </ul>
                </li>
                <li><a href="${pageContext.request.contextPath}/logout" class="adminSignOut">Sign Out</a></li>
                <a class="settingIcon" href="view_form_my_profile">
                    <i class="fa-solid fa-gear fa-2xl" id="gear-icon"></i>
                </a>
            </ul>
        </div>
    </div>

    <!-- ########################## home page styling ###################### -->


   


</body>

</html>