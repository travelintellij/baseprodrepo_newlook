<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lead Followup</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
</head>

<body
    style="background: url(${pageContext.request.contextPath}/resources/images/revamped/lead_follow_up_1.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
    <div class="follow-up">
        <div class="follow-up-wrapper container">
            <div class="follow-up-heading">
                <h1>Lead Followup</h1>
            </div>
            <div class="follow-up-main-form">
                <div class="follow-up-main-upper-part">
                    <div class="follow-up-sub-uppper-part">
                        <h3 class="follow-up-p" style="color: #FFBA08;;">
                            Sachin says
                        </h3>
                        <div class="follow-up-time">
                            <div class="follow-up-lead-action-time">
                                <label for="fulat">Lead Action Time</label>
                                <input type="text" id="fulat">
                            </div>
                            <div class="follow-up-next-action-time">
                                <label for="funat">Next Action Time</label>
                                <input type="text" id="funat">
                            </div>
                        </div>
                        <div class="follow-up-main-response">
                            <div class="fwaction-taken">
                                <p>Action Taken / Client Response</p>
                                <textarea name="" id="" cols="30" rows="2"></textarea>
                            </div>
                            <div class="fwnext-todo">
                                <p>Next To do</p>
                                <textarea name="" id="" cols="30" rows="2"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="follow-up-btn">
                    <a href="">Update Followup</a>
                </div>
            </div>
        </div>
    </div>
    <!-- ################## followup lead ################ -->

    <div class="follow-up-main-tabel container" style="margin-top:50px">
        <table>
            <tr>
                <th>User</th>
                <th>Lead Action Time</th>
                <th>Action Taken / Client Response</th>
                <th>Next Action Time</th>
                <th>Next To Do</th>
            </tr>
            <tr>
                <td>---</td>
                <td>----</td>
                <td>Page:</td>
                <td>----</td>
                <td>----</td>
            </tr>
        </table>
    </div>

    <div class="quick-lead-view">
        <div class="follow-up-icon">
        </div>
        <p class="qlv-text">Quick Lead View</p>
        <i class="fa-solid fa-bars fa-xl hamburgur-i-follow-up ham"></i>
        <input type="checkbox" name="" id="show-fu-cb" class="hamburgur-i-follow-up hamCh">
        <!-- ############ hidden ############ -->
        <div class="inside-quick-lead-view container">
            <!-- <i><i class="fa-solid fa-xmark fa-2xl follw-up-cross"></i></i>
            <input class= "iqvl-cross" type="checkbox" style="position: absolute;top: 11px;left: 13px;;width: 20px;height: 20px;"> -->


            <input type="checkbox" id="show-fu-cb" class="hamburgur-i-follow-up hamCh">
            <label for="show-fu-cb" class="iqvl-cross">
                <i class="fa-solid fa-xmark fa-2xl follw-up-cross"></i>
            </label>



            <h1 style="margin-bottom: 5px;">Lead Details</h1>
            <div class="follow-up-data">
                <div class="follow-up-fl">
                    <div class="follow-up-d1-l1 fu-box">
                        <label for="">Lead id</label>
                        <p>Q-0778-HCF</p>
                    </div>
                    <div class="follow-up-d2-l1 fu-box">
                        <label for="">Client</label>
                        <p>Hitesh Kumar</p>
                    </div>
                    <div class="follow-up-d3-l1 fu-box">
                        <label for="">Source</label>
                        <p>Delhi</p>
                    </div>
                    <div class="follow-up-d4-l1 fu-box">
                        <label for="">Destination</label>
                        <p>Kathmandu</p>
                    </div>
                    <div class="follow-up-d5-l1 fu-box">
                        <label for="">Adults</label>
                        <p>4</p>
                    </div>
                </div>
                <div class="follow-up-f2">
                    <div class="follow-up-d1-l2 fu-box">
                        <label for="">Children</label>
                        <p>0(Age)</p>
                    </div>
                    <div class="follow-up-d2-l2 fu-box">
                        <label for="">Travel s date</label>
                        <p>07-09-2023</p>
                    </div>
                    <div class="follow-up-d3-l2 fu-box">
                        <label for="">Travel e date</label>
                        <p>10-09-2023</p>
                    </div>
                    <div class="follow-up-d4-l2 fu-box">
                        <label for="">Lead Source</label>
                        <p>Holidays Guide</p>
                    </div>
                    <div class="follow-up-d5-l2 fu-box">
                        <label for="">Status</label>
                        <p>Open</p>
                    </div>
                </div>
                <div class="follow-up-f3">
                    <h2>Services Requested</h2>
                    <div class="follow-up-reqs">
                        <div class="follow-up-c1">
                            <label for="">Package</label>
                            <input type="checkbox" name="" id="">
                        </div>
                        <div class="follow-up-c1">
                            <label for="">Flight</label>
                            <input type="checkbox" name="" id="">
                        </div>
                        <div class="follow-up-c1">
                            <label for="">Hotal</label>
                            <input type="checkbox" name="" id="">
                        </div>
                        <div class="follow-up-c1">
                            <label for="">Transfers</label>
                            <input type="checkbox" name="" id="">
                        </div>
                        <div class="follow-up-c1">
                            <label for="">Sightseeing</label>
                            <input type="checkbox" name="" id="">
                        </div>
                        <div class="follow-up-c1">
                            <label for="">Visa</label>
                            <input type="checkbox" name="" id="">
                        </div>
                        <div class="follow-up-c1">
                            <label for="">Insurence</label>
                            <input type="checkbox" name="" id="">
                        </div>
                        <div class="follow-up-c1">
                            <label for="">cruise</label>
                            <input type="checkbox" name="" id="">
                        </div>
                        <div class="follow-up-c1">
                            <label for="">others</label>
                            <input type="checkbox" name="" id="">
                        </div>
                    </div>
                </div>
                <div class="follow-ups-remarks-qv">
                    <h3>Remarks</h3>
                </div>
            </div>
        </div>
    </div>

</body>

</html>