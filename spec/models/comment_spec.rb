require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーション' do
    it '有効なファクトリを持つこと' do
      expect(build(:comment)).to be_valid
    end

    it '本文が必須であること' do
      comment = build(:comment, body: nil)
      expect(comment).not_to be_valid
    end
  end

  describe 'アソシエーション' do
    it 'メモに属すること' do
      comment = create(:comment)
      expect(comment.memo).to be_present
    end

    it '保護者に属すること' do
      comment = create(:comment)
      expect(comment.parent).to be_present
    end
  end
end
