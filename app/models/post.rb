class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  # Add custom validation
  validate :no_restricted_words

  private

  # List of restricted words
  RESTRICTED_WORDS = ["Trump", "Harris"]

  # Custom validation method to check for restricted words
  def no_restricted_words
    RESTRICTED_WORDS.each do |word|
      if content.match?(/\b#{word}\b/i)
        errors.add(:content, "contains restricted political content (e.g., '#{word}')")
      end
    end
  end
end
