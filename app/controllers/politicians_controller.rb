class PoliticiansController < ApplicationController

  def show
    @politician = Politician.find_by_id(params[:id])
  end

end
