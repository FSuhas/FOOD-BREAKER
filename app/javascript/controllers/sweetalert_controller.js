import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

// Connects to data-controller="sweetalert"
export default class extends Controller {
  static values = {text: String}
  connect() {
    Swal.fire({
      title: "A nice alert",
      icon: "success",
      text: this.textValue
    });
  };
}
