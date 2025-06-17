document.addEventListener("turbo:load", function() { // DOMContentLoaded を turbo:load に変更
  const templateButtons = document.querySelectorAll(".template-btn");
  const commentField = document.getElementById("comment_content");

  templateButtons.forEach(button => {
    button.addEventListener("click", function(event) {
      event.preventDefault();
      event.stopPropagation();
      commentField.value = this.dataset.content;
      commentField.focus();
    });
  });
});