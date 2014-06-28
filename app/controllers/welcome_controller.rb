class WelcomeController < ApplicationController
  def index
    @politicians = Politician.all
  end

  def congress_by_state
    respond_to do |format|
      format.json {render json: Politician.where(state: params[:state]).to_json }
    end
  end
end
