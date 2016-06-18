class SearchController < ApplicationController
  def animals
    @animals = Animal.search(params[:q])
  end
end
