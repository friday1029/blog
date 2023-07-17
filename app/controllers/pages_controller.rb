class PagesController < ApplicationController
  def index
  end

  def about
    @about = PageBlock.find_or_create_by(meta_key: 'about')
  end
end
