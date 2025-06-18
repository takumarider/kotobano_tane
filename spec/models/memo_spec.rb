RSpec.describe Memo, type: :model do
  # 中略

  describe 'スコープ' do
    let!(:child) { create(:child) }
    let!(:category_school) { create(:category, name: 'がっこう') }
    let!(:category_home) { create(:category, name: 'おうち') }
    let!(:category_other) { create(:category, name: 'その他') }

    let!(:memo1) { create(:memo, child: child, category: category_school, title: 'メモ1') }
    let!(:memo2) { create(:memo, child: child, category: category_home, title: 'メモ2') }
    let!(:memo3) { create(:memo, child: child, category: category_other, title: 'メモ3') }

    it 'カテゴリーでフィルタリングできること' do
      expect(Memo.by_category('がっこう')).to include(memo1)
      expect(Memo.by_category('がっこう')).not_to include(memo2, memo3)
    end

    it '検索ワードでフィルタリングできること' do
      expect(Memo.search('メモ1')).to include(memo1)
      expect(Memo.search('メモ1')).not_to include(memo2, memo3)
    end
  end

  describe 'バリデーション' do
    it 'カテゴリーが必須であること' do
      memo = build(:memo, category: nil)
      expect(memo).not_to be_valid
    end

    # 「無効なカテゴリー」のテストは、
    # categoryに存在しないCategoryをセットするか
    # もしくはCategoryモデルのバリデーションを追加しているならそれをテストする形にしてください。
  end
end
