import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="delivery-cancel"
export default class extends Controller {
  connect() {
    console.log("delivery-cancel")
  }
 
}
