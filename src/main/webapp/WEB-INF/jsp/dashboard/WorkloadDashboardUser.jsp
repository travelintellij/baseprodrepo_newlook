<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
	$(document).ready(function() {

		$.ajax({
			type : 'GET',
			headers : {
				Accept : "application/json; charset=utf-8",
				"Content-Type" : "application/json; charset=utf-8"
			},
			url : '${pageContext.request.contextPath}/get_workload_dashboard_data_user',
			success : function(result) {
				google.charts.load('current', {
					'packages' : [ 'corechart' ]
				});
				google.charts.setOnLoadCallback(function() {
					drawVisualization(result);
				});
			}
		});


	      function drawVisualization(result) {
	        // Some raw data (not necessarily accurate)
			var dataArray = [];
			dataArray.push(['Service', 'Pending', 'Created','WIP','P-Client','P-Supp','Vouchered','Can-Req']);
			$.each(result, function(i, obj) {
				dataArray.push([ obj.serviceName,obj.pending,      obj.created, obj.wip, obj.pendingClient, obj.pendingSupplier, obj.vouchered, obj.cancellationRequested    ]);
				//dataArray.push([ obj.serviceName, obj.pending,obj.created,obj.wip,obj.created,obj.pendingClient,obj.pendingSupplier,obj.vouchered,obj.cancellationRequested ]);

			});
			var data = new google.visualization.arrayToDataTable(dataArray);

	        /*var data = google.visualization.arrayToDataTable([
	        	['Service', 'Pending', 'Created','WIP','P-Client','P-Supp','Vouchered','Can-Req'],
	       	 	['FLIGHT',     20,      40, 30, 20, 50, 80, 70 ],
	            ['HOTEL',     00,      8, 23, 21, 50, 12, 20 ],
	            ['LAND-PKG',  90,      3, 300, 21, 50, 14, 11 ],
	            ['INSURANCE',    20,      5, 22, 20, 16, 20, 90],
	            ['SGHTSNG',    13,      7, 90, 20, 27, 18, 20 ],
	            ['OTHERS',    15,      9, 50, 90, 27, 18, 13 ],
	            ['TRNSFRS',    18,      20, 50, 90, 90, 20, 90 ],
	            ['VISA',    19,      11, 50, 50, 10, 80, 20]
	        ]);
	        */

	        var options = {
	          title : 'Pending Workload Report',
	          vAxis: {title: 'Backlog'},
	          hAxis: {title: 'Services'},
	          seriesType: 'bars',
	          series: {5: {type: 'line'}}        };

	        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	        chart.draw(data, options);
	      }

	});
     </script>
  </head>
  <body>
    <div id="chart_div" style="width: 700px; height: 300px;"></div>
  </body>
</html>