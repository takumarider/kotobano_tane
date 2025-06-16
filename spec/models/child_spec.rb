require 'rails_helper'

RSpec.describe Child, type: :model do
  describe 'バリデーション' do
    it '有効なファクトリを持つこと' do
      expect(build(:child)).to be_valid
    end

    it '名前が必須であること' do
      child = build(:child, name: nil)
      expect(child).not_to be_valid
    end

    it '生年月日が必須であること' do
      child = build(:child, birthday: nil)
      expect(child).not_to be_valid
    end
  end

  describe 'アソシエーション' do
    it '保護者に属すること' do
      child = create(:child)
      expect(child.parent).to be_present
    end

    it '複数のメモを持つこと' do
      child = create(:child)
      expect(child.memos).to be_empty
    end
  end
end
