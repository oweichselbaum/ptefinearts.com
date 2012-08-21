class EventsController < ApplicationController
  before_filter :authenticate_admin!, :only => [:new, :create, :edit, :update, :destroy] 

  def index
    @title = 'Events'
    @actionClass = 'eventsindex'
    @events = Event.order("created_at DESC")
    respond_to do |format|
      format.html do
        if request.xhr?
          render :partial => 'partials/events/index'
        end
      end
    end 
  end

  def new
    @title = 'New Event'
    @actionClass = 'eventsnew'
    @event = Event.new
    render :layout => 'application_admin'
  end
  
  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:success] = 'New Event was Successfully Added'
      redirect_to admin_path 
    else
      @title = 'New Event'
      @actionClass = 'eventsnew'
      render 'edit'
    end
  end

  def edit
    @event = Event.find(params[:id])
    @actionClass = 'eventsedit'
    @title = "Edit Event #{@event.id}"
    render :layout => 'application_admin'
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:success] = 'Event Updated Successfully'
      redirect_to admin_path
    else
      @title = "Edit Event #{@event.id}"
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    respond_to do |format|
      format.html do
        if request.xhr?
          render :nothing => true
        end
      end
    end
  end

end
