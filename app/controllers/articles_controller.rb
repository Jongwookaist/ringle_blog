class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    increment_views_counter if current_user.email != @article.writer
  end


  def increment_views_counter
    @article.increment!(:views)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.views = 0
    if current_user
      @article.writer = current_user.email
    else
      @article.writer = "anonymous"
    end

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

def update
  @article = Article.find(params[:id])

  if @article.writer == current_user.email
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  else
    redirect_to root_path, alert: "You are not authorized to edit this article."
  end
end

def destroy
  @article = Article.find(params[:id])

  if @article.writer == current_user.email
    @article.destroy
    redirect_to articles_path, status: :see_other
  else
    redirect_to root_path, alert: "You are not authorized to delete this article."
  end
end

  private
    def article_params
      params.require(:article).permit(:title, :body, :image)
    end


end