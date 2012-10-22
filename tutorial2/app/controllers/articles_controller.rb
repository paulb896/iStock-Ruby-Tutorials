class ArticlesController < ApplicationController
  before_filter :require_login, :except => [:index, :show, :byMonth]
  before_filter :verify_author, :only => [:edit, :update, :destroy]

  def verify_author
    article = Article.find(params[:id])
    if (article.author_id != current_user.id)
      redirect_to root_path
      return false
    end
  end
  def index
    @articles = Article.all
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
    #@articles = Article.find(:all, :conditions => ["date(created_at) BETWEEN ? AND ? ", '2012-10-01','2012-10-11'])
    @articles = Article.by_month(params[:month].to_i)
    #render :json => @articles
    respond_to do |format|
      format.json { render :json => @articles }
      format.rss { render :layout => false }
    end
  end
end
