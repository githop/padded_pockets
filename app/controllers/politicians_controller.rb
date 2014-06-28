class PoliticiansController < ApplicationController

  def show
    @politician = Politician.find_by_id(params[:id])
    if @politician.contributions.empty?
      @politician.fetch_donations
    end
  end
end
