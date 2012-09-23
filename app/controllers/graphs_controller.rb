class GraphsController < ApplicationController

  # GET 'graphs'
  def index
    set_cors_headers
    @date_input = params[:date]
    @page_id = params[:page_id]
    @count = params[:view_count]
    if Graph.find_by_page_id_and_date(@page_id, @date_input)
      # if graph for page and date exists, just updated the count
      Graph.find_by_page_id_and_date(@page_id, @date_input).update_attributes(view_count: @count)
    else
      # otherwise, create a new graph object
      @graph = Graph.new()
      @graph.update_attributes(page_id: @page_id, date: @date_input, view_count: @count)
    end
    @graphs = Graph.all
  end

  def set_cors_headers
    headers["Access-Control-Allow-Origin"] = "*"
    headers["Access-Control-Allow-Methods"] = "POST, GET, OPTIONS"
    headers["Access-Control-Allow-Headers"] = "Content-Type, Origin, Referer, User-Agent"
    headers["Access-Control-Allow-Max-Age"] = "3600"
  end

  def resource_preflight
    set_cors_headers
    render :text => "", :content_type => "text/plain"
  end

  def resource
    set_cors_headers
    render :text => "OK here is your restricted resource!"
  end
end
      
