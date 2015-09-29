class RidersController < ApplicationController

  def new
    @rider = User.new
  end

end
