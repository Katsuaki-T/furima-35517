function calc() {
const itemPrice = document.getElementById("item-price")
itemPrice.addEventListener("input",() => {
const itemPriceValue = itemPrice.value
const tax = 0.1
const taxFee = itemPriceValue * tax
const profit = itemPriceValue - taxFee
const taxArea = document.getElementById("add-tax-price")
const profitArea = document.getElementById("profit")
taxArea.innerHTML = taxFee
profitArea.innerHTML = profit
})
}










window.addEventListener('load',calc)