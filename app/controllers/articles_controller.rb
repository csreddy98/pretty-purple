class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  # GET /articles -- List all articles ordered by published date
  def index
    @articles = Article.ordered_by_published_date
    render json: @articles
  end

  # GET /articles/:id -- Show a specific article
  def show
    render json: @article
  end

  # POST /articles -- Create a new article
  def create
    @article = Article.new(article_params)
    
    if @article.save
      render json: @article, status: :created
    else
      head :unprocessable_entity
    end
  end

  # DELETE, PUT, PATCH methods are not allowed 
  def method_not_allowed
    head :method_not_allowed
  end

  private

  def set_article
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def article_params
    params.permit(:title, :content, :author, :category, :published_at)
  end
end
