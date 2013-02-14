class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @review  = current_user.reviews.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      if params[:tag]
        @feed_items = current_user.feed.tagged_with(params[:tag]).paginate(page: params[:page])
      end
    end
  end

  def explore
    todo = "Fix this - it isn't sorting"
    @feed_items = Review.paginate(page: params[:page]).find_with_reputation(:votes, :all, order: 'votes desc')
  end


  def help
  end

  def about
  end

  def blog
    @blogs = Blog.all
  end

  def review
    @review  = current_user.reviews.build
  end

  def contact
  end

end
