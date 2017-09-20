// function initMap() {
//       var map = new google.maps.Map(document.getElementById('map'), {
//         zoom: 11,
//         center: {lat: 39.725103, lng: -104.985915}
//       });
//
//       setMarkers(map);
//     }
//
//     var games = [
//       ['Asbury Elementary', 39.680049, -104.971616, 1],
//       ['Holm Elementary', 39.657665, -104.892091, 2],
//       ['Calvary Baptist', 39.653363, -104.912486, 3]
//     ];
//
//     function setMarkers(map) {
//
//       var shape = {
//         coords: [1, 1, 1, 20, 18, 20, 18, 1],
//         type: 'poly'
//       };
//       for (var i = 0; i < games.length; i++) {
//         var game = games[i];
//         var marker = new google.maps.Marker({
//           position: {lat: game[1], lng: game[2]},
//           map: map,
//           shape: shape,
//           title: game[0],
//           zIndex: game[3]
//         });
//       }
//     }
