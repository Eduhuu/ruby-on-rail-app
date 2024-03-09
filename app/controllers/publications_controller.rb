class PublicationsController < ApplicationController
  def show
    @publication = Publication.find(params[:id])
  end
  def new
    @publication = Publication.new
  end
  def create
    @publication = Publication.new(
      publication_params.merge(
        blocked: false,
      )
    )

    if @publication.save
      redirect_to "/" 
    else
      render :new, status: :unprocessable_entity
    end

  end

  private
  
  def publication_params
    params.require(:publication).permit(:title,:content,:blocked)
  end

end
