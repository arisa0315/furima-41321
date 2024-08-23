function initializePriceCalculation() {
  const priceInput = document.getElementById('item-price');
  const taxDisplay = document.getElementById('add-tax-price');
  const profitDisplay = document.getElementById('profit');

  function calculatePrice() {
    if (!priceInput) {
      return;
    }
    const price = parseInt(priceInput.value, 10) || 0;
    const tax = Math.floor(price * 0.1);
    const profit = price - tax;

    taxDisplay.textContent = tax;
    profitDisplay.textContent = profit;
  }

  if (priceInput) {
    priceInput.addEventListener('input', calculatePrice);
    calculatePrice();  // 初期化時に一度計算して表示する
  }
}

document.addEventListener('DOMContentLoaded', initializePriceCalculation);

// Turboでのページ遷移時にも初期化を行う
document.addEventListener('turbo:load', initializePriceCalculation);
document.addEventListener('turbo:render', initializePriceCalculation);
