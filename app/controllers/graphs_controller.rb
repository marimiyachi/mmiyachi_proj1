class GraphsController < ApplicationController

  def index
    @date_input = params[:date]
    @page_id = params[:page_id]
    @count = params[:view_count]
    if Graph.find_by_page_id(@page_id)
      if Graph.find_by_page_id(@page_id).date == @date_input
        Graph.find_by_page_id(@page_id).update_attributes(view_count: @count)
      else
        @graph = Graph.new()
        graph.update_attributes(page_id: @page_id, date: @date_input, view_count: @count)
      end
    else
      @graph = Graph.new()
      @graph.update_attributes(page_id: @page_id, date: @date_input, view_count: @count)
    end
    @graphs = Graph.all
  end
end
      
