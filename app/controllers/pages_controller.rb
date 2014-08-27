class PagesController < ApplicationController
  def index
    @galleries = Gallery.all.select { |g| !g.items.empty? }
  end

  def about
  end
end
