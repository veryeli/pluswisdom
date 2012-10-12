class ReviewsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :edit]
  before_filter :correct_user, only: [:destroy, :edit]

  def index
    if params[:tag]
      @articles = Article.tagged_with(params[:tag])
    else
      @articles = Article.all
    end
  end

  def destroy
    @review.destroy
    redirect_to root_url
  end

  def edit
  end

  def update
    @review = current_user.reviews.find_by_id(params[:id])
    if @review.update_attributes(params[:review])
      flash[:success] = "Review updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def create
    @review = current_user.reviews.build(params[:review])
    if @review.save
      flash[:success] = "Review created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  private

    def correct_user
      @review = current_user.reviews.find_by_id(params[:id])
      redirect_to root_url if @review.nil?
    end
end

