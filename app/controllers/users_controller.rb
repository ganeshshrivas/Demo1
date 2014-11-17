class UsersController < ApplicationController
	 before_filter :find_user_id, only: [:show, :edit, :update,:destroy]
	def new
		@user=User.new
	end

	def index
		@users=User.all
	end

	def create
		@user=User.new(user_params)
		if @user.save
			 flash[:notice] = "user successfully created"
			redirect_to @user
		else
			flash[:error] = "something goes wrong"
			render 'new'
	  end
	end

	def show
    @user
  end

  def edit
    @user 
  end

  def update
    if @user.update(user_params)
    	flash[:notice] = "user successfully updated"
    	redirect_to @user
  	else
  		flash[:error] = "something goes wrong"
  		render 'edit'
  	end
  end

  def destroy
    if @user.destroy
    	flash[:notice] = "user successfully deleted"
    	redirect_to @user
    else
    	flash[:error] = "user not destroye"
    	render 'show'
    end
  end

	private
		def user_params
			params.require(:user).permit(:name,:email,:country,:date_of_birth,:mobile,:username,:password);
		end
		def find_user_id
			@user = User.find(params[:id])
		end
end
