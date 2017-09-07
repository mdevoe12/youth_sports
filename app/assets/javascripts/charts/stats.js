
$.ajax({
  url: "/api/v1/players/stats",
  method: 'GET',
  data: {
    id: 800,
    games: 10
  }
}).done(function(post){
  var name = post.name;
  var points = Object.values(post.points);
  var fouls = Object.values(post.fouls);
  var games = [1,2,3,4,5,6,7,8,9,10]
  debugger
  // Chart.defaults.global.defaultFontColor = 'black';
  // Chart.defaults.global.defaultFontSize = 16;

  var options = {
    title: {
      display: true,
      text: name + '\'s Season Stats'
    },
    scales: {
              yAxes: [{
                  ticks: {
                      beginAtZero:true
                  },
                  scaleLabel: {
                       display: true,
                       labelString: '',
                       fontSize: 20
                    }
              }],
              xAxes: [{
                ticks: {
                  beginAtZero:true
                }
              }]
          },
                    layout: {
              padding: {
                left: 50
              }
            }
  };
  var data = {
    labels: games,
    datasets: [
          {
              label: "points",
              fill: false,
              lineTension: 0.1,
              backgroundColor: "#80cbc4",
              borderColor: "#80cbc4", // The main line color
              borderCapStyle: 'square',
              borderDash: [1, 2], // try [5, 15] for instance
              borderDashOffset: 0.0,
              borderJoinStyle: '#80cbc4',
              pointBorderColor: "black",
              pointBackgroundColor: "white",
              pointBorderWidth: 1,
              pointHoverRadius: 8,
              pointHoverBackgroundColor: "yellow",
              pointHoverBorderColor: "brown",
              pointHoverBorderWidth: 2,
              pointRadius: 4,
              pointHitRadius: 10,
              // notice the gap in the data and the spanGaps: true
              data: points,
              spanGaps: true,
            }, {
              label: "fouls",
              fill: true,
              lineTension: 0.1,
              backgroundColor: "#006064",
              borderColor: "#00838f",
              borderCapStyle: 'butt',
              borderDash: [],
              borderDashOffset: 0.0,
              borderJoinStyle: 'miter',
              pointBorderColor: "white",
              pointBackgroundColor: "black",
              pointBorderWidth: 1,
              pointHoverRadius: 8,
              pointHoverBackgroundColor: "brown",
              pointHoverBorderColor: "yellow",
              pointHoverBorderWidth: 2,
              pointRadius: 4,
              pointHitRadius: 10,
              // notice the gap in the data and the spanGaps: false
              data: fouls,
              spanGaps: false,
            }
          ]
        };
  var ctx = document.getElementById('ath-profile-stats');
  var myLineChart = new Chart(ctx, {
    type: 'line',
    data: data,
    options: options
  });
});
