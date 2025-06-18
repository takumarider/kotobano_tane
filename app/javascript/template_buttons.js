document.addEventListener('turbo:load', () => {
  const buttons = document.querySelectorAll('.template-btn');
  const textarea = document.getElementById('comment_body'); // 修正済みのID

  buttons.forEach(button => {
    button.addEventListener('click', () => {
      const content = button.dataset.content;
      if (textarea) {
        textarea.value = content;
        textarea.focus();
      }
    });
  });
});
