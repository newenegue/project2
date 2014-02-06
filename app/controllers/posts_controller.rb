class PostsController < ApplicationController
	def index
		if params[:show] == 'all'
			@posts = Post.all
		else
			# show only current users posts
			@posts = current_user.posts
		end

		# show param access in html
		@show = params[:show]
	end

	def show
		
	end

	def new
		@post = Post.new
	end

	def edit
		
	end

	def create
		# Post.create(post_params)
		# Create post through current user
		current_user.posts.create(post_params)
		redirect_to posts_path
	end

	def update
		
	end

	def destroy
		@post.destroy
	end

	def image
	    content = @post.image.read
	    if stale?(etag: content, last_modified: @post.updated_at.utc, public: true)
	      send_data content, type: @post.image.file.content_type, disposition: "inline"
	      expires_in 0, public: true
	    end
	end

private
	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body, :image, :remote_image_url)
	end

end
