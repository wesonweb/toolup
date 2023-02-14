import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {

  static values = {
    apiKey:String,
    markers: Object
  }
  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    let marker = this.markersValue
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(this.map)
  }
  #fitMapToMarkers() {
    let marker = this.markersValue
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ marker.lng, marker.lat ])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 16, duration: 0 })
  }
}
