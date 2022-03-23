const price = () => {
  const form = document.getElementById('item-price');
  form.addEventListener('keyup', () => {
    if (!isNaN(form.value)) {
      const commission = form.value / 10;
      document.getElementById("add-tax-price").innerHTML = parseInt(commission, 10);
      document.getElementById("profit").innerHTML = parseInt(form.value - commission, 10);
    };
  });
};

window.addEventListener('load', price); 
// window.addEventListener('load', () => {
//   const priceInput = document.getElementById("item-price");
//    priceInput.addEventListener("input", () => {

//      const inputValue = priceInput.value;
//      const addTaxDom = document.getElementById("add-tax-price"); 
//      const addProfitDom = document.getElementById("profit");
  
//      addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
//      addProfitDom.innerHTML = Math.floor(inputValue - Math.floor(inputValue * 0.1)); 
//   })
// })


// ＝＝＝パターン２
// // ①　JSを動かす記述
// window.addEventListener("load", function(){

//   // ②　価格入力欄のID属性を手がかりに入力値を変数Aに入れる
//  const priceInput = document.getElementById("item-price")
// //  住所情報を取得

// // ③　上記で入れた変数Aに対しての発火条件を書く
//   priceInput.addEventListener("input", function(){
// // ④　②の中で入力された値を取り出して変数Bに入れる
//   const price = document.getElementById("item-price").value

// // ⑤　変数Bに対して計算し変数C,Dに入れる（出品手数料Cと利益D）  
//     const tax = Math.floor(price * 0.1)
//     const profit = price - tax

// // ⑥手数料部分には変数Cの値を入れる
//     const taxForm = document.getElementById("add-tax-price")
//     taxForm.textContent = tax
//     // Math.floor()  小数点の切り捨て

// // ⑦利益部分に変数Dの値を入れる
//     const profitForm = document.getElementById("profit")
//     profitForm.textContent = profit


//   })
// });


// ＝＝＝パターン３
// function calculate (){
//   const itemPrice = document.getElementById("item-price");


//   itemPrice.addEventListener('keyup', () => {
//     const priceCommission = document.getElementById('add-tax-price');
//     const priceProfit = document.getElementById('profit');
//     const tax = itemPrice.value / 10;
//     const commissionValue = parseInt(tax).toLocaleString();
//     const profitValue = parseInt(itemPrice.value - tax).toLocaleString();

//     priceCommission.innerHTML = `${commissionValue}`;
//     priceProfit.innerHTML = `${profitValue}`;
//   });
// };


// window.addEventListener('load', calculate); 