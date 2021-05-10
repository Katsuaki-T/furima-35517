const pay = () => {
  Payjp.setPublicKey("pk_test_f9db76cd6ae6ebb0574bfd92"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
   
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_address[number]"),
      cvc: formData.get("purchase_address[cvc]"),
      exp_month: formData.get("purchase_address[exp_month]"),
      exp_year: `20${formData.get("purchase_address[exp_year]")}`,
    };
  });
};

window.addEventListener("load", pay);