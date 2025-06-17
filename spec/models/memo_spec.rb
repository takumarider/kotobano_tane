require 'rails_helper'

RSpec.describe Memo, type: :model do
  describe 'バリデーション' do
    it '有効なファクトリを持つこと' do
      expect(build(:memo)).to be_valid
    end

    it 'タイトルが必須であること' do
      memo = build(:memo, title: nil)
      expect(memo).not_to be_valid
    end

    it '本文が必須であること' do
      memo = build(:memo, body: nil)
      expect(memo).not_to be_valid
    end

    it 'カテゴリーが必須であること' do
      memo = build(:memo, category: nil)
      expect(memo).not_to be_valid
    end

    it 'カテゴリーが有効な値であること' do
      memo = build(:memo, category: 'invalid_category')
      expect(memo).not_to be_valid
    end
  end

  describe 'アソシエーション' do
    it '子どもに属すること' do
      memo = create(:memo)
      expect(memo.child).to be_present
    end

    it '複数のコメントを持つこと' do
      memo = create(:memo)
      create_list(:comment, 3, memo: memo)
      expect(memo.comments.count).to eq 3
    end
  end

  describe 'スコープ' do
    let!(:child) { create(:child) }
    let!(:memo1) { create(:memo, child: child, category: 'がっこう', title: 'メモ1') }
    let!(:memo2) { create(:memo, child: child, category: 'おうち', title: 'メモ2') }
    let!(:memo3) { create(:memo, child: child, category: 'その他', title: 'メモ3') }

    it 'カテゴリーでフィルタリングできること' do
      expect(Memo.by_category('がっこう')).to include(memo1)
      expect(Memo.by_category('がっこう')).not_to include(memo2, memo3)
    end

    it '検索ワードでフィルタリングできること' do
      expect(Memo.search('メモ1')).to include(memo1)
      expect(Memo.search('メモ1')).not_to include(memo2, memo3)
    end
  end
end
