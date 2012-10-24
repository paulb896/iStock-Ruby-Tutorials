class ArticlesController < ApplicationController
  before_filter :require_login, :except => [:index, :show, :byMonth]
  before_filter :verify_author, :only => [:edit, :update, :destroy]

  def initialize
    super
    @showMonthPicker = true
  end
  def verify_author
    article = Article.find(params[:id])
    if (article.author_id != current_user.id)
      redirect_to root_path
      return false
    end
  end
  def index
    # Get top 3 articles here
    @articles = Article.find(:all, :order => "views DESC", :limit => 3)
  end
  def show
    @article = Article.find(params[:id])
    @viewCount = @article.increment_views
    @comment = Comment.new
    @comment.article_id = @article.id
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(params[:article])
    @article.author_id = current_user.id
    @article.save
    
    flash[:message] = "Article '#{@article.title}' has been created!"
    
    redirect_to article_path(@article)
  end
  def destroy
    article = Article.find(params[:id])
    article.destroy
    
    flash[:message] = "Article '#{article.title}' has been deleted!"
    
    redirect_to articles_path
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])

    flash[:message] = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end
  def byMonth
    month = params[:month].to_i
    if (1..12).include?(month)
      @articles = Article.by_month(month)
    else
      @articles = Article.all
    end

    respond_to do |format|
      format.json { render :json => @articles }
      format.xml { render :layout => false }
    end
  end
end
