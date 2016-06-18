$(document).ready(function(){
google.charts.load('current', {'packages':['corechart']});
$(".piechart").each(function(i,obj) {
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = google.visualization.arrayToDataTable(
      JSON.parse($(obj)
        .data("charts"))
    );

    var options = {
      title: 'Total Gender Percents'
      };

    var chart = new google.visualization.PieChart(obj);
    chart.draw(data, options);
    }
  })
});