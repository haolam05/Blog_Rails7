class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :body, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  # gem 'noticed'
  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :user
  # gem 'noticed'

  has_rich_text :body
  has_one :content, class_name: 'ActionText::RichText', as: :record, dependent: :destroy

  extend FriendlyId
  friendly_id :title, use: %i[slugged history finders]
  
  def should_generate_new_friendly_id?
    title_changed? || slug.blank?
  end
end
