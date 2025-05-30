class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 40 }
  validates :content, presence: true
  validates :author, presence: true
  validates :published_at, presence: true

  scope :ordered_by_published_date, -> { order(published_at: :desc) }

  def as_json(options = {})
    {
      id: id,
      title: title,
      content: content,
      author: author,
      category: category,
      published_at: published_at.strftime('%Y-%m-%d')
    }
  end
end
