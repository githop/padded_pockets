class WelcomeController < ApplicationController
  def index
    @politicians = Politician.all
  end

  def congress_by_state(state)
    Politician.where(state: state)
  end
end
