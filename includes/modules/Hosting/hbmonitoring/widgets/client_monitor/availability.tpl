<h2 title="Availability in smallest timeframe have two states: 100% when host is reachable and 0% when host is down. Zooming out will show average value per period." class="left havetooltip">Availability <strong class="availability"></strong>%</h2>
<div class="clear"></div>
<div id="availabilityGraph" class="graph adjustedOnDateNavigation"></div>{literal}
<script>
jQuery(document).ready(function($) {
  var refreshAvailabilityGraph = function() {
    var availabilities = [];
    var minAvailability = Infinity;
    $.each(dateInterval.stats, function(index, stat) {
      var availability = stat.availability || (stat.isUp ? 100 : 0);
      availabilities.push([new Date(stat.timestamp), availability]);
      minAvailability = Math.min(minAvailability, availability);
    });
    var container = $('#availabilityGraph').get(0);
    Flotr.draw(container, [{ data: availabilities, lines : { show: true, lineWidth: 4, fill : true, fillColor: ['#00A8F0', '#fff'] }, points: { show: true } }], { 
      yaxis : {
        min : 0,
        margin: false,
        min: minAvailability < 10 ? minAvailability : minAvailability < 90 ? minAvailability - 10 : (minAvailability - 1),
        max: 100 
      },
      xaxis : {
        showLabels: false,
        noTicks: 0,
        mode: 'time',
        min: dateInterval.begin.valueOf() - dateInterval.getSubTypeDuration() / 2,
        max: dateInterval.end.valueOf() - dateInterval.getSubTypeDuration() / 2 
      },
      mouse : {
        track: true,
        trackFormatter: function(obj) {
          return moment(obj.x).format('LLLL') + '<br/><strong>' + obj.y + '%</strong>';
        },
        relative: true,
        sensibility: 4,
        radius: 4,
        position: 's'
      },
      grid: { outline: '' }
    });
    Flotr.EventAdapter.observe(container, 'flotr:click', function (hit) {
      if (!hit.series || dateInterval.isMaxZoom()) return;
      dateInterval.update(dateInterval.subType(), hit.x);
    });
  }
  dateInterval.on('refresh-stats', refreshAvailabilityGraph);
});
</script>
{/literal}