import { Controller } from 'stimulus'
import { dom, library } from '@fortawesome/fontawesome-svg-core'
import { fab } from '@fortawesome/free-brands-svg-icons'
import { far } from '@fortawesome/free-regular-svg-icons'
import { fas } from '@fortawesome/free-solid-svg-icons'


export default class extends Controller {
  initialize() {
    library.add(fab)
    library.add(far)
    library.add(fas)
  }

  connect() {
    dom.i2svg()
  }
}
