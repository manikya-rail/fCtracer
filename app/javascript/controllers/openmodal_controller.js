import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [  ]

  connect() {
  }

  open(event) {
    event.preventDefault()
    let controller = this.application.getControllerForElementAndIdentifier(document.querySelector(this.data.get('selector')), "modal");
    controller.open();
  }
}
