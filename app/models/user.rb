class User < ApplicationRecord
  has_many :videos, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
