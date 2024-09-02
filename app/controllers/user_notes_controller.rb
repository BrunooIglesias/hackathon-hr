class UserNotesController < ApplicationController
  before_action :set_user_note, only: [:show, :update, :destroy]
  before_action :authorize_user_note, only: [:show, :update, :destroy]

  def index
    @user_notes = policy_scope(UserNote)
    render json: @user_notes
  end

  def show
    render json: @user_note
  end

  def create
    @user_note = UserNote.new(user_note_params)
    authorize @user_note

    if @user_note.save
      render json: @user_note, status: :created
    else
      render json: @user_note.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @user_note
    if @user_note.update(user_note_params)
      render json: @user_note
    else
      render json: @user_note.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @user_note
    @user_note.destroy
    head :no_content
  end

  private

  def set_user_note
    @user_note = UserNote.find(params[:id])
  end

  def authorize_user_note
    authorize @user_note
  end

  def user_note_params
    params.require(:user_note).permit(:content, :user_id, :manager_id)
  end
end
