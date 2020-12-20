window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    // 入力金額を取得する
    const inputValue = priceInput.value;
    // 販売手数料を表示
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    // 販売利益を表示
    const value_result = inputValue * 0.1
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = (Math.floor(inputValue - value_result));
  })
});


