class ArtistsController < ApplicationController
  before_filter :authenticate_admin!, :only => [:new, :create, :edit, :update, :destroy]  
  require 'enumerator'

  def index
    @title = 'Artists'
    @actionClass = 'artistsindex'
    @artistcount = Artist.count
    @artists = Artist.order("lastname")
    @remainder = @artistcount % 5
    @firstartists = @artists.first((((@artistcount - (@artistcount % 5)) / 5) + 1) * (@artistcount % 5))
    @lastartists = @artists.last(@artistcount - ((((@artistcount - (@artistcount % 5)) / 5) + 1) * (@artistcount % 5)))
    respond_to do |format|
      format.html do
        if request.xhr?
          render :partial => 'partials/artists/index'
        end
      end
    end
  end

  def new
    @title = 'New Artist'
    @actionClass = 'newartist'
    @artist = Artist.new
    respond_to do |format|
      format.html do 
        if request.xhr?
          render :partial => 'partials/artists/new'
        end
      end
    end
  end
  
  def create
    @artist = Artist.new(params[:artist])
    @artists = Artist.all
    if @artist.save
      flash[:success] = 'New Artist Was Successfully Added'
      respond_to do |format|
        format.html { redirect_to admin_path }
      end
    else
      @title = 'New Artist'
      @actionClass = 'newartist'
      render 'new'
    end
  end
  
  def show
    @artist = Artist.find(params[:id])
    @artistpieces = @artist.pieces.order("id")
    @title = "#{@artist.firstname} #{@artist.lastname}"
    @actionClass = 'artistshow'
    respond_to do |format|
      format.html do
        if request.xhr?
          render :partial => 'partials/artists/show'
        end
      end
    end
  end

  def edit
    @artist = Artist.find(params[:id])
    @artistpieces = @artist.pieces
    @title = "Edit #{@artist.firstname} #{@artist.lastname}"
    @actionClass = 'artistedit'
    respond_to do |format|
      format.html do
        if request.xhr?
          render :partial => 'partials/artists/edit'
        end
      end
    end
  end
  
  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(params[:artist])
      flash[:success] = "Artist Information Successfully Update"
      redirect_to admin_path
    else
      @title = "Edit #{@artist.name}"
      render 'edit'
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    respond_to do |format|
      format.html do 
        if request.xhr?
          render :nothing => true 
        end 
      end
    end
  end

end
