class Owatter < ApplicationRecord
  validates :content, presence: true, length:{ in: 1..140 }
    #参考ページ https://client.diveintocode.jp/curriculums/557
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  mount_uploader :image, ImageUploader
end
