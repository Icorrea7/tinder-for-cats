class Cat < ApplicationRecord
  before_save { self.email = email.downcase }

  enum status: [:single, :open_relationship, :just_friendship]

  has_one_attached :avatar, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
