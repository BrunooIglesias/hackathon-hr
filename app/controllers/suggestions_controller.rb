class SuggestionsController < ApplicationController
  # TODO
  protect_from_forgery except: :create
  def create
    @suggestion = Suggestion.new(suggestion_params)
    
    if @suggestion.save
      render json: { message: 'Suggestion submitted successfully' }, status: :created
    else
      render json: { errors: @suggestion.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:title, :description, :date)
  end
end
