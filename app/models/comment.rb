class Comment
  include Mongoid::Document

  belongs_to :post
  field :commenter, type: String
  field :body, type: String

  validates :body, presence: true
end
