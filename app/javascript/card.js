const pay = () => {
  Payjp.setPublicKey("pk_test_f9db76cd6ae6ebb0574bfd92"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    console.log("フォーム送信時にイベント発火")
  });
};

window.addEventListener("load", pay);