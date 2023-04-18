// const pay = () => {
//   //環境変数をもとに公開鍵を呼び出す
// debugger;
//   const payjp = Payjp(process.env.PAYJP_PK); 
//   //elementsインスタンスを生成
//   const elements = payjp.elements();
//   //入力欄ごとにelementインスタンスを生成
//   const numberElement = elements.create('cardNumber')
//   const cvcElement = elements.create('cardCvc')
//   const expiryElement = elements.create('cardExpiry')
//   //入力欄をブラウザ上に表示
//   numberElement.mount('#number-form')
//   cvcElement.mount('#cvc-form') 
//   expiryElement.mount('#expiry-form')
//   //フォームの要素を取得
//   const form = document.getElementById("charge-form");
//   //PAY.JPと通信が成功した場合のみトークンをフォームに埋め込む
//   form.addEventListener("submit", (e) => {
//     e.preventDefault();
//     payjp.createToken(expiryElement).then((response) => {
//       if (response.error) {
//         return false
//       }
//         const token = response.id;
//         const renderDom = document.getElementById("charge-form"); 
//         const tokenObj = `<input value=${token} name='token'> `;
//         renderDom.insertAdjacentHTML("beforeend", tokenObj);
//          document.getElementById("charge-form").submit();
      
//     });
//   });
// };

// window.addEventListener("load", pay);

const pay = () => {
  debugger;
  //const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY); //環境変数をもとに公開鍵を復号
  const payjp = Payjp("pk_test_1c4f909c9a84f7bf8f1539bb")
  console.log("OK");
  const elements = payjp.elements(); //elementsインスタンスを生成
  const numberElement = elements.create('cardNumber'); //入力欄ごとにelementインスタンスを生成、カッコ内は型で、card, cardNumber, cardExpiry, cardCvcから選択。
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');  //入力欄をDOM上に表示、カッコ内は'#id属性'
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const submit = document.getElementById("button"); 
  submit.addEventListener("click", (e) => { // イベント発火、PAY.JPと通信が成功した場合のみトークンをフォームに埋め込む
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        return false;
      } else { //if文には；はいらない
        const token = response.id;
        const renderDom = document.getElementById("charge-form");   //idを元に要素を取得
        const tokenObj = `<input value=${token} type="hidden" name='pay_form[token]'>`;   //paramsの中にトークンを含める
        renderDom.insertAdjacentHTML("beforeend", tokenObj);  //フォームの一番最後に要素を追加
      }
      document.getElementById("charge-form").submit();
    });
  })
}

window.addEventListener("load", pay);