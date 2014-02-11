class Comment
  include Mongoid::Document
  belongs_to :post
  field :commenter, type: String
  field :body, type: String
  field :timestamp, type: Time
  validates :body, presence: true
end
