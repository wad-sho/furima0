const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PK);// PAY.JPテスト公開鍵

  console.log(process.env.PAYJP_PK);
  const form = document.getElementById("charge-form");
  // フォーム全体のidであるcharge-formを取得
  form.addEventListener("submit", (e) => {
    // 購入ボタンを押下したときにイベント発火
    e.preventDefault();
    // ここで送信処理をキャンセル⇨サーバーにリクエストは送られない
    const formResult = document.getElementById("charge-form");
    console.log(formResult);
    const formData = new FormData(formResult);
    console.log(formData);
    //FormDataとは、フォームに入力された値を取得できるオブジェクトのことです。
// new FormData(フォームの要素);のように記述することでオブジェクトを生成し、引数にフォームの要素を渡すことで、そのフォームに入力された値を取得できます。
// 非同期通信で送信する必要があるためフォームの値を取得します。

    const card = {
      number: formData.get("pay_form[n]"),
      cvc: formData.get("pay_form[c]"),
      exp_month: formData.get("pay_form[m]"),
      exp_year: `20${formData.get("pay_form[y]")}`,
    };
     console.log(card);
    // 生成したFormDataオブジェクトから、
    // クレジットカードに関する情報を取得し変数cardに代入するオブジェクトとして定義。
    // "order[number]"は各フォームのname属性の値のこと。
    Payjp.createToken(card, (status, response) => {
      console.log(response);
      // 第1引数carには4つのカード情報が、
      // 第2引数であるアロー関数の引数としてはstatusとresponseを定義。
      // statusはトークンの作成がうまくなされたか確認するHTTPステータスコードが入る。
      // responseはそのレスポンスの内容が含まれresponse.idでトークンの値を取得
      if (status == 200) {
        const token = response.id;
      // このままではトークンはフォーム情報に含まれないためアプリケーションに送れない
      // PAYJPが発行したtokenをjsが取得したまでなので、railsに送る
        const renderDom = document.getElementById("charge-form");
        // 再度全体の要素を示すcharge-form取得
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        // ブラウザ上にinputフォームができトークンの値が現れ、フォームの中に追加されている
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      // フォームに存在するクレジットカードの各情報を削除
      document.getElementById("charge-form").submit();
      // フォームの情報をサーバーサイドに送信。
      // なお、5行目のe.preventDefault();で通常のRuby on Railsにおけるフォーム送信処理はキャンセル。
      // したがって、上記のようにJavaScript側からフォームの送信処理を行う
      // 以降コントローラーへ
      
    });
  });
};

window.addEventListener("load", pay);