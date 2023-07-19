class WorksController < ApplicationController
  def index
    @works = Work.order(:id)
  end
  
  def show
    @work = Work.includes(:site_screenshots).find(params[:id])
  end
end
