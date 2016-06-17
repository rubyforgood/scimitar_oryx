$(document).ready(function(){
google.charts.load('current', {'packages':['corechart']});
$(".piechart").each(function(i,obj) {
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ['Gender', 'total'],
      ['Male', 2],
      ['Female', 14]
    ]);

    var options = {
      title: 'Total Gender Percents'
      };

    var chart = new google.visualization.PieChart(obj);
    chart.draw(data, options);
    }
  })
});