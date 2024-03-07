class PublicationsController < ApplicationController
  def show
    @publication = Publication.find(params[:id])
  end
  def new
    @publication = Publication.new
  end
end
