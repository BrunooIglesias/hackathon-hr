class EventsController < ApplicationController
   # before_action :authenticate_user! # todo: fix this bug
  # TODO
  protect_from_forgery except: :create

  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    render json: @events
  end


   def show
     render json: @event
   end

   def edit
  end

   def create
     @event = Event.new(event_params)

     if @event.save
       render json: @event
     else
       render json: @event.errors, status: :unprocessable_entity
     end
   end


   def update
    if @event.update(event_params)
      render json: @event
    else
      render :edit
    end
  end

   def destroy
     @event.destroy
     head :no_content
   end

   private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :start_date, :end_date, :user_id)
  end
end
