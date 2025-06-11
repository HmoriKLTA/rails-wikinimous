class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    # No single article page
  end

  def new
    @article = Article.new
  end

  def edit
    # No ability to edit article page
  end

  def create
    @article = Article.new(article_params) # Creates new task instance
    if @article.save
    # when it saves -> go to the tasks show page
      redirect_to article_path(@article)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id]) # Find the task with the id.
    @article.destroy # then destroy ruby method
    redirect_to articles_path, status: :see_other # redirects to home
  end

  private

  def article_params
    # Strong params - whitelisting the attributes users can gives us in the form.
    params.require(:article).permit(:title, :content)
  end
end
