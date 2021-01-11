class LikesController < ApplicationController
  before_action :find_post  def create
    @article.likes.create(user_id: current_user.id)
    redirect_to article_path(@article)
  end  private  def find_post
    @post = Article.find(params[:post_id])
  end

  private
  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end
  public 
  
end
