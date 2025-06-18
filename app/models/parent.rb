class Parent < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :children, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
end
