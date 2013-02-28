class StaticPagesController < ApplicationController
  def StaticPages
  end

  def home
    if signed_in?
      @project  = current_user.projects.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
