class PostsController < ApplicationController
	def index
		if !current_user
			params[:show] = 'all'
		end
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
		set_post
	end

	def new
		@post = Post.new
	end

	def edit
		set_post
	end

	def create
		# Post.create(post_params)
		# Create post through current user
		@user = current_user
		@post = @user.posts.create(post_params)
		redirect_to @post
	end

	def update
		if set_post.update(post_params)
			redirect_to post_path
		else
			redirect_to edit_post_path
		end
	end

	def destroy
		set_post.destroy
		redirect_to posts_path
	end

private
	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body, :image, :remote_image_url)
	end

end
