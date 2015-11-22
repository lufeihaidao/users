class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end
  def show
    @article = Article.find params[:id]
  end
  def new
    @article = Article.new
  end
  def create
    @article = current_user.articles.new article_params
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article }
      else
        format.html { render action: "new" }
      end
    end
  end
  def update
    respond_to do |format|
      if @article.update_attributes(article_params)
        format.html {redirect_to :back}
        format.js { render :layout => false }
      else
        format.html {render action: "edit"}
        format.js { render :layout => false }
      end
    end
  end
  def destroy
  end

  def top_touch
    @article = Article.find params[:id]
    @article.touch :top_touched_at
  end

  private
  def correct_user
    @article = Article.find params[:id]
    redirect_to(root_path) unless current_user?(@article.user)
  end

  def article_params
    params.require(:article).permit(:content, :title)
  end
end
