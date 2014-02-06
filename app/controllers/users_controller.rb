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
	end

	def create
		User.create(user_params)
		redirect_to users_path
	end

	def update
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
