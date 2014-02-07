class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
	end

	def new
		@user = User.new
	end

	def edit
		set_user
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to posts_path
		else
			redirect_to new_user_path
		end

	end

	def update
		if set_user.update(user_params)
			redirect_to posts_path
		else
			redirect_to edit_user_path
		end
	end

	def destroy
		@user.destroy
	end

private
	def set_user
		@user = User.find(params[:id])
	end
	def user_params
		params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :blog_name)
	end
end
