class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def query
    content = params[:content]
    if (content.instance_of? String)
    end
    article = Article.new(content: params[:content])
    puts("Article Content is #{article.content}")
    result = FactChecker.perform(article)
    puts("result is #{result}")
    render :json => result
  end
end
