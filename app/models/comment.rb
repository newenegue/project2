class Comment
  include Mongoid::Document

  belongs_to :post
  field :commenter, type: String
  field :body, type: String
  field :timestamp, type: Time

  validates :body, presence: true

  def time_elapsed time
  	@comment = Comment.find(params[:id])
  	puts @comment.timestamp

  	# time_diff = TimeDifference.between(@comment.timestamp, Time.now).in_each_component
  	# seconds = time_diff[:seconds].to_i.to_s
  	# minutes = time_diff[:minutes].to_i.to_s
  	# hours = time_diff[:hours].to_i.to_s
  	# days = time_diff[:days].to_i.to_s
  	# weeks = time_diff[:weeks].to_i.to_s
  	# months = time_diff[:months].to_i.to_s
  	# years = time_diff[:years].to_i.to_s
  	# if years > 1
  	# 	years + ' years ago'
  	# elsif months > 1
  	# 	months + ' months ago'
  	# elsif weeks > 1
  	# 	weeks + ' weeks ago'
  	# elsif days > 1
  	# 	days + ' days ago'
  	# elsif hours > 1
  	# 	hours + ' hours ago'
  	# elsif minutes > 1
  	# 	minutes + ' minutes ago'
  	# else
  	# 	seconds + ' seconds ago'
  	# end
  end
end
