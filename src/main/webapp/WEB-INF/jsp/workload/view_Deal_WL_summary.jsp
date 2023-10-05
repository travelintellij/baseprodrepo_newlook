<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
body {
  background: steelblue;
  font-family: "Open Sans", arial;
}
table {
  width: 80%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
}

th {
  background: steelblue;
  height: 40px;
  width: 10%;
  font-weight: lighter;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
}
tr {
  border-bottom: 1px solid #cccccc;
}

td {
  border-right: 1px solid #cccccc;
  padding: 10px;
  transition: all 0.2s;
  text-align: center;
}

.heavyTable {
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
  animation: float 5s infinite;
}
</style>
     		
<table class="heavyTable">
      <tr>
          <th>Query Id</th>
          <th>D. Confirmation #</th>
          <th>Guest Name</th>
          <th>Traveling From</th>
          <th>Traveling To</th>
          <th>Booking Date</th>
          <th>Travel Start Date</th>
          <th>Travel End Date</th>
          <th>Deal Status</th>
        </tr>
        <tr>
          <td>${DealObject.queryId}</td>
          <td>UDN-${DealObject.dealConfirmationId}</td>
          <td>${DealObject.clientName}</td>
          <td>${DealObject.travelingFromCity}</td>
          <td>${DealObject.travelingToCity}</td>
          <td><fmt:formatDate value="${DealObject.bookingDate}" pattern="dd-MM-yyyy" /></td>
          <td><fmt:formatDate value="${DealObject.travelStartDate}" pattern="dd-MM-yyyy" /></td>
          <td><fmt:formatDate value="${DealObject.travelEndDate}" pattern="dd-MM-yyyy" /></td>
          <td>${DealObject.statusName}</td>
          
        </tr>
       
   
</table>
 