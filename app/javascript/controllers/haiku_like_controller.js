import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="hike-like"
export default class extends Controller {
  connect() {
    console.log("connect!")
  }

  like_animation() {
    console.log("anime");
    this.element.classList.add('icon_vertical')
  }
}
