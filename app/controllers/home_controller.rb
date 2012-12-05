class HomeController < ApplicationController
  before_filter :authenticate_user!, :only => [:search]
  
  def index

  end

  def search
    @search_data = FbGraph::Searchable.search(params[:search][:search_content])    
  end
  
end
