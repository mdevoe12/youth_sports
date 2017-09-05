function initMap() {
  var asbury = {lat: 39.680045, lng: -104.971557};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 12,
    center: asbury
  });
  var marker = new google.maps.Marker({
    position: asbury,
    map: map
  });
}

function updateMap(lat, lng) {
  var gameLat = lat
  var gameLng = lng
  var marker = new google.maps.Marker({
    position: {lat: gameLat, lng: gameLng}
  })
}
