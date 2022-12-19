class ArticlesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    articles = Article.all.includes(:user).order(created_at: :desc)
    render json: articles, each_serializer: ArticleListSerializer
  end

  def show
    # first request set page to 0
    session[:page_views] ||= 0
     #increase counter by 1 
     session[:page_views] += 1
    #render json conditionally 
    if session[:page_views] <= 3
      article = Article.find(params[:id])
      # render json: { session: session}
      render json: article, status: :ok
    else 
      render json: {error: "Maximum pageview limit reached"}, status: :unauthorized
    end
  end

  private

  def record_not_found
    render json: { error: "Article not found" }, status: :not_found
  end

end
