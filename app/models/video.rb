class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :thumbnail

  validates :title, presence: true, length: { minimum: 5 }
  validates :user, presence: true
end
