<!-- Add the following script to your HTML file -->

<script src="https://cdn.jsdelivr.net/npm/date-fns@2.23.0"></script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const cases = document.getElementById('Present_Days');
        const deaths = document.getElementById('Absent_Days');
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

        updateChartValue(cases, 0);
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
