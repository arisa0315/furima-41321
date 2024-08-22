const pay = () => {
  const publicKey = gon.public_key; // サーバーサイドから渡すかハードコーディングした公開鍵
  const payjp = Payjp(publicKey); // Payjpの初期化

  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form');
  form.addEventListener("submit", (e) => {
    e.preventDefault(); // フォーム送信を一時停止

    payjp.createToken(numberElement).then((response) => {
      if (response.error) {
        // エラーハンドリング
        // alert(response.error.message);
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value="${token}" name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
        // フォームフィールドをクリア
        numberElement.clear();
        expiryElement.clear();
        cvcElement.clear();

        // トークン付きのフォームを送信
        document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);