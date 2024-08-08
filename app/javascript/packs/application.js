// app/javascript/packs/application.js
import Rails from "@rails/ujs"
import "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers" // 修正点

Rails.start()

const application = Application.start()
const context = require.context("controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

export { application }
