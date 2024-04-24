<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>add user</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<style>
label{


}
.autocomplete-suggestions { border: 1px solid #999; background: red;overflow-y:auto}
		.autocomplete-suggestion {padding: 2px 5px;color:black; background: black;overflow-y: auto;overflow-y:auto}
		.autocomplete-selected { background: #F0F0F0;overflow-y:auto} 
		.autocomplete-suggestions strong { font-weight: normal; color:#FABA08;overflow-y:auto}
		.autocomplete-group { padding: 2px 5px;overflow-y:auto}
		.autocomplete-group strong { display: block; border-bottom: 1px solid #000;  background: black ; color:black overflow-y:auto}
		.autocomplete-selected:hover{
		color:black
		}
		 body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);
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
   
   <div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>
   
   
    <div class="AdminCreateNewUser container">
        <div class="AdminCreateNewUser_wrapper">
            <h1 class="page-heading" style="font-weight:600">Create Partner</h1>
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <form:form method="post" action="create_create_b2b_partner" modelAttribute="PARTNER_OBJ">
                <table>
                <tr>
                <th><label for="" style="font-weight:600">Partner Id</label></th><td> Auto Generated</td>
                <th><label for="" style="font-weight:600">Partner Short Name</label></th><td><form:input path="partnerShortName" maxlength="5" size="5" /></td>
                <th><label for="" style="font-weight:600">Brand Name</label></th><td><form:input path="partnerBrandName" maxlength="25" size="25" /> <br></td>
                </tr>
                <tr>
                <th><label for="" style="font-weight:600">Partner Name</label></th><td><form:input path="partnerName" maxlength="25" size="25" /> <br></td>
                
                </table>
              
            </form:form>
        </div>
    </div>
</body>

</html>