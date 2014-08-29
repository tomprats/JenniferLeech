class PagesController < ApplicationController
  def index
    @tags = Tag.all.select { |g| !g.items.empty? }
  end

  def about
  end
end
