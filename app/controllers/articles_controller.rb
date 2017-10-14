class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    # Perform the fact checking and display the results
    results = FactChecker.perform(article)
  end

  private
    def article_params
      params.require(:article).permit([:content])
    end
end
