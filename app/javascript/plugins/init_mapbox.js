import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/4rte/cki8o02td4sy319rx02vye0rt',
    pitch: 60, // pitch in degrees
    // bearing: -60, // bearing in degrees
    zoom: 13
  });
  
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '25px';
    element.style.height = '25px';

    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat], [marker.lng, marker.lat]));
  console.log(markers);
  map.fitBounds(bounds, { padding: 70, maxZoom: 13 });
  map.setCenter([2.355, 48.8566]);
  var avglng = (markers.map(m => m.lng).reduce((a, b) => a + b, 0)) / markers.length;
  var avglat = (markers.map(m => m.lat).reduce((a, b) => a + b, 0)) / markers.length;
  map.flyTo({
    // These options control the ending camera position: centered at
    // the target, at zoom level 9, and north up.

    center: [avglng, avglat],
    zoom: 13,
    // bearing: 0,
    // These options control the flight curve, making it move
    // slowly and zoom out almost completely before starting
    // to pan.
    speed: 2, // make the flying slow
    curve: 2, // change the speed at which it zooms out
    // This can be any easing function: it takes a number between
    // 0 and 1 and returns another number between 0 and 1.
    easing: function (t) {
    return t;
    },
  });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
    mapboxgl: mapboxgl }));
  }
};

export { initMapbox };
