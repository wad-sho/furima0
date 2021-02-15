window.addEventListener("DOMContentLoaded", () => {
  const path = location.pathname
  const params = path.replace(/items/g, '').replace(/transactions/g, '').replace(/\//g, '');
  const button = document.getElementById("button");
  console.log(path)
  // 商品出品
  if (path == "/items/new") {
    button.addEventListener("click", (e) => {
      e.preventDefault();
      document.getElementById("item-name").value = "商品名テスト";
      document.getElementById("item-info").value = "商品説明テスト";
      document.getElementById("item-price").value = "1000";
      const category = document.getElementById("item-category").options;
      category[1].selected = true ;
      const sales = document.getElementById("item-sales-status").options;
      sales[1].selected = true ;
      const fee = document.getElementById("item-shipping-fee-status").options;
      fee[1].selected = true ;
      const item_prefecture = document.getElementById("item-prefecture").options;
      item_prefecture[1].selected = true ;
      const delivery = document.getElementById("item-scheduled-delivery").options;
      delivery[1].selected = true ;
    })
  }
  // 新規登録
  if (path == "/users/sign_up") {
    button.addEventListener("click", (e) => {
      e.preventDefault();
      document.getElementById("nickname").value = "テスト太郎";
      document.getElementById("email").value = "test@111";
      document.getElementById("first-name").value = "田中";
      document.getElementById("last-name").value = "太郎";
      document.getElementById("first-name-kana").value = "タナカ";
      document.getElementById("last-name-kana").value = "タロウ";
      const birth1 = document.getElementById("user_birth_date_1i").options;
      birth1[1].selected = true ;
      const birth2 = document.getElementById("user_birth_date_2i").options;
      birth2[1].selected = true ;
      const birth3 = document.getElementById("user_birth_date_3i").options;
      birth3[1].selected = true ;
    })
  }
  // 商品購入
  if (path.includes("items") && path.includes("transactions") && /^([1-9]\d*|0)$/.test(params)) {
    button.addEventListener("click", (e) => {
      e.preventDefault();
      document.getElementById("card-number").value = "4242424242424242";
      document.getElementById("card-exp-month").value = "4";
      document.getElementById("card-exp-year").value = "25";
      document.getElementById("card-cvc").value = "123";
      document.getElementById("postal-code").value = "111-1111";
      const prefecture = document.getElementById("prefecture").options;
      prefecture[1].selected = true ;
      document.getElementById("city").value = "テスト市";
      document.getElementById("addresses").value = "テスト1-1";
      document.getElementById("building").value = "テストビル";
      document.getElementById("phone-number").value = "09011118888";
    })
  }
});