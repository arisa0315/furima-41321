// app/javascript/controllers/application.js
import { Application } from "@hotwired/stimulus"
import PriceController from "./price_controller"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

application.register("price", PriceController)

export { application }