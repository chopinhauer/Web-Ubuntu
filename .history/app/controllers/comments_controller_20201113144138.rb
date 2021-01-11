class CommentsController < ApplicationController

  def create 
    @article=Article.find(params[:article_id])
    @comment=@article.comments.create(params[:comment]).permit(:name,:comment))
    redirect_to article_path
  end

  def destroy 

  end
end
