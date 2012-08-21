class PagesController < ApplicationController
  before_filter :authenticate_admin!, :only => [:admin, :adminartists, :adminevents]  

  def landing
    @actionClass = 'landing'
    render :layout => false 
  end

  def home
    @title = 'Home'
    @actionClass = 'home'
    @slideshowpieces = Piece.where("slideshow = ?", true)
    @orderedpieces = @slideshowpieces.order("slideshoworder")
    respond_to do |format|
      format.html do
        if request.xhr?
          render :partial => "partials/pages/home"
        end
      end 
    end
  end

  def about
    @title = 'About'
    @actionClass = 'about'
    respond_to do |format|
      format.html do
        if request.xhr?
          render :partial => "partials/pages/about"
        end
      end
    end
  end

  def contact
    @title = 'Contact'
    @actionClass = 'contact'
    respond_to do |format|
      format.html do
        if request.xhr?
          render :partial => "partials/pages/contact"
        end
      end
    end
  end

  def admin
    @title = 'Administrator'
    @actionClass = 'admin'
    render :layout => 'application_admin'
  end

  def adminartists
    @title = 'Administrator | Artists'
    @actionClass = 'adminartists'
    @artists = Artist.order("lastname")
    respond_to do |format|
      format.html do
        if request.xhr?
          render :partial => "partials/pages/adminartists"
        else
          render :layout => 'application_admin'
        end
      end
    end
  end

  def adminartistpieces
    @artist = Artist.find(params[:id])
    @artistpieces = @artist.pieces
  end  

  def adminevents
    @title = 'Administrator | Events'
    @actionClass = 'adminevents'
    @events = Event.all
    respond_to do |format|
      format.html do
        if request.xhr?
          render :partial => "partials/pages/adminevents"
        end
      end
    end
  end

end
