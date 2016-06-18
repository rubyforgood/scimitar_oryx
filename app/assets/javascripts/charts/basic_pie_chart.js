$(document).ready(function(){
  google.charts.load('current', {'packages':['corechart']});
  $(".piechart").each(function(i,obj) {
    google.charts.setOnLoadCallback(function(){
      new google.visualization.PieChart(obj).draw(
        google.visualization.arrayToDataTable( $(obj).data("data").data ),
        $(obj).data("options")
      );
    });
  });
});
