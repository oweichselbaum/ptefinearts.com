class PiecesController < ApplicationController
  before_filter :authenticate_admin!, :only => [:new, :create, :edit, :update, :destroy] 

  def show
    @artist = Artist.find(params[:artist_id])
    @artistpieces = @artist.pieces.order("id")
    @piece = @artistpieces.find(params[:id]) 
    @title = "Piece #{@piece.id}" 
    @actionClass = 'pieceshow'
    @firstpiece = @artistpieces.first
    @lastpiece = @artistpieces.last
    respond_to do |format|
      format.html do
        if request.xhr?
          render :partial => 'partials/pieces/show'
        end
      end
    end
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @piece = @artist.pieces.build
    @title = "Administrator | #{@artist.firstname} #{@artist.lastname} | Add Piece"
    @actionClass = 'newpiece'
    respond_to do |format|
      format.html do
        if request.xhr?
          render :partial => 'partials/pieces/new'
        end
      end
    end
  end
  
  def create
    @artist = Artist.find(params[:artist_id])
    @piece = @artist.pieces.build(params[:piece])
    if @piece.save
      flash[:success] = 'Piece Successfully Added'
      redirect_to admin_path
    else
      @title = "Administrator | #{@artist.name} | Add Piece"
      render 'new'
    end
  end

  def edit
    @artist = Artist.find(params[:artist_id])
    @piece = Piece.find(params[:id])
    @title = "Administrator | Edit Piece #{@piece.id}"
    @actionClass = 'editpiece'
    render :layout => 'application_admin'
  end
  
  def update
    @artist = Artist.find(params[:artist_id])
    @piece = Piece.find(params[:id])
    if @piece.update_attributes(params[:piece])
      flash[:success] = "Piece Information Successfully Update"
      redirect_to admin_path 
    else
      @title = "Edit #{@piece.title}"
      render 'edit'
    end
  end

  def destroy
    @artist = Artist.find(params[:artist_id])
    @piece = Piece.find(params[:id])
    @piece.destroy
    respond_to do |format|
      format.html { redirect_to(admin_path) }
    end
  end
end
