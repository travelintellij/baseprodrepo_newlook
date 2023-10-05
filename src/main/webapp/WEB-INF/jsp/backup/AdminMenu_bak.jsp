<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	
	<title>UdanChoo Team Workload Section</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="${pageContext.request.contextPath}/resources/css/tooplate_style.css" rel="stylesheet" type="text/css" />
	
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery.scrollTo-1.3.3.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.localscroll-1.2.5.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.serialScroll-1.2.1.js" type="text/javascript" charset="utf-8"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js" type="text/javascript" charset="utf-8"></script>


</head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css" media="screen">
    <style>
 	 h1 { color: #d54d7b; font-family: "Great Vibes", cursive; font-size: 25px; line-height: 0px; font-weight: heavy; margin-bottom: 20px; margin-top: 30px; text-align: center; text-shadow: 0 50px 50px #fff; }
 	 
 	  body, div, form, input, p { 
      padding: 0;
      margin: 0;
      outline: none;
      font-family: Roboto, Arial, sans-serif;
      font-size: 14px;
      color: #666;
      }
      .main-block {
      max-width: 750px; 
      min-height: 560px; 
      padding: 10px 0;
      margin: auto;
      border-radius: 5px; 
      border: solid 1px #ccc;
      box-shadow: 1fpx 2px 5px rgba(0,0,0,.31); 
      background: #ebebeb; 
      }
       .submenu-block {
      max-width: 1150px; 
      min-height: 260px; 
      padding: 10px 0;
      margin: auto;
      border-radius: 5px; 
      border: solid 1px #ccc;
      box-shadow: 1fpx 2px 5px rgba(0,0,0,.31); 
      background: #ebebeb; 
      }
      form {
      margin: 0 30px;
      }
       .account-type, .gender {
      margin: 10px 0;
      }
      input[type=radio] {
      display: none;
      }
      
      label#icon {
      margin: 0;
      border-radius: 5px 0 0 5px;
      }
     
      label.radio {
      position: relative;
      display: inline-block;
      padding-top: 4px;
      margin-right: 20px;
      text-indent: 30px;
      overflow: visible;
      cursor: pointer;
      }
      
      label.radio:before {
      content: "";
      position: absolute;
      top: 2px;
      left: 0;
      width: 20px;
      height: 20px;
      border-radius: 50%;
      background: #1c87c9;
      }
     
      label.radio:after {
      content: "";
      position: absolute;
      width: 9px;
      height: 4px;
      top: 8px;
      left: 4px;
      border: 3px solid #fff;
      border-top: none;
      border-right: none;
      transform: rotate(-45deg);
      opacity: 0;
      }
      input[type=radio]:checked + label:after {
      opacity: 1;
      }
      input[type=text], input[type=password] {
      width: calc(100% - 57px);
      height: 36px;
      margin: 13px 0 0 -5px;
      padding-left: 10px; 
      border-radius: 0 5px 5px 0;
      border: solid 1px #cbc9c9; 
      box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
      background: #fff; 
      }
      input[type=password] {
      margin-bottom: 15px;
      }
      #icon {
      display: inline-block;
      padding: 9.3px 15px;
      box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
      background: #1c87c9;
      color: #fff;
      text-align: center;
      }
      .btn-block {
      margin-top: 10px;
      text-align: center;
      }
      button {
      width: 100%;
      padding: 10px 0;
      margin: 10px auto;
      border-radius: 5px; 
      border: none;
      background: #1c87c9; 
      font-size: 14px;
      font-weight: 600;
      color: #fff;
      }
  
      button:hover {
      background: #26a9e0;
      }
 	 
 	 
 	 /* Customize the label (the container) */
