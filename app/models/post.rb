class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }

  #   validate :pass_test

  #   def pass_test
  #     errors.add(:title, 'title not click-baitey enough') if title == 'True Facts'
  #   end

  validate :clickbait

  def clickbait
    unless title =~ /Won't Believe|Secret|Top [0-9]+|Guess/
      errors.add(:title, 'title not click-baitey enough')
    end
  end
end
