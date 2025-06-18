# カテゴリーの作成（重複防止のため find_or_create_by を使用）
categories = [
  "日記",
  "学んだことをまとめよう",
  "今の気持ちはどう？",
  "ひらめいた！！"
]

categories.each do |name|
  Category.find_or_create_by!(name: name)
end

# 親ユーザーを取得または作成
parent = Parent.find_or_create_by!(email: 'parent@example.com') do |p|
  p.password = 'password'
end

# コメントテンプレート作成
CommentTemplate.create!([
  { title: "褒める", content: "とてもよくできました！", parent: parent },
  { title: "励ます", content: "あと少し！がんばりましょう！", parent: parent },
  { title: "応援する", content: "君にしかできないことだ！", parent: parent },
  { title: "提案する", content: "調べたことをそのままAIに聞いてみて。もっと教えてくれるよ", parent: parent }
])
