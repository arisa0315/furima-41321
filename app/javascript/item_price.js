document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById('item-price');
  const taxDisplay = document.getElementById('add-tax-price');
  const profitDisplay = document.getElementById('profit');

  if (priceInput) {
    priceInput.addEventListener('input', () => {
      const price = parseInt(priceInput.value, 10) || 0;
      const tax = Math.floor(price * 0.1); // 販売手数料(10%)の計算
      const profit = price - tax; // 販売利益の計算

      taxDisplay.textContent = tax;
      profitDisplay.textContent = profit;
    });
  }
});
