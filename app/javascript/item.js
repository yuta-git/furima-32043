function charge() {
  const price = document.getElementById("item-price")
  price.addEventListener('keyup', () => {
    const taxVal = price.value * 0.1;
    const profitVal = price.value * 0.9;
    const taxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    taxPrice.innerHTML = taxVal;
    profit.innerHTML = profitVal;
  });
};

window.addEventListener('load', charge);