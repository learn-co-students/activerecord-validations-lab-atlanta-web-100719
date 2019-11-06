class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(fiction non-fiction) }
  validate :is_clickbate

  def is_clickbate(post)
    unless post.title =~ (/Won't Believe|Top \d+|Secret|Guess/)
      #gotta love regex
      post.errors[:title] << "Need clickbait worthiness please!"
    end
  end
end
