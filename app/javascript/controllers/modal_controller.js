import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "video" ]

  toggle() {
    if (this.element.classList.contains('hidden')) {
      this.open();
    } else {
      this.close();
    }
  }

  open() {
    this.element.classList.remove('hidden');
    this.videoTarget.src = this.videoTarget.src + (this.videoTarget.src.indexOf('?') < 0 ? '?' : '&') + 'autoplay=1';
  }

  close() {
    this.element.classList.add('hidden');
    this.videoTarget.src = this.videoTarget.src.replace('&autoplay=1', '').replace('?autoplay=1', '');
    // this.videoTarget.src = this.videoTarget.src.replace('&autoplay=1', '').replace('?autoplay=1', '').replace('&muted=1', '').replace('?muted=1', '');
  }
}
