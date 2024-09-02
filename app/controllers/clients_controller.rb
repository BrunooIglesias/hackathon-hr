class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  include Pundit

  def index
    @clients = policy_scope(Client)
    authorize @clients
  end

  def show
    authorize @client
  end

  def new
    @client = Client.new
    authorize @client
  end

  def edit
    authorize @client
  end

  def create
    @client = Client.new(client_params)
    authorize @client

    if @client.save
      redirect_to @client, notice: 'Client was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @client

    if @client.update(client_params)
      redirect_to @client, notice: 'Client was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @client
    @client.destroy
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :timezone, :contact_email)
  end

  def admin_only
    unless current_user.admin?
      redirect_to root_path, alert: 'Access denied. Admins only.'
    end
  end
end
