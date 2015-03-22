class PagesController < ApplicationController

  layout "welcome"

  def index
    @minimum_password_length = 8
  end

end 