.container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 15px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 22px;
  width: 25px;
  background-color: #808080;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}
 	 
 select { 
                appearance: none; 
                outline: 0; 
                background: lightblue; 
                background-image: none; 
                width: 100%; 
                height: 100%; 
                color: black; 
                cursor: pointer; 
                border:1px solid black; 
                border-radius:3px; 
                  text-indent: 2px;
            } 
            .select { 
                position: relative; 
                display: block; 
                width: 15em; 
                height: 2.5em; 
                line-height: 3; 
                overflow: hidden; 
                border-radius: .25em; 
                padding-bottom:10px; 
               padding-top: 10px;
                  
            } 
     		.select option.service-small {
		    font-size: 20px;
		    padding: 25px;
		    background: lightgreen;
		}
    </style>
    <h1>UdanChoo.com Intranet</h1></font>

    <ul id="nav">
        <li class="current"><a href="AdminHome">Home</a></li>
        <li><a href="http://www.script-tutorials.com/">Incentive Report</a></li>
        <li><a href="http://www.script-tutorials.com/">Client Section</a>
            <ul>
                <li><a href="newclient">Add New Client</a></li>
                <li><a href="adminSearchClient">View Client Details</a>
                   <!--  <ul>
                        <li><a href="http://www.script-tutorials.com/category/jquery/">jQuery</a></li>
                        <li><a href="http://www.script-tutorials.com/category/javascript/">JS</a></li>
                    </ul>
                     -->
                </li>
                <li><a href="adminSearchEditClient">Edit Client Details</a></li>
                <li><a href="adminSearchDeleteClient">Delete Client</a></li>
            </ul>
        </li>
        
       <li><a href="http://www.script-tutorials.com/category/resources/">Hotels Section</a>
            <ul>
                <li><a #">Hotel Chain</a>
                    <ul>
                        <li><a href="view_add_hotel_chain_form">Add Hotel Chain</a></li>
                        <li><a href="view_search_hotel_chain_form">View / Modify / Delete</a></li>
                    </ul>
                </li>
                <li><a href="#">Hotels</a>
                    <ul>
                        <li><a href="view_add_hotel_form">Add Hotel</a></li>
                        <li><a href="view_search_hotel_form">View / Modify / Delete</a></li>
                    </ul>
                </li>
            </ul>
        </li>
       <li><a href="#">Sight Seeing Section</a>
            <ul>
                <li><a href="view_add_sightseeing_form">Add Sight Seeing</a></li>
                <li><a href=view_search_sight_seeing_form>View / Modify / Delete</a></li>
            </ul>
        </li>
           <li><a href="#">Visa Section</a>
            <ul>
                <li><a href="view_add_visa_form">Add Visa Master</a></li>
                <li><a href="view_search_visa_form">View / Modify </a></li>
            </ul>
        </li>
       
        <li><a href="http://www.script-tutorials.com/category/resources/">Supplier Section</a>
            <ul>
                <li><a href="http://www.script-tutorials.com/category/resources/">Add Supplier</a>
                    <ul>
                        <li><a href="http://www.script-tutorials.com/category/php/">PHP</a></li>
                        <li><a href="http://www.script-tutorials.com/category/mysql/">MySQL</a></li>
                        <li><a href="http://www.script-tutorials.com/category/xslt/">XSLT</a></li>
                        <li><a href="http://www.script-tutorials.com/category/ajax/">Ajax</a></li>
                    </ul>
                </li>
                <li><a href="http://www.script-tutorials.com/category/resources/">By tag name</a>
                    <ul>
                        <li><a href="http://www.script-tutorials.com/tag/captcha/">captcha</a></li>
                        <li><a href="http://www.script-tutorials.com/tag/gallery/">gallery</a></li>
                        <li><a href="http://www.script-tutorials.com/tag/animation/">animation</a></li>
                    </ul>
                </li>
            </ul>
        </li>
        <li><a href="${pageContext.request.contextPath}/welcome">Go Back To Main Home</a></li>
        <li><a href="${pageContext.request.contextPath}/logout">Sign Out</a></li>
    </ul>
	