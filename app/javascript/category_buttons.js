document.addEventListener("turbo:load", () => {
  const buttons = document.querySelectorAll(".category-button");
  const hiddenInput = document.getElementById("selected-category");

  if (!buttons.length || !hiddenInput) return;

  buttons.forEach(button => {
    // すでに登録されたイベントを防ぐため一旦クローンする方法もあるが、ここでは簡潔に
    button.addEventListener("click", () => {
      const categoryId = button.getAttribute("data-category-id");

      // hiddenフィールドにセット
      hiddenInput.value = categoryId;

      // 全てのボタンから .selected を外す
      buttons.forEach(btn => btn.classList.remove("selected"));

      // 押されたボタンに .selected を追加
      button.classList.add("selected");
    });
  });
});
