class Article < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 3 }
    has_one_attached :image
    has_rich_text :body
  end