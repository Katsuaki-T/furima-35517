function calc() {
  if (document.getElementById("item-price")){
  const itemPrice = document.getElementById("item-price")
itemPrice.addEventListener("input",() => {
const itemPriceValue = itemPrice.value
const tax = 0.1
const taxFee = Math.floor(itemPriceValue * tax)
const profit = itemPriceValue - taxFee
const taxArea = document.getElementById("add-tax-price")
const profitArea = document.getElementById("profit")
taxArea.innerHTML = taxFee
profitArea.innerHTML = profit
})
}
}









window.addEventListener('load',calc)