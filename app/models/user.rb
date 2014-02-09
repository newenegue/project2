# authentication encryption
require 'bcrypt'

class User
  include Mongoid::Document

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  attr_accessor :password

  # user fields
  field :username, type: String
  field :email, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :blog_name, type: String
  field :hashed_password, type: String

  # field validations
  # required
  validates :username, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates :blog_name, presence: true, uniqueness: true
  validates :password, presence: true
  # optional
  validates :first_name, length: {maximum: 30}
  validates :last_name, length: {maximum: 30}
  

  # validate user password
  def authenticated? pwd
  	BCrypt::Password.new(self.hashed_password).is_password?(pwd)
  end

  # generate hashed password on save
  before_save :hash_pwd

private
  # create hashed password
  def hash_pwd
  	self.hashed_password = BCrypt::Password.create(self.password)
  	self.password = nil
  end
end
