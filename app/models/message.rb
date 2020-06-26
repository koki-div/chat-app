class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :content, presence: true
  has_one_attached :image
  
  # 画像の投稿のみの場合でもDBへ画像の保存を可能にする（メッセージのcontent無しでの場合にも画像が保存できる）
  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
