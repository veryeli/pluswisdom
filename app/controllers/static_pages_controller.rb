class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      if params[:tag]
        @feed_items = current_user.feed.tagged_with(params[:tag]).paginate(page: params[:page])
      end
    end
  end

  def help
  end

  def about
  end

  def contact
  end

end
