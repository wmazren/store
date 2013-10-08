$(function () {
  var data = new Array ();
  var ds = new Array();

  data.push ([[1, 25],[2, 34],[3, 10]]);
  data.push ([[1, 13],[2, 29],[3, 5]]);

  $.plot($("#bar-chart"), [
    { label : "Storage Requests", data: data[0] },
    { label : "Retrieval Requests", data: data[1] }
  ], {
      grid: {
        hoverable: true
      },

      series: {
        bars: {
          show: true,
          barWidth: 0.2,
          order: 1,
          lineWidth: 0.5,
          fillColor: { colors: [ { opacity: 0.65 }, { opacity: 1 } ] }
        }
      },

      xaxis: {
        ticks: [[1,'August'],[2,'September'],[3,'October']]
      },

      colors: ["#F90", "#222", "#666", "#BBB"]
    });

});
