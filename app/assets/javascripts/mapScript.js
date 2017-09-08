      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 11,
          center: {lat: 39.725103, lng: -104.985915}
        });

        setMarkers(map);
      }
      var games = post;
      function setMarkers(map) {
        var shape = {
          coords: [1,1,1,20,18,20,18,1],
          type: 'poly'
        };
        $.ajax({
          url: "/api/v1/players/games",
          method: 'GET',
          data: {
            id: 335
          },
          success: function(post){
        for (var i = 0; i < games.length; i++) {
          var game = games[i];
          var marker = new google.maps.Marker({
            position: {lat: game[1], lng: game[2]},
            map: map,
            shape: shape,
            title: game[0],
            zIndex: game[3]
          });
        }
      }
    }
  });
