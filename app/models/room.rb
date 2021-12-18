class Room < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :name, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :cost, presence: true
  validates :address, presence: true
  validates :picture, presence: true
  validates :user_id, presence: true
  
  has_many :reservations, dependent: :destroy
end
