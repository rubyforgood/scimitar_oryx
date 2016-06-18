$(document).ready(function(){
  google.charts.load('current', {'packages':['corechart', 'geochart']}); /* remember to add packages if you use fancy charts */
  function mergeOptions(obj1,obj2){
    var obj3 = {};
    for(var attr in obj1){ obj3[attr] = obj1[attr] }
    for(var attr in obj2){ obj3[attr] = obj2[attr] }
    return obj3;
  }
  var baseOptions = {colors: ['#4F81BD', '#C0504D', '#9BBB59', '#8064A2', '#1F497D']};
  google.charts.setOnLoadCallback(function(){
    $('.chart').each(function(idx, obj) {
      new google.visualization[$(obj).data('type')](obj).draw(
        google.visualization.arrayToDataTable($(obj).data('data')),
        mergeOptions(baseOptions, $(obj).data('options'))
      );
    });
  });
});
