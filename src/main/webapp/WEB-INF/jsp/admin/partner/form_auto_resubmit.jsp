<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Redirecting...</title>
</head>
<body>
    <form id="redirectForm" action="form_action_b2b_partner" method="post" modelAttribute="PARTNER_OBJ">
        <input type="hidden" name="View" value="View"/>
        <input type="hidden" name="partnerId" value="${PARTNER_OBJ.partnerId}"/>
        <input type="hidden" name="Success" value="${Success}"/>
    </form>
    <script type="text/javascript">
        document.getElementById("redirectForm").submit();
    </script>
</body>
</html>
