import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    this.load()
  }

  load() {
    fetch(this.data.get("url"))
      .then((response) => {
        if (response.ok) {
          return response.text()
        } else {
          if (response.status == 404) {
            window.location.href = '/404';
          } else if (response.status == 500) {
            window.location.href = '/500';
          }
        }
      })
      .then(html => {
        this.element.innerHTML = html
      })
      .catch((error) => {
        console.log(error)
        window.location.href = '/500';
      })
  }
}
