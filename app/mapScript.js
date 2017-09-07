function initMap() {
  var asbury = {lat: 39.742611, lng: -104.988330};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 10,
    center: asbury
  });
  function updateMap(gameLat, gameLng) {
    var marker = new google.maps.Marker({
      position: {lat: gameLat, lng: gameLng},
      map: map
    });
  }
}
