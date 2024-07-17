class HomeController < ApplicationController
  skip_before_action :protect_route, only: [:index]
  include Pagy::Backend

  def index
    @pagy, @records = pagy(Publication.all)
  end
end
