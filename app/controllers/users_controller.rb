class UsersController < ApplicationController
   before_action :signed_in_user, only: [:index, :edit, :update , :destroy]
   before_action :correct_user,   only: [:edit, :update]
   before_action :admin_user,     only: :destroy
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end



  def index
    @users = User.paginate(page: params[:page])
  end
  def show
    @user = User.find(params[:id])
  end
  
 

  
  

  def new
  	 @user = User.new
  end

  def edit
    
  end

   def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
    	flash[:success] = "Welcome to 408Textbooks"
      redirect_to @user
    else
      render 'new'
    end
  end

      private
      def admin_user
      redirect_to(root_url) unless current_user.admin?
      end

      def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
      end

    # Before filters



    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
    end

    def store_location
    session[:return_to] = request.url if request.get?
    end
end
