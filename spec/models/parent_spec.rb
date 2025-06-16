require 'rails_helper'

RSpec.describe Parent, type: :model do
  describe 'バリデーション' do
    it '有効なファクトリを持つこと' do
      expect(build(:parent)).to be_valid
    end

    it 'メールアドレスが必須であること' do
      parent = build(:parent, email: nil)
      expect(parent).not_to be_valid
    end

    it 'メールアドレスが一意であること' do
      create(:parent, email: 'test@example.com')
      parent = build(:parent, email: 'test@example.com')
      expect(parent).not_to be_valid
    end

    it '名前が必須であること' do
      parent = build(:parent, name: nil)
      expect(parent).not_to be_valid
    end
  end

  describe 'アソシエーション' do
    it '複数の子どもを持つこと' do
      parent = create(:parent)
      expect(parent.children).to be_empty
    end
  end
end
