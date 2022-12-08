class Cat < ApplicationRecord
  before_save { self.email = email.downcase }
  after_commit :send_changes_to_version_history, on: :update, if: :persisted?

  has_one_attached :avatar, dependent: :destroy
  has_many :cat_versions, dependent: :destroy

  enum status: [:single, :open_relationship, :just_friendship]

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  private

  def send_changes_to_version_history
    new_version = Hash.new

    self.previous_changes.each do |key, changes|
      next if key == ("updated_at" || "created_at" || "id")
      new_version[key] = changes.last
    end

    self.cat_versions.create!(new_version)
  end
end
