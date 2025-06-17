

# CommentTemplate登録
CommentTemplate.create!([
  { content: "とてもよくできました！" },
  { content: "あと少し！がんばりましょう！" },
  { content: "君にしかできないことだ！" },
  { content: "調べたことをそのままAIに聞いてみて。もっと教えてくれるよ" }
])

# Category登録
categories = Category.create!([
  { name: "日記" },
  { name: "学んだことをまとめよう" },
  { name: "今の気持ちはどう？" },
  { name: "ひらめいた！！" }
])
