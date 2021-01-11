class CommentsController < ApplicationController

  before_action :require_user , except: [:show , :index]

  def create 
    @article=Article.find(params[:article_id])
    @comment=@article.comments.create(params[:comment].permit(:name,:comment))
    redirect_to article_path(@article)
  end

  def destroy 
    @article=Article.find(params[:article_id])
    @comment=@article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
 
  private
  def require_admin 
    if !(logged_in? && current_user==@user)
      flash[:alert]="You have no permit for this action"
      redirect_to  categories_path
    end

    def require_same_user
      if current_user != @article.user && !current_user.admin?
        flash[:alert] =  "You can' delete this comment " 
      end 
    end
    public

end
