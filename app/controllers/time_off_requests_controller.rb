class TimeOffRequestsController < ApplicationController
  before_action :set_time_off_request, only: [:show, :edit, :update, :destroy]
  before_action :authorize_time_off_request, only: [:show, :edit, :update, :destroy]

  def index
    @time_off_requests = policy_scope(TimeOffRequest)
  end

  def show
  end

  def create
    @time_off_request = TimeOffRequest.new(time_off_request_params)
    @time_off_request.user = current_user
    authorize @time_off_request

    if @time_off_request.save
      redirect_to @time_off_request, notice: 'Time off request was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @time_off_request
    if @time_off_request.update(time_off_request_params)
      redirect_to @time_off_request, notice: 'Time off request was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @time_off_request
    @time_off_request.destroy
  end

  private

  def set_time_off_request
    @time_off_request = TimeOffRequest.find(params[:id])
  end

  def authorize_time_off_request
    authorize @time_off_request
  end

  def time_off_request_params
    params.require(:time_off_request).permit(:start_date, :end_date, :approved_by_id)
  end
end
