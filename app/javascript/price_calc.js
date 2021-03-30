function price_calc(){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const price = itemPrice.value;
    const fee = Math.floor(price / 10);
    const profit = (price - fee);
    const feeOutput = document.getElementById("add-tax-price");
    feeOutput.innerHTML = `${fee}`;
    const profitOutput = document.getElementById("profit");
    profitOutput.innerHTML = `${profit}`;
    })
}
window.addEventListener("load",price_calc)