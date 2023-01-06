const pay = () => {
  //環境変数をもとに公開鍵を呼び出す
  const payjp = Payjp(process.env.PAYJP_PK); 
  //elementsインスタンスを生成
  const elements = payjp.elements();
  //入力欄ごとにelementインスタンスを生成
  const numberElement = elements.create('cardNumber')
  const cvcElement = elements.create('cardCvc')
  const expiryElement = elements.create('cardExpiry')
  //入力欄をブラウザ上に表示
  numberElement.mount('#number-form')
  cvcElement.mount('#cvc-form') 
  expiryElement.mount('#expiry-form')
  //フォームの要素を取得
  const form = document.getElementById("charge-form");
  //PAY.JPと通信が成功した場合のみトークンをフォームに埋め込む
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    payjp.createToken(expiryElement).then((response) => {
      if (response.error) {
        return false
      }
        const token = response.id;
        const renderDom = document.getElementById("charge-form"); 
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        document.getElementById("charge-form").submit();
      
    });
  });
};

window.addEventListener("load", pay);