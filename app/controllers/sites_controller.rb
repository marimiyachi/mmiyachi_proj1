class SitesController < ApplicationController
  # GET /sites
  # GET /sites.json
  # Show HTML page of site id numbers and visit counts
  def index
    @sites = Site.all
  end

  # GET /sites/1/visit
  # Register visit to [id number] site
  def visit
    @site = Site.find(params[:id])
    @viewcount = @site.count + 1
    @site.update_attributes(count: @viewcount)
  end

end
