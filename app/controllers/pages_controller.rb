class PagesController < ApplicationController

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end

  # POST pages/1/view?viewtime=1&city=Cambridge&country=US
  def view
    set_cors_headers
    if @page = Page.find(params[:id])
      @date = params[:month].to_i*1000 + params[:day].to_i
      @city = params[:city].to_s + ', ' + params[:country]
      @avg_time = @page.avg_time + params[:viewtime].to_f
      @new_time = @avg_time / @page.count.to_f
      @page.update_attributes(avg_time: @new_time, geo: @city)
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    set_cors_headers
    if @page = Page.find(params[:id])
      @graphs = @page.graphs
      @viewcount = @page.count + 1
      @page.update_attributes(count: @viewcount)
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = current.pages.build(params[:page])
    @page.update_attributes(count: 0, avg_time: 1, geo: 'None')

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find(params[:id])
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    respond_to do |format|
      format.html { render action: "new" }
    end
  end

  # OPTIONS
  def set_cors_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type, Origin, Referer, User-Agent'
    headers['Access-Control-Max-Age'] = '3600'
  end

  def resource_preflight
    set_cors_headers
    render :text => '', :content_type => 'text/plain'
  end

  def resource
    set_cors_headers
    render :text => 'OK here is your restricted resource!'
  end

end
