class CommentsController < ApplicationController



  def create 
    @article=Article.find(params[:article_id])
    @comment=@article.comments.create(params[:comment].permit(:name,:comment))
    params.require(:category).permit(:name)
    redirect_to article_path(@article)
  end

  def destroy 

  end
 

end
