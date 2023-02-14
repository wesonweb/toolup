import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {

  static values = {
    apiKey:String,
    markers: Object
  }
  connect() {
    console.log(this.apiKeyValue);
    console.log(this.markersValue);
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap()
    // this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
  // this.markersValue.forEach((marker) => {
    // this.markersValue() {
    var marker = this.markersValue;
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(this.map)
    // }
  }
  // #fitMapToMarkers() {
  // const bounds = new mapboxgl.LngLatBounds()
  // // this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
  // this.markersValue(marker) {
  // bounds.extend([ marker.lng, marker.lat ]))
  // }
  // this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  // }
}
