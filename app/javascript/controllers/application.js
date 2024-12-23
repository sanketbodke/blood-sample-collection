import { Application } from "@hotwired/stimulus"
import "./user"
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
