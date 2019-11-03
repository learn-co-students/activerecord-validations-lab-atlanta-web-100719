
class PostValidator < ActiveModel::Validator
  def validate(post)
    unless post.title =~ (/Won't Believe|Top \d+|Secret|Guess/)
      #gotta love regex
      post.errors[:title] << "Need clickbait worthiness please!"
    end
  end
end
