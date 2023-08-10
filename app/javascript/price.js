function price (){
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
  const price = parseFloat(priceInput.value);
  if (!isNaN(price)){
    const tax = Math.floor(price * 0.1);
    const profitValue = price - tax;
    addTaxPrice.textContent = `${tax}`;
    profit.textContent = `${profitValue}`;
    } else {
      addTaxPrice.textContent = "";
      profit.textContent = "";
  }
  });
};

window.addEventListener('turbo:load',price);
