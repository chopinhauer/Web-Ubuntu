class UsersController < ApplicationController

  before_action :set_user , only: [:show,:edit,:update , :destroy]
  before_action :require_user , only: [:edit , :update ]
  before_action :require_same_user , only: [:edit , :update , :destroy]

  def show
    @article= @user.articles
    @article_user = @article.article_params
  end

  def index 
    @users=User.all.order("created_at ASC")
    
    @article_user = user_params.articles.article_params
  end

  def new
    @user=User.new 
  end

  def create
    @user=User.new(user_params)
    if @user.save
      session[:user_id]= @user.id
      flash[:notice] = "Welcome to my blog my favorite blogger #{@user.username.capitalize} "
      redirect_to articles_path
    else
      render 'new'
    end
  end 

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] =  "Account was succesfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy   
    if @user==current_user
      @user.destroy
      session[:user_id]=nil 
      flash[:notice]="Account has been deleted successfully . Take care of yourself, see you soon ! "
      redirect_to root_path
     else
      @user.destroy
      flash[:notice]="Account has been deleted successfully by Admin"
      redirect_to users_path
     end  
  end
 
  private
  def user_params
    params.require(:user).permit( :username , :email , :password)
  end

  def set_user
    @user=User.find(params[:id])
  end

  def require_same_user
    if current_user!= @user && !current_user.admin?
      flash[:alert] = "You can only edit your own profile"
      redirect_to @user
    end
  end

  def article_params
    params.require(:article).permit(:tittle, :description , :image , category_ids: [] )
  end

  public

end
