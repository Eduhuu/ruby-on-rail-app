class HomeController < ApplicationController

  include Pagy::Backend

  def index
    @pagy, @records = pagy(Publication.all)
  end
end
