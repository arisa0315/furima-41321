// app/javascript/price_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["price", "tax", "profit"]

  connect() {
    this.updateProfit()
  }

  update() {
    this.updateProfit()
  }

  updateProfit() {
    const price = parseInt(this.priceTarget.value, 10) || 0
    const tax = Math.floor(price * 0.1) 
    const profit = Math.floor(price - tax) 

    this.taxTarget.textContent = tax.toLocaleString()
    this.profitTarget.textContent = profit.toLocaleString()
  }
}
