class CommentTemplate < ApplicationRecord
  belongs_to :parent

  validates :title, presence: true
  validates :content, presence: true

  # テンプレートの種類を定義
  TEMPLATE_TYPES = {
    praise: {
      title: "褒める",
      content: "よく頑張りましたね！\n特に〇〇の部分が素晴らしいです。\nこれからも頑張ってください！"
    },
    encourage: {
      title: "励ます",
      content: "難しい内容でしたが、よく考えて書けていますね。\nもう少し詳しく書いてみると、より良いメモになりますよ。\n次も頑張りましょう！"
    },
    suggest: {
      title: "提案する",
      content: "〇〇について、もう少し詳しく書いてみてはどうでしょうか？\n例えば、どんなことを感じたのか、なぜそう思ったのかなど、\n自分の考えを深めることができますよ。"
    }
  }
end
