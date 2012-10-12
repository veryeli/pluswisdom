class MicropostsController < ApplicationController
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
    @micropost.destroy
    redirect_to root_url
  end

  def edit
  end

  def update
    @micropost = current_user.microposts.find_by_id(params[:id])
    if @micropost.update_attributes(params[:micropost])
      flash[:success] = "Micropost updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  private

    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url if @micropost.nil?
    end
end

