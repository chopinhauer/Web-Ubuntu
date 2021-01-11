class LikesController < ApplicationController
  before_action :find_post  def create
    @article.likes.create(user_id: current_user.id)
    redirect_to post_path(@article)
  end  private  def find_post
    @post = Article.find(params[:post_id])
  end
end
