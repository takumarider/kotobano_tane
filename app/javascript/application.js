import "@hotwired/turbo-rails"
import "controllers"
import "template_buttons"

// ✅ Turbo対応（DOMContentLoadedではなくturbo:loadを使う）
document.addEventListener("turbo:load", () => {
  const buttons = document.querySelectorAll(".category-button");
  const hiddenInput = document.getElementById("selected-category");

  if (!buttons || !hiddenInput) return;

  buttons.forEach(button => {
    button.addEventListener("click", () => {
      const categoryId = button.getAttribute("data-category-id");
      hiddenInput.value = categoryId;

      // ボタンのスタイルを切り替え（選択済みの見た目）
      buttons.forEach(btn => btn.classList.remove("selected"));
      button.classList.add("selected");
    });
  });
});
