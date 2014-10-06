$(function(){
  var cal = new CalHeatMap();

  cal.init({
    domain: 'month',
    subDomain: 'day',
    range: 13,
    start: new Date(2013, 9),
    end: new Date(2014, 10)
  });
});
