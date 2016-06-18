$(document).ready(function(){
  google.charts.load('current', {'packages':['corechart']}); /* remember to add packages if you use fancy charts */
  google.charts.setOnLoadCallback(function(){
    $('.chart').each(function(idx, obj) {
      new google.visualization[$(obj).data('type')](obj).draw(
        google.visualization.arrayToDataTable($(obj).data('data')),
        $(obj).data('options')
      );
    });
  });
});
