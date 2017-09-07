$.ajax({
  url: "http://localhost:3000/api/v1/players/stats",
  method: 'GET',
  data: {id: id}
  // this @player var^^^
  }).done(function(post){
    debugger
      var ctx = document.getElementById('ath-profile-stats').getContext('2d');
      var myChart = new Chart(ctx {
        type: line
      });
  });

  var showPost = function(.) {
    return $.ajax({
      url: '/api/v1/facebook/photos_comments',
      method: 'GET',
      data: { year: year }
    }).done(function(post){
          var canvas = document.getElementById("photos-comments");
          var ctx = canvas.getContext('2d');

          // Global Options:

          Chart.defaults.global.defaultFontColor = 'black';
          Chart.defaults.global.defaultFontSize = 16;

          var data = {
            labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
            datasets: [{
                label: "Photos",
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
                data: Object.values(post.photos),
                spanGaps: true,
              }, {
                label: "Comments",
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
                data: Object.values(post.commments),
                spanGaps: false,
              }

            ]
          };

          // Notice the scaleLabel at the same level as Ticks
          var options = {
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
                      }]
                  }
          };

          // Chart declaration:
          var myBarChart = new Chart(ctx, {
            type: 'line',
            data: data,
            options: options
          });






    })
  };

  var stepSlider = document.getElementById('slider-step-2');

  noUiSlider.create(stepSlider, {
    start: [ 2017 ],
    step: 1,
    format: wNumb({
      decimals: 0
    }),
    range: {
      min: 2007,
      max: 2017
    }
  });

  var stepSliderValueElementTwo  =
  document.getElementById('slider-step-value-2');

  stepSlider.noUiSlider.on('update', function( values, handle ) {
    stepSliderValueElementTwo.innerHTML = values[handle];
    showPost(values[handle]);
  });
