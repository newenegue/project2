class Like
  include Mongoid::Document

  # attr_accessor :user, :post
  
  belongs_to :user
  belongs_to :post
end
