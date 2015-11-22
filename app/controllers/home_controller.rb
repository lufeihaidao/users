class HomeController < ApplicationController
  def index
    @article = Article.top_article
  end
end
