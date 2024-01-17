<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Pie Chart</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
<!--
Your
 
existing
 
styles
 
remain
 
unchanged
 
-->
</style>
</head>
<body>
	<section class="pie_chart_content">
		<div class="overlay">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="main_box">
							<h1>Covid -19 Corona VALUE</h1>
							<canvas id="mychart"></canvas>
						</div>
						<%
						
						%>
					</div>
					<div class="col-md-6">
					<div class="count_box">
							<div class="form-group">
								<label for="coronavirus-input">Total Number of Cases</label> <input
									type="text" value="1234"
									class="total-input form-control" id="coronavirus-input"
									readonly>
							</div>
							<div class="form-group">
								<label for="active-input">Active Cases</label> <input
									type="text" value="1234" name="active-input"
									class="active-input form-control" id="active-input">
							</div>
							<!-- Include similar input fields for Deaths and Recovered -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<%  

Connection conn =null; 
PreparedStatement pstmt= null;
ResultSet rs= null;
String sql="";
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	
}
catch(Exception e){
	e.printStackTrace();
	
}
%>
	<script>
    document.addEventListener('DOMContentLoaded', function () {
        const activeCases = document.getElementById('active-input');
        const deaths = document.getElementById('death-input');
        const recovered = document.getElementById('recovered-input');
        const ctx = document.getElementById('mychart').getContext('2d');

        let mychart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ['Active cases', 'Deaths', 'Recovered'],
                datasets: [{
                    label: 'Number of cases',
                    data: [0, 0, 0],
                    backgroundColor: ['red', 'orange', 'yellow'],
                    borderWidth: 1
                }]
            }
        });

        const updateChartValue = (input, dataOrder) => {
            input.addEventListener('input', () => {
                mychart.data.datasets[0].data[dataOrder] = input.value;
                mychart.update();
            });
        };

        updateChartValue(activeCases, 0);
        updateChartValue(deaths, 1);
        updateChartValue(recovered, 2);
        
        
        // Function to calculate the total days excluding weekends
        const calculateTotalDays = () => {
            const joinDate = new Date('your_joining_date_here'); // Replace with the actual joining date
            const currentDate = new Date();
            let totalDays = 0;

            while (joinDate <= currentDate) {
                if (joinDate.getDay() !== 0 && joinDate.getDay() !== 6) {
                    totalDays++;
                }
                joinDate.setDate(joinDate.getDate() + 1);
            }

            return totalDays;
        };

        // Update the "Total Days of Employment" input
        const totalDaysInput = document.getElementById('coronavirus-input');
        totalDaysInput.value = calculateTotalDays();
        
    });
</script>
</body>
</html>
