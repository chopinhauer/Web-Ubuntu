class CommentsController < ApplicationController



  def create 
    @article=Article.find(params[:article_id])
    @comment=@article.comments.create(params[:comment]).permit(:name,:comment))
    redirect_to article_path(@article)
  end

  def destroy 

  end

  private
   def comments_params 
    params.require(:category).permit(:name)
   end

end
