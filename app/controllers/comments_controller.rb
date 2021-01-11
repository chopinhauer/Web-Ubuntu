class CommentsController < ApplicationController
  before_action :require_admin, except: [:show, :index, :create, :destroy]
  before_action :require_user, except: [:show, :index, :create]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(params[:comment].permit(:comment))
    @comment.user = current_user
    if @article.save
      flash[:notice] = "Comment  succesfully"
      redirect_to article_path(@article)
    else
      redirect_to article_path(@article)
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def require_admin
    if !(logged_in? && current_user == @user)
      flash[:alert] = "You have no permit for this action"
      redirect_to categories_path
    end
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in for that action"
      redirect_to login_path
    end
  end

  public
end
