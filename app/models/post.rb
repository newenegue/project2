class Post
  include Mongoid::Document

  attr_accessor :image, :remote_image_url

  belongs_to :user

  field :title, type: String
  field :body, type: String

  validates :title, presence: true

  mount_uploader :image, ImageUploader
end
