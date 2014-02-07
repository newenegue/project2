class Post
  include Mongoid::Document

  # attr_accessor :image, :image_cache, :remote_image_url

  belongs_to :user
  has_many :comments, dependent: :destroy

  field :title, type: String
  field :body, type: String
  field :timestamp, type: Time

  validates :title, presence: true

  # mount_uploader :image, ImageUploader

  # validates_attachment_content_type :avatar, :content_type => %w(image/jpeg image/jpg image/png)
end
