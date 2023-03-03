window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", function(){
   setInterval("A", 1000);
  
  // const inputValue = priceInput.value;
  // const addTaxDom = document.getElementById("add-tax-price");
  // const ProfitDom = document.getElementById("profit");
  // // 入力した金額をもとに販売手数料を計算する処理
  // addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
  // // 出品価格から販売手数料を引く処理
  // ProfitDom.innerHTML = inputValue - addTaxDom.innerHTML;
  })
})

function A() {
 console.log("aha")
}


// const commission = () => {
//   const itemPrice = document.getElementById("item-price");
//   const addTaxPrice = document.getElementById("add-tax-price");
//   const profit = document.getElementById("profit");
//   itemPrice.addEventListener("keyup", () => {
//     addTaxPrice.innerHTML = Math.floor(itemPrice.value * 0.1);
//     profit.innerHTML = itemPrice.value - addTaxPrice.innerHTML;
//   });
// };

// window.addEventListener('load', commission);