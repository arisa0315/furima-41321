// app/javascript/packs/application.js
import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"
import PriceController from "../price_controller"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

// Import all controllers defined in the importmap under controllers/*
const context = require.context(".", true, /\.js$/)
application.load(definitionsFromContext(context))

// Register the price controller
application.register("price", PriceController)

export { application }
