class CommentsController < ApplicationController

  def create 
    @article=Article.find(params[:article_id])
  end

  def destroy 
    
  end
end
