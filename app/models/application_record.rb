class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true  # ← これを必ず書く！

  has_many_attached :images  # 複数画像を許可
end
