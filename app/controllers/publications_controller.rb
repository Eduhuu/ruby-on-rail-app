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
      redirect_to "/", notice:'Publicacion creada correctamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @publication = Publication.find(params[:id])
  end

  def update
    @publication = Publication.find(params[:id])
    if @publication.update(publication_params)
      redirect_to "/", notice:'Publicacion editada correctamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @publication = Publication.find(params[:id])
    @publication.destroy
    redirect_to "/", notice:"Publicacion eliminada correctamente.", status: :see_other
  end

  private
  
  def publication_params
    params.require(:publication).permit(:title,:content,:blocked,:image)
  end

end
